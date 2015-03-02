
#define F_CPU 32000000
#define CPU_SPEED F_CPU
#define BAUDRATE 100000
#include <inttypes.h>
#include <avr/io.h>
#include <util/delay.h>

#include "lib/xmega/TWI/twi_master_driver.h"
#include "lib/xmega/TWI/twi_slave_driver.h"
#include "lib/motorproto.h"

void TWI_SlaveWrite(TWI_Slave_t* twis, uint8_t* data, uint8_t bytes_to_send);
uint8_t TWI_MasterWriteWait(TWI_Master_t *twi, uint8_t address, uint8_t * writeData, uint8_t bytesToWrite);
uint8_t TWI_MasterWriteReadWait(TWI_Master_t *twi, uint8_t address, uint8_t * writeData, uint8_t bytesToWrite, uint8_t bytesToRead);

void copy_array_into(uint8_t* a1,uint8_t* a2, uint8_t n2);

uint8_t TWI_MasterWriteWait(TWI_Master_t *twi, uint8_t address, uint8_t * writeData, uint8_t bytesToWrite) {
	TWI_MasterWrite(twi, address, writeData, bytesToWrite);
	while (twi->status != TWIM_STATUS_READY) {  /*Wait until transaction is complete.*/ }
}

uint8_t TWI_MasterWriteReadWait(TWI_Master_t *twi, uint8_t address, uint8_t * writeData, uint8_t bytesToWrite, uint8_t bytesToRead) {
	TWI_MasterWriteRead(twi, address, writeData, bytesToWrite, bytesToRead);
	while (twi->status != TWIM_STATUS_READY) {  /*Wait until transaction is complete.*/ }
}

void TWI_SlaveWrite(TWI_Slave_t* twis, uint8_t* data, uint8_t bytes_to_send) {
	copy_array_into(twis->sendData, data, bytes_to_send);
	twis->bytesSent = 0;
}

#define TWI_BAUDSETTING TWI_BAUD(CPU_SPEED, BAUDRATE)

#define COMMAND_HEAD_BITS_COUNT 3
#define COMMAND_ATTR_BITS_COUNT 5
#define COMMAND_HEAD (0xff << COMMAND_ATTR_BITS_COUNT)
#define COMMAND_ATTR (0xff >> COMMAND_HEAD_BITS_COUNT)

#define COMMAND_HEAD_DO_NOTHING (0b00000 << COMMAND_ATTR_BITS_COUNT)
#define COMMAND_HEAD_MOTOR      (0b10000 << COMMAND_ATTR_BITS_COUNT)
#define COMMAND_HEAD_ENCODER    (0b01000 << COMMAND_ATTR_BITS_COUNT)
#define COMMAND_HEAD_VECTOR     (0b00100 << COMMAND_ATTR_BITS_COUNT)

#define MOTOR_0 0
#define MOTOR_1 1
#define MOTOR_2 2
#define MOTOR_NUMBER_MASK 0b00011

#define MOTOR_DIRECTION_MASK 0b11100
#define MOTOR_FORWARD  4
#define MOTOR_BACKWARD 8

#define ENCODER 0
#define ENCODER_RESET 3
#define ENCODER_GET_DISTANCE 4
#define ENCODER_GET_DISTANCE_AND_RESET 5


typedef union {
	float value; // float is four byte long
	int8_t byte[4];
} Quadbyte_float_t;
Quadbyte_float_t _quadbyte;



typedef struct Encoders {
	uint8_t  data[3][4];
	float  i distance;
	uint8_t  ready;
} Encoders_t;

void encoders_add_and_reset(Encoders_t* enc);
void encoders_add(Encoders_t* enc);

void encoders_add_and_reset(Encoders_t* enc) {
	uint8_t i;
	for(i = 0; i < 3; i++) {
		enc->distance += ((float)enc->data[i][0]) / 1024 + ((float)enc->data[i][1]) / 4 + ((float)enc->data[i][2]) * 64;
		enc->data[i][0] = 0;
		enc->data[i][1] = 0;
		enc->data[i][2] = 0;
		enc->data[i][3] = 0;
	}
}

void encoders_add(Encoders_t* enc) {
	uint8_t i;
	for(i = 0; i < 3; i++)
		enc->distance += ((float)enc->data[i][0]) / 1024 + ((float)enc->data[i][1]) / 4 + ((float)enc->data[i][2]) * 64;
}



typedef enum Commands {
	no_command     = COMMAND_HEAD_DO_NOTHING,
	set_vector     = COMMAND_HEAD_VECTOR,
	set_motor_0b   = (COMMAND_HEAD_MOTOR | MOTOR_0 | MOTOR_BACKWARD),
	set_motor_0f   = (COMMAND_HEAD_MOTOR | MOTOR_0 | MOTOR_FORWARD),
	set_motor_1b   = (COMMAND_HEAD_MOTOR | MOTOR_1 | MOTOR_BACKWARD),
	set_motor_1f   = (COMMAND_HEAD_MOTOR | MOTOR_1 | MOTOR_FORWARD),
	set_motor_2b   = (COMMAND_HEAD_MOTOR | MOTOR_2 | MOTOR_BACKWARD),
	set_motor_2f   = (COMMAND_HEAD_MOTOR | MOTOR_2 | MOTOR_FORWARD),
	get_encoders   = (COMMAND_HEAD_ENCODER | ENCODER),
	reset_encoders = (COMMAND_HEAD_ENCODER | ENCODER_RESET),
	get_distance   = (COMMAND_HEAD_ENCODER | ENCODER_GET_DISTANCE),
	get_distance_and_reset = (COMMAND_HEAD_ENCODER | ENCODER_GET_DISTANCE_AND_RESET),
} Commands_t;

typedef struct Command {
	Commands_t command;
	uint8_t    data[4];
	uint8_t    data_count;
	void*      dataref;
} Command_t;

typedef struct Commnad_twi {
	TWI_Slave_t*  twis;
	TWI_Master_t* twim;
} Commnad_twi_t;

void command_handler(const Command_t* com, const Commnad_twi_t* commnad_twi);
void command_handler_motor(const Command_t* com, const Commnad_twi_t* command_twi);
void command_handler_encoder(const Command_t* com, const Commnad_twi_t* command_twi);
void command_handler_vector(const Command_t* com, const Commnad_twi_t* command_twi);

void command_handler(const Command_t* com, const Commnad_twi_t* command_twi) {
	uint8_t command = com->command;
	switch(command & COMMAND_HEAD) {
		case COMMAND_HEAD_DO_NOTHING:
			break;
		case COMMAND_HEAD_ENCODER:
			command_handler_encoder(com, command_twi);
			break;
		case COMMAND_HEAD_MOTOR:
			command_handler_motor(com, command_twi);
			break;
		case COMMAND_HEAD_VECTOR:
			command_handler_vector(com, command_twi);
			break;
		default:
			break;
	}
}

void command_handler_motor(const Command_t* com, const Commnad_twi_t* command_twi) {
	TWI_Master_t* twim = command_twi->twim; 
	uint8_t attr       = (com->command & COMMAND_ATTR);
	uint8_t data[2]    = { 0 };
	uint8_t address    = { 0 };

	switch(attr & MOTOR_NUMBER_MASK) {
		case MOTOR_0:
			address = 0x01;
			break;
		case MOTOR_1:
			address = 0x02;
			break;
		case MOTOR_2:
			address = 0x03;
			break;
	}
	switch(attr & MOTOR_DIRECTION_MASK) {
		case MOTOR_FORWARD:
			data[0] = MOTORPROTO_INSTR_SET_FORWARD;
			data[1] = com->data[0];
		case MOTOR_BACKWARD:
			data[0] = MOTORPROTO_INSTR_SET_BACKWARD;
			data[1] = com->data[0];
	}

	TWI_MasterWriteWait(twim, address, data, 2);
}

void command_handler_encoder(const Command_t* com, const Commnad_twi_t* command_twi) {
	TWI_Master_t* twim = command_twi->twim; 
	TWI_Slave_t*  twis = command_twi->twis; 
	Encoders_t*   enc  = com->dataref;
	uint8_t attr       = (com->command & COMMAND_ATTR);
	uint8_t data       = 0;
	switch(attr) {
		case ENCODER:	
			data = MOTORPROTO_INSTR_READ;
			TWI_MasterWriteReadWait(twim, 0x01, &data, 1, 4);	
			copy_array_into(enc->data[0], twim->readData, 4);
			TWI_MasterWriteReadWait(twim, 0x02, &data, 1, 4);
			copy_array_into(enc->data[1], twim->readData, 4);
			TWI_MasterWriteReadWait(twim, 0x03, &data, 1, 4);
			copy_array_into(enc->data[2], twim->readData, 4);
			enc->ready = 0;
			break;
		case ENCODER_GET_DISTANCE_AND_RESET:
			encoders_add_and_reset(enc);
			_quadbyte.value = enc->distance;
			copy_array_into(twis->sendData, _quadbyte.byte, 4);
		case ENCODER_RESET:
			data = MOTORPROTO_INSTR_RESET;
			TWI_MasterWriteWait(twim, 0x01, &data, 1);	
			TWI_MasterWriteWait(twim, 0x02, &data, 1);	
			TWI_MasterWriteWait(twim, 0x03, &data, 1);	
			break;
		case ENCODER_GET_DISTANCE:
			encoders_add(enc);
			_quadbyte.value = enc->distance;
			copy_array_into(twis->sendData, _quadbyte.byte, 4);
	}
}

void command_handler_vector(const Command_t* com, const Commnad_twi_t* command_twi) {
}




// copy first n bytes from a2 to a1
void copy_array_into(uint8_t* a1, uint8_t* a2, uint8_t n2, uint8_t from = 0) {
	uint8_t i;
	for(i = from; i < n2; i++)
		a1[i] = a2[i];
}











Command_t    command;
TWI_Master_t twie_master;
TWI_Slave_t  twic_slave;
Encoders_t   encoders;

ISR(TWIE_TWIM_vect) {
	TWI_MasterInterruptHandler(&twie_master);
}

ISR(TWIC_TWIS_vect) {
	TWI_SlaveInterruptHandler(&twic_slave);
}

void TWIC_slave_process_data() {
	uint8_t recieved = twic_slave.bytesReceived;

	command.command = twic_slave.recievedData[0];
	recieved -= 1;

	if(recieved > 0) {
		copy_array_into(command.data, twic_slave.recievedData, recieved, 1);
	}
}

void set_32mhz_osc() {
	OSC.CTRL |= OSC_RC32MEN_bm;             // Enable 32 Mhz osc.
	while(!(OSC.STATUS & OSC_RC32MRDY_bm)); // Wait for stab. 32Mhz osc.
	OSC.CTRL ^= OSC_RC2MEN_bm;              // Disable 2Mhz oscilator 
	CCP      = CCP_IOREG_gc;                // Trigger protection mechanism
	CLK.CTRL = CLK_SCLKSEL_RC32M_gc;        // Select 32Mhz as system clock
}

void init() {
	cli();
	set_32mhz_osc();
	_delay_ms(100);

	// configure 5v branch as master
	TWI_MasterInit(&twie_master, &TWIE, TWI_MASTER_INTLVL_LO_gc, TWI_BAUDSETTING);

	// configure "raspberry" I2C module
	TWI_SlaveInitializeDriver(&twic_slave, &TWIC, TWIC_slave_process_data);
	TWI_SlaveInitializeModule(&twic_slave, 0x22, TWI_SLAVE_INTLVL_LO_gc);

	// enable LO interrupts
	PMIC.CTRL |= PMIC_LOLVLEN_bm;

	// enable interrupts
	sei();
}






int main(void) {
	init();
	_delay_ms(100);


	PORTD_DIR = 0b00000110;
PORTD_OUT |= PIN1_bm;

	uint8_t p[2] = {0x05, 0x00};

	//TWI_MasterWrite(&twie_master, 0b00100000, p, 2);
	//while (twie_master.status != TWIM_STATUS_READY) {
		/* Wait until transaction is complete. */
	//}

	uint8_t p1[2] = { 0x00, 0x00 };
	uint8_t p2[2] = { 0x01, 0x00 };
	uint8_t p3[2] = { 0x02, 0x00 };
	uint8_t p4[2] = { 0x06, 0xff };
	uint8_t p5[2] = { 0x09, 0xff };
	uint8_t p6[2] = { 0x0A, 0x00 };

	TWI_MasterWrite(&twie_master, 0b001000000, p1, 2);
	while (twie_master.status != TWIM_STATUS_READY) {  /*Wait until transaction is complete.*/ }

	TWI_MasterWrite(&twie_master, 0b001000000, p2, 2);
	while (twie_master.status != TWIM_STATUS_READY) {  /*Wait until transaction is complete.*/ }

	TWI_MasterWrite(&twie_master, 0b001000000, p3, 2);
	while (twie_master.status != TWIM_STATUS_READY) {  /*Wait until transaction is complete.*/ }

	TWI_MasterWrite(&twie_master, 0b001000000, p4, 2);
	while (twie_master.status != TWIM_STATUS_READY) {  /*Wait until transaction is complete.*/ }

	TWI_MasterWrite(&twie_master, 0b001000000, p5, 2);
	while (twie_master.status != TWIM_STATUS_READY) {  /*Wait until transaction is complete.*/ }

	TWI_MasterWrite(&twie_master, 0b001000000, p6, 2);
	while (twie_master.status != TWIM_STATUS_READY) {  /*Wait until transaction is complete.*/ }

	while(1) {
		_delay_ms(50);
		/*TWI_MasterRead(&twie_master, 0b00100000, 1);
		while (twie_master.status != TWIM_STATUS_READY) {
		}

		if(twie_master.bytesRead) {
			p[0] = ~(twie_master.readData[0]);
		}*/
		//

		TWI_MasterWrite(&twie_master, 2, p, 2);

		while (twie_master.status != TWIM_STATUS_READY) {
			/* Wait until transaction is complete. */
		}

	//	while(!TWI_MasterReady(&twie_master)) {
	//		_delay_ms(165);
		//	PORTD_OUT ^= PIN1_bm;
		//}
		//TWI_MasterWrite(&twie_master, 0b00100000, p3, 10);

		_delay_ms(1550);
	//	while(!TWI_MasterReady(&twie_master)) {
	//		_delay_ms(165);
	//		PORTD_OUT ^= PIN1_bm;
	//	}

		//p2[1] ^= p2[1];
		//TWI_MasterWrite(&twie_master, 2, p2, 2);
		//while(!TWI_MasterReady(&twie_master)) {}
		_delay_ms(50);

		/*if(twi_slave.bytesReceived) {
			PORTD_OUT ^= PIN1_bm;
		}*/
	}

/*	PORTC_DIR = 0b00100000;
	PORTC_OUT |= PIN5_bm;
	PORTA_DIR = 0b00001111;
	PORTA_OUT |= PIN0_bm;
	while(1) {
		PORTC_OUT = 0;
		_delay_ms(1000);
		if(PORTA_OUT & PIN0_bm) {
			PORTA_OUT ^= PIN0_bm;
			PORTA_OUT |= PIN1_bm;
		}
		_delay_ms(1000);
		if(PORTA_OUT & PIN1_bm) {
			PORTA_OUT ^= PIN1_bm;
			PORTA_OUT |= PIN2_bm;
		}
		PORTC_OUT |= PIN5_bm;
		_delay_ms(1000);
		if(PORTA_OUT & PIN2_bm) {
			PORTA_OUT ^= PIN2_bm;
			PORTA_OUT |= PIN3_bm;
		}
		_delay_ms(1000);
		if(PORTA_OUT & PIN3_bm) {
			PORTA_OUT ^= PIN3_bm;
			PORTA_OUT |= PIN0_bm;
		}
	}*/
}
