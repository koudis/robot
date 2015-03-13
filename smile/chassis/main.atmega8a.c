
#define F_CPU 16000000
#include <inttypes.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/atomic.h>
#include <util/delay.h>

#include "lib/mega/TWI_slave.h"
#include "lib/mega/ENCODER_quadrature.h"
#include "lib/motorproto.h"


typedef union {
	volatile int32_t value;
	volatile int8_t byte[4];
} quadbyte_t;



unsigned char message_buff[TWI_BUFFER_SIZE] = {0};
Encoder_t  enc = {0};
quadbyte_t data;

ISR(INT0_vect, ISR_NOBLOCK) {
	encoder_inta(&enc);
}

ISR(INT1_vect, ISR_NOBLOCK) {
	encoder_intb(&enc);
}


void pwm_init();
void pwm_enable();
void pwm_set1a(uint8_t);
void pwm_set1b(uint8_t);

void pwm_init() {
	// OC1* must be set as output
	DDRB |= (1 << PIN1);
	DDRB |= (1 << PIN2);

	TCCR1A |= (0 << COM1A0) | (1 << COM1A1);   // set OC1A to hight on compare match
	TCCR1A |= (0 << COM1B0) | (1 << COM1B1);   // set OC1B to hight on compare match

	// choose phase correct pwm
	TCCR1A |= (1 << WGM10) | (0 << WGM11);
	TCCR1B |= (0 << WGM11) | (0 << WGM13);

	pwm_set1a(0);
	pwm_set1b(0);
}

void pwm_enable() {
	// select clock source without prescaller
	TCCR1B |= (1 << CS10) | (0 << CS11) | (0 << CS12);
}

void pwm_set1a(uint8_t v) {
	// set compare match register for OC1A
	OCR1AL = v;
	OCR1AH = 0;
}

void pwm_set1b(uint8_t v) {
	// set compare match register for OC1B
	OCR1BL = v;
	OCR1BH = 0;
}



void init() {
	TWI_Slave_Initialise(0b00000100);

	// wait for stab..
	_delay_ms(1000);

	encoder_init(&enc);

	pwm_init();

	// enable all external interrupts 
	GICR |= (1 << INT0) | (1 << INT1);
	// set interrupt sense
	MCUCR |= (1 << ISC10) | (0 <<ISC11) | // any change generate interupt on 0
			 (1 << ISC00) | (0 <<ISC01);  // any change generate interupt on 1

	// set interruppt enable to 1
	sei();
}



int main(void) {
	init();
	_delay_ms(100);

	DDRD  |= (1 << 7);
	PORTD |= (1 << 7);

	// enable TWI
	TWI_Start_Transceiver();

	while(1) {
		if(!TWI_Transceiver_Busy()) {
			if(TWI_statusReg.RxDataInBuf){
				TWI_Get_Data_From_Transceiver(message_buff, 1);
				switch(message_buff[0] & MOTORPROTO_HEAD_GET) {
					case MOTORPROTO_INSTR_READ:
						ATOMIC_BLOCK(ATOMIC_FORCEON) {
							data.value =  enc.counter_b;
							message_buff[0] = data.byte[0];
							message_buff[1] = data.byte[1];
							message_buff[2] = data.byte[2];
							message_buff[3] = data.byte[3];
						}
						TWI_Start_Transceiver_With_Data(message_buff, 4);
						message_buff[0] = 0;
						break;
					case MOTORPROTO_INSTR_RESET:
						ATOMIC_BLOCK(ATOMIC_FORCEON) {
							enc.counter_a = 0;
							enc.counter_b = 0;
							message_buff[0] = 0;
						}
						break;
					case MOTORPROTO_INSTR_SET_FORWARD:
						pwm_set1a(message_buff[0] & MOTORPROTO_DATA_GET);
						break;
					case MOTORPROTO_INSTR_SET_BACKWARD:
						pwm_set1b(message_buff[0] & MOTORPROTO_DATA_GET);
						break;
					default:
						break;
				}
			}
		}
		/*
		if(enc.direction == Encoder_DIRECTION_BACKWARD) {
			PORTD |= (1 << 7);
		}
		if(enc.direction == Encoder_DIRECTION_FORWARD) {
			PORTD = 0b00000000;
		}
		*/
	}

	return 0;
}
