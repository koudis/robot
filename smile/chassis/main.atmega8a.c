
#define F_CPU 16000000
#include <inttypes.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/atomic.h>
#include <util/delay.h>

#include "lib/TWI_slave.h"

union doublebyte {
	uint16_t value;
	uint8_t byte[2];
};


#define Encoder_IRQ_A_MASK 0b10 
#define Encoder_IRQ_B_MASK 0b01 
#define Encoder_IRQ_A_PIN PIND2
#define Encoder_IRQ_B_PIN PIND3
#define Encoder_IRQ_PORT  PIND

#define Encoder_COUNTER_DEFAULT 0
#define Encoder_COUNTER_DEFAULT 0

#define Encoder_LAST_STATE_DEFAULT 0

#define Encoder_DIRECTION_FORWARD  1
#define Encoder_DIRECTION_BACKWARD 2
#define Encoder_DIRECTION_DEFAULT  0
struct Encoder_s {
	uint16_t counter_a;
	uint16_t counter_b;
	uint8_t last_state[3];
	uint8_t direction;
} Encoder_default = {0};
typedef struct Encoder_s Encoder_t;

typedef enum {
	S0 = 0b00,
	S1 = 0b10,
	S2 = 0b11,
	S3 = 0b01
} EncoderState_t;

// BUNO - forward
EncoderState_t enc_state_order[4] = {
	S0,
	S1,
	S2,
	S3
};

// BUNO - backward
EncoderState_t enc_state_order_b[4] = {
	S3,
	S2,
	S1,
	S0
};



void encoder_inta(Encoder_t* enc) __attribute__((always_inline));
void encoder_inta(Encoder_t* enc) {
	ATOMIC_BLOCK(ATOMIC_FORCEON) {
		enc->last_state[0] = enc->last_state[1];
		enc->last_state[1] = enc->last_state[1] ^ Encoder_IRQ_A_MASK;

		if(enc_state_order[0] == enc->last_state[1]) {
			if(enc_state_order[1] == enc->last_state[0]) {
				enc->direction = Encoder_DIRECTION_FORWARD;
			}
		}
		else if(enc_state_order_b[0] == enc->last_state[1]) {
			if(enc_state_order_b[1] == enc->last_state[0]) {
				enc->direction = Encoder_DIRECTION_BACKWARD;
			}
		}
	}

	if(enc->direction == Encoder_DIRECTION_FORWARD)
		enc->counter_a += 1;
	else 
		enc->counter_a -= 1;
}

void encoder_intb(Encoder_t* enc) __attribute__((always_inline));
void encoder_intb(Encoder_t* enc) {
	ATOMIC_BLOCK(ATOMIC_FORCEON) {
		enc->last_state[0] = enc->last_state[1];
		enc->last_state[1] = enc->last_state[1] ^ Encoder_IRQ_B_MASK;

		if(enc_state_order[0] == enc->last_state[1]) {
			if(enc_state_order[1] == enc->last_state[0]) {
				enc->direction = Encoder_DIRECTION_FORWARD;
			}
		}
		else if(enc_state_order_b[0] == enc->last_state[1]) {
			if(enc_state_order_b[1] == enc->last_state[0]) {
				enc->direction = Encoder_DIRECTION_BACKWARD;
			}
		}
	}

	if(enc->direction == Encoder_DIRECTION_FORWARD)
		enc->counter_b += 1;
	else 
		enc->counter_b -= 1;
}



Encoder_t enc;

void init() {
	// wait for stab..
	_delay_ms(1000);

	enc = Encoder_default;

	// enable all external interrupts 
	GICR = (1 << INT0) | (1 << INT1);
	// set interrupt sense
	MCUCR |= (1 << ISC10) | (0 <<ISC11) | // any change generate interupt on 0
			 (1 << ISC00) | (0 <<ISC01);  // any change generate interupt on 1

	// set interruppt enable to 1
	sei();
}



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
