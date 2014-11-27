#include <avr/io.h>
#include <avr/interrupt.h>
#define TWI_WAIT()     while (!(TWCR & (1<<TWINT)));
#define TWI_CHECK()    (TWCR & (1<<TWINT))

#define I2C_ADDRESS 0x77

//default note length
#define DEF_LEN 0x08
//error note
#define ERROR_NOTE 0x30
#define ERROR_LENGTH 0x80
#define MAX_LENGTH 256

unsigned char note[MAX_LENGTH];
unsigned char length[MAX_LENGTH];

unsigned char beeping=0;
unsigned char beep_length=0;
unsigned char timer0_remain=0;

#include <tuning.h> //const unsigned int tuning[0x10]

void play() {
  if (beeping < beep_length) {
    unsigned int base = tuning[note[beeping]&0x0F];
    unsigned char shift = (note[beeping]&0xF0) >> 4;
    base = base >> shift;
    ICR1 = base;           //TODO nejaky lepsi prevod z tonu
    base = base >> 1;
    OCR1A = base;   //TODO

    TCNT0 = 0;
    TIFR = TIFR; //clear TIMER0_OVF
    timer0_remain = length[beeping];

    DDRB |= _BV(PB1); // sound enable
    TCNT1 = 0; // prevent missing overflow compare
    beeping++;
  }
  else {
    beep_length = 0;
    beeping = 0;
    DDRB &= (~_BV(PB1));
  }
}

ISR(TIMER0_OVF_vect) {
  timer0_remain--;
  if (!timer0_remain)
    play();
}

int main(void) {
  cli();
  ICR1 = 10347;//50Hz // just some defaults
  OCR1A = ICR1 >> 1;  // just some defaults

  TCCR1A = (1<<COM1A1);            // Timer1 (PWM)
  TCCR1B = (1<<WGM13) | (1<<CS11); // Timer1 (PWM)
  TCCR0 |= (1<<CS02);              //enable timer0, clk_IO / 256
  TIMSK |= (1<<TOIE0);             //enable timer0 irq (software extended)

  TWAR = I2C_ADDRESS << 1;
  TWCR = (1<<TWEA) | (1<<TWEN); //enable twi

//beep at boot disabled
#if 0
beeping=0;
beep_length=3;
note[0]=0x50;
length[0]=0x04;
note[1]=0x54;
length[1]=0x04;
note[2]=0x57;
length[2]=0x04;
play();
sei();
#endif

  while(1) {
    if (!beep_length) // nothing to play
      cli();          // stop playing
    if (TWI_CHECK()) {
      if ((TWSR & 0xF8) == 0x60) { //slave receive
        TWCR |= (1<<TWINT); //clear TWINT
        TWI_WAIT();

        unsigned char len=0x00;
        if ((TWSR & 0xF8) == 0x80) {
          len = TWDR;
          if (!len)
            TWCR &= ~(1<<TWEA); //disable ACK
          TWCR |= (1<<TWINT); //clear TWINT
          cli();               // stop, we will change beep_length
          DDRB &= (~_BV(PB1)); // slow I2C -> disable sound
//buffer is large enought
//          if (len > MAX_LENGTH)
//            len = MAX_LENGTH;
          beep_length = 0;
          beeping = 0;
          TWI_WAIT();
        }

        while (len) {
          if ((TWSR & 0xF8) == 0x80) {
            note[beep_length] = TWDR;
            TWCR |= (1<<TWINT);
            TWI_WAIT();
          }
          if ((TWSR & 0xF8) == 0x80) {
            length[beep_length] = TWDR;
            len--;
            beep_length++;
            if (!len)
              TWCR &= ~(1<<TWEA); //disable ACK
            TWCR |= (1<<TWINT);
            TWI_WAIT();
          }
          else {
            length[beep_length] = DEF_LEN;
            beep_length++;
//buffer is large enought
//            if (beep_length == MAX_LENGTH)  // we do not want to overflow when signalizing error
//              beep_length = MAX_LENGTH - 1;
            note[beep_length] = ERROR_NOTE; // signalize I2C error at the end of the message (at the begining if beep_length overflow)
            length[beep_length] = ERROR_LENGTH;
            beep_length++;
            len = 0;
          }
        }

        if ((TWSR & 0xF8) == 0x88)
          TWCR |= (1<<TWINT) | (1<<TWEA);

        if ((TWSR & 0xF8) == 0xA0)
          TWCR |= (1<<TWINT) | (1<<TWEA);


        play();
        sei();
      }
      else if ((TWSR & 0xF8) == 0xA8) { //slave transmitt
        if (!beep_length)
          TWDR = 0;
        else
          TWDR = beep_length - beeping + 1; // return count of remaining tones (including tone played)
        TWCR &= ~(1<<TWEA); //disable ACK
        TWCR |= (1<<TWINT); //clear TWINT
        TWI_WAIT();

        if ((TWSR & 0xF0) == 0xC0) //0xC0 or 0xC8
          TWCR |= (1<<TWINT) | (1<<TWEA);
      }
      if ((TWSR & 0xF8) == 0x00)
        TWCR |= (1<<TWINT) | (1<<TWSTO) | (1<<TWEA);
    }
  }
}
