#include <avr/io.h>
#include <avr/interrupt.h>
#include "atmega_servo.h"
#define TWI_WAIT()     while (!(TWCR & (1<<TWINT)));
#define TWI_CHECK()    (TWCR & (1<<TWINT))

#define I2C_ADDRESS AS_I2C_ADDRESS

//#define STD_SERVO_OFFSET 522
#define STD_SERVO_OFFSET 544
// EXT_SERVO_OFFSET = STD_SERVO_OFFSET - 256
//#define EXT_SERVO_OFFSET 266
#define EXT_SERVO_OFFSET 288

unsigned char regs[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
unsigned char answr=0;
unsigned char update=0;
unsigned char mereni_color=0;
unsigned char mereni=0;

inline void update_status() {
  if (regs[AS_SR] & (1<<AS_SE)) { //servo enable
    DDRB |= _BV(PB1) | _BV(PB2);
  }
  else {
    DDRB &= (~_BV(PB1)) & (~_BV(PB2));
  }
}

int main(void) {
  OCR1A = STD_SERVO_OFFSET + 256;//default servo position
  OCR1B = STD_SERVO_OFFSET + 256;//default servo position
  ICR1 = 10347;                        //50Hz
  TCCR1A = (1<<COM1A1) | (1<<COM1B1);  //Timer1
  TCCR1B = (1<<WGM13) | (1<<CS11);     //Timer1

  TWAR = I2C_ADDRESS << 1;
  TWCR = (1<<TWEA) | (1<<TWEN); //enable twi

  while(1) {
    if (update)
      update_status();
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
          if (reg == AS_SR)
            regs[reg] = TWDR;
          if (reg == AS_SS1)
            OCR1A = STD_SERVO_OFFSET + (TWDR<<1);
          if (reg == AS_SS2)
            OCR1B = STD_SERVO_OFFSET + (TWDR<<1);
          if (reg == AS_ES1)
            OCR1A = EXT_SERVO_OFFSET + (TWDR<<2);
          if (reg == AS_ES2)
            OCR1B = EXT_SERVO_OFFSET + (TWDR<<2);
          if (reg == AS_SR)
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
        if (answr == AS_SR)
          TWDR = regs[answr];
        if (answr == AS_SS1)
          TWDR = (OCR1A - STD_SERVO_OFFSET) >> 1;
        if (answr == AS_SS2)
          TWDR = (OCR1B - STD_SERVO_OFFSET) >> 1;
        if (answr == AS_ES1)
          TWDR = (OCR1A - EXT_SERVO_OFFSET) >> 2;
        if (answr == AS_ES2)
          TWDR = (OCR1B - EXT_SERVO_OFFSET) >> 2;
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
