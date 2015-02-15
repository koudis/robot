
#define F_CPU 16000000
#include <inttypes.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/atomic.h>
#include <util/delay.h>

#include "lib/TWI_slave.h"
#include "lib/ENCODER_quadrature.h"

union doublebyte {
	uint16_t value;
	uint8_t byte[2];
};




void init() {
	// wait for stab..
	_delay_ms(1000);

	// enable all external interrupts 
	GICR |= (1 << INT0) | (1 << INT1);
	// set interrupt sense
	MCUCR |= (1 << ISC10) | (0 <<ISC11) | // any change generate interupt on 0
			 (1 << ISC00) | (0 <<ISC01);  // any change generate interupt on 1

	// set interruppt enable to 1
	sei();
}


Encoder_t enc = {0};

ISR(INT0_vect, ISR_NOBLOCK) {
	encoder_inta(&enc);
}

ISR(INT1_vect, ISR_NOBLOCK) {
	encoder_intb(&enc);
}



int main(void) {
	TWI_Slave_Initialise(0b00000100);
	init();
	_delay_ms(100);

	DDRD = 0b00000011;
	PORTD = 0b00000011;


	unsigned char p[5] = {1,2,3,4,5};
	unsigned char p2[5] = {2,2,3,4,5};
	//TWI_Start_Transceiver_With_Data(p2, 1);

	while(1) {

		if(enc.counter_a > 31000 || enc.counter_a < -31000) {
			enc.counter_a = 0;
		}
		if(enc.counter_b > 31000 || enc.counter_b < -31000) {
			enc.counter_b = 0;
		}
			if(enc.direction == Encoder_DIRECTION_BACKWARD) {
				PORTD = 0b00000011;
			}
			if(enc.direction == Encoder_DIRECTION_FORWARD) {
				PORTD = 0b00000000;
			}

		if(!TWI_Transceiver_Busy()) {
			if(enc.direction == Encoder_DIRECTION_BACKWARD) {
				TWI_Start_Transceiver_With_Data(p, 1);
				PORTD = 0b00000011;
			}
			if(enc.direction == Encoder_DIRECTION_FORWARD) {
				TWI_Start_Transceiver_With_Data(p2, 1);
				PORTD = 0b00000000;
			}
		}
		
	}

	return 0;
}
