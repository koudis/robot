
#define F_CPU 16000000
#include <inttypes.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/atomic.h>
#include <util/delay.h>

#include "lib/mega/TWI_slave.h"
#include "lib/mega/ENCODER_quadrature.h"

#define PROTO_HEAD     5
#define PROTO_DATA     0
#define PROTO_HEAD_GET 0b11100000
#define PROTO_DATA_GET 0b00011111

#define PROTO_INSTR_READ         (0b100 << PROTO_HEAD)
#define PROTO_INSTR_RESET        (0b010 << PROTO_HEAD)
#define PROTO_INSTR_SET_FORWARD  (0b101 << PROTO_HEAD)
#define PROTO_INSTR_SET_BACKWARD (0b110 << PROTO_HEAD)

typedef union {
	volatile int32_t value;
	volatile int8_t byte[4];
} quadbyte_t;



unsigned char message_buff[TWI_BUFFER_SIZE] = {0};
Encoder_t enc = {0};
quadbyte_t data;

ISR(INT0_vect, ISR_NOBLOCK) {
	encoder_inta(&enc);
}

ISR(INT1_vect, ISR_NOBLOCK) {
	encoder_intb(&enc);
}

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


int main(void) {
	TWI_Slave_Initialise(0b00000100);
	init();
	_delay_ms(100);

	DDRD  |= (1 << 7);
	PORTD |= (1 << 7);

	TWI_Start_Transceiver();
	while(1) {
		if(!TWI_Transceiver_Busy()) {
			if(TWI_statusReg.RxDataInBuf){
				TWI_Get_Data_From_Transceiver(message_buff, 1);
				switch(message_buff[0] & PROTO_HEAD_GET) {
					case PROTO_INSTR_READ:
						ATOMIC_BLOCK(ATOMIC_FORCEON) {
							data.value =  enc.counter_b;
						}
						message_buff[0] = data.byte[0];
						message_buff[1] = data.byte[1];
						message_buff[2] = data.byte[2];
						message_buff[3] = data.byte[3];
						TWI_Start_Transceiver_With_Data(message_buff, 4);
						message_buff[0] = 0;
						break;
					case PROTO_INSTR_SET_FORWARD:
						uint8_t data = message_buff[0] & PROTO_DATA_GET;
						break;
					case PROTO_INSTR_SET_BACKWARD:
						uint8_t data = message_buff[0] & PROTO_DATA_GET;
						break;
					case PROTO_INSTR_RESET:
						ATOMIC_BLOCK(ATOMIC_FORCEON) {
							enc.counter_a = 0;
							enc.counter_b = 0;
							message_buff[0] = 0;
						}
						break;
					default:
						break;
				}
			}
		}
		
		if(enc.direction == Encoder_DIRECTION_BACKWARD) {
			PORTD |= (1 << 7);
		}
		if(enc.direction == Encoder_DIRECTION_FORWARD) {
			PORTD = 0b00000000;
		}
	}

	return 0;
}
