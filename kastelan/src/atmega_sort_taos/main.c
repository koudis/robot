#include <avr/io.h>
#include <avr/interrupt.h>
#include <taos.h>

#define TWI_WAIT()     while (!(TWCR & (1<<TWINT)));
#define TWI_CHECK()    (TWCR & (1<<TWINT))

#define I2C_ADDRESS 0x71

#define STD_SERVO_OFFSET 522
// EXT_SERVO_OFFSET = STD_SERVO_OFFSET - 256
#define EXT_SERVO_OFFSET 266

unsigned char regs[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
unsigned char answr=0;
unsigned char update=0;
unsigned char mereni_color=0;
unsigned char mereni=0;

int white_w = 2260; // Hodnota bile barvy.
int white_r = 840;
int white_b = 956;
int white_thr= 1792; // Prah, vsechna mensi cisla jsou puky, vsechna vetsi je bila barva

ISR(TIMER0_OVF_vect) {
  mereni++;
  if (mereni == 0) //saturation
    mereni = 0xFF;
}

ISR(TIMER1_CAPT_vect) { //presne 50Hz
  unsigned char now = TCNT0; //mereni se nezmeni, protoze pri vstupu do ISR jsou automaticky zakazany vsechny interrupty
  TCNT0 = 0; //start measurement now!
  TIFR = TIFR; //clear TIMER0_OVF
  if (mereni_color) {
    mereni_color--;
    if (mereni_color < 4) {
      regs[(mereni_color<<1)+PSCRH] = mereni;
      regs[(mereni_color<<1)+PSCRL] = now;
      PORTC &= 0xFC;
      PORTC |= 0x03 & (mereni_color - 1);
    }
    if (regs[PSSR] & (1<<PSSE)) {//automaticke trideni
      if (mereni_color == 0) {
        mereni_color = 3;
        PORTC &= 0xFE;
        PORTC |= 0x02;
      }
      if (((regs[PSCWH] << 8) + regs[PSCWL]) < white_thr) {// PSCW < prah
        int dw = white_w - (regs[PSCWH] << 8) - regs[PSCWL];// toto jsou hodnoty bile barvy (od ni se odecte aktualni)
        int dr = white_r - (regs[PSCRH] << 8) - regs[PSCRL];
        int db = white_b - (regs[PSCBH] << 8) - regs[PSCBL];

        if ((dw/8) > (db - dr)) {// je to modrejsi (modry puk ma pravou zavorku temer nulovou, cerveny puk hodne velkou radove 340) Pokud je mezi cervenymi puky i modry, tak bychom meli pravou stranu zvysit (snizit delitele)
          OCR1A = STD_SERVO_OFFSET + (regs[PSFPB]<<1);
        }
        else {
          OCR1A = STD_SERVO_OFFSET + (regs[PSFPR]<<1);
        }
      }
      else
        OCR1A = STD_SERVO_OFFSET + (regs[PSFPC]<<1);// bila
    }
    else {
      regs[PSSR] &= ~(1<<PSGC);
    }
  }
  else {
    TIMSK &= ~((1<<TICIE1) | (1<<TOIE0)); //disable counter0, timer1 irq
    TCCR0 &= ~((1<<CS02) | (1<<CS01) | (1<<CS00)); //disable counter0
  }
  mereni = 0;
}

inline void update_status() {
  update=0;
  if (regs[PSSR] & (1<<PSSE)) {
    regs[PSSR] |= (1<<PSGC);// PSSE znamena, ze se sbira barva
  }
  if (regs[PSSR] & (1<<PSSW)) {
    white_w = (regs[PSCWH] << 8) + regs[PSCWL];// toto jsou hodnoty bile barvy (od ni se odecte aktualni)
    white_r = (regs[PSCRH] << 8) + regs[PSCRL];
    white_b = (regs[PSCBH] << 8) + regs[PSCBL];
    regs[PSSR] &= ~(1<<PSSW);
  }
  if (regs[PSSR] & (1<<PSST)) {
    white_thr = (regs[PSCWH] << 8) + regs[PSCWL]; // Prah, prahuje se pouze podle bile barvy
    regs[PSSR] &= ~(1<<PSST);
  }
  if (regs[PSSR] & (1<<PSGW)) {
    regs[PSCWL] = white_w & 0xFF; // toto jsou hodnoty bile barvy (od ni se odecte aktualni)
    regs[PSCWH] = white_w >> 8;
    regs[PSCRL] = white_r & 0xFF;
    regs[PSCRH] = white_r >>8;
    regs[PSCBL] = white_b & 0xFF;
    regs[PSCBH] = white_b >>8;
    regs[PSSR] &= ~(1<<PSGW);
  }
  if (regs[PSSR] & (1<<PSGT)) {
    regs[PSCWL] = white_thr & 0xFF; // Prah, prahuje se pouze podle bile barvy
    regs[PSCWH] = white_thr >> 8;
    regs[PSSR] &= ~(1<<PSGT);
  }
  if (regs[PSSR] & (1<<PSFE)) { //servo enable
    DDRB |= _BV(PB1) | _BV(PB2);
  }
  else {
    DDRB &= (~_BV(PB1)) & (~_BV(PB2));
  }
  if (regs[PSSR] & (1<<PSGC)) { //get color (flag is cleared after measurement)
    cli();
    TIMSK |= (1<<TOIE0) | (1<<TICIE1);  //enable counter0, timer1 irq
    TCCR0 |= (1<<CS02) | (1<<CS01) | (1<<CS00); //enable counter0 (rising edge)
    mereni_color = 6;
    PORTC |= 0x03;
    sei();
  }
  if (regs[PSSR] & (1<<PSLE)) { //light on
    PORTB |= _BV(PB6); //light on
  }
  else {
    PORTB &= ~_BV(PB6); // light off
  }
}

int main(void) {
  OCR1A = 778;//default servo position
  OCR1B = 778;//default servo position
  ICR1 = 10347;                        //50Hz
  TCCR1A = (1<<COM1A1) | (1<<COM1B1);  //Timer1
  TCCR1B = (1<<WGM13) | (1<<CS11);     //Timer1

  PORTB &= ~_BV(PB6); //light off
  DDRB  |= _BV(PB6);  //enable light control

  DDRC |= 0x03; //enable sensor color select

  TWAR = I2C_ADDRESS << 1;
  TWCR = (1<<TWEA) | (1<<TWEN); //enable twi

  while(1) {
    if (update)
      update_status();
    if (regs[PSSR] & (1<<PSSE)) {
      //check timer -> sort
    }
    if (TWI_CHECK()) {
      if ((TWSR & 0xF8) == 0x60) { //slave receive
        TWCR |= (1<<TWINT); //clear TWINT
        TWI_WAIT();

        unsigned char reg=0xFF;
        if ((TWSR & 0xF8) == 0x80) {
          reg = TWDR;
          TWCR |= (1<<TWINT); //clear TWINT
          TWI_WAIT();
        }

        if ((TWSR & 0xF8) == 0x80) {
          if (reg <= PSFPC)
            regs[reg] = TWDR;
          if (reg == PSFP)
            OCR1A = STD_SERVO_OFFSET + (TWDR<<1);
          if (reg == PSF2P)
            OCR1B = STD_SERVO_OFFSET + (TWDR<<1);
          if (reg == PSFEP)
            OCR1A = EXT_SERVO_OFFSET + (TWDR<<2);
          if (reg == PSF2EP)
            OCR1B = EXT_SERVO_OFFSET + (TWDR<<2);
          if (reg == PSSR)
            update=1;
          TWCR &= ~(1<<TWEA); //disable ACK
          TWCR |= (1<<TWINT);
          TWI_WAIT();
        }
        else
          answr = reg;

        if ((TWSR & 0xF8) == 0x88)
          TWCR |= (1<<TWINT) | (1<<TWEA);

        if ((TWSR & 0xF8) == 0xA0)
          TWCR |= (1<<TWINT) | (1<<TWEA);
      }
      else if ((TWSR & 0xF8) == 0xA8) { //slave transmitt
       do {
          if (answr <= PSFPC)
            TWDR = regs[answr];
          if (answr == PSFP)
            TWDR = (OCR1A - STD_SERVO_OFFSET) >> 1;
          if (answr == PSF2P)
            TWDR = (OCR1B - STD_SERVO_OFFSET) >> 1;
          if (answr == PSFEP)
            TWDR = (OCR1A - EXT_SERVO_OFFSET) >> 2;
          if (answr == PSF2EP)
            TWDR = (OCR1B - EXT_SERVO_OFFSET) >> 2;

          //TWCR &= ~(1<<TWEA); //disable ACK
          TWCR |= (1<<TWINT); //clear TWINT
          answr++;

          TWI_WAIT();
        } while ((TWSR & 0xE8) == 0xA8); // ACK has been returned (sla+r || data send)

        if ((TWSR & 0xF0) == 0xC0) //0xC0 or 0xC8
          TWCR |= (1<<TWINT) | (1<<TWEA);
      }
      if ((TWSR & 0xF8) == 0x00)
        TWCR |= (1<<TWINT) | (1<<TWSTO) | (1<<TWEA);
    }
  }
}
