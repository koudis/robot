
#define F_CPU 32000000
#define CPU_SPEED F_CPU
#define BAUDRATE 100000
#include <stdlib.h>
#include <inttypes.h>
#include <avr/io.h>
#include <util/delay.h>
#include <util/atomic.h>

#include "lib/xmega/TWI/twi_master_driver.h"
#include "lib/xmega/TWI/twi_slave_driver.h"
#include "lib/motorproto.h"

void TWI_SlaveWrite(TWI_Slave_t* twis, uint8_t* data, uint8_t bytes_to_send);
uint8_t TWI_MasterWriteWait(TWI_Master_t *twi, uint8_t address, uint8_t * writeData, uint8_t bytesToWrite);
uint8_t TWI_MasterWriteReadWait(TWI_Master_t *twi, uint8_t address, uint8_t * writeData, uint8_t bytesToWrite, uint8_t bytesToRead);

void copy_array_into(uint8_t* a1,uint8_t* a2, uint8_t n2, uint8_t from);

uint8_t TWI_MasterWriteWait(TWI_Master_t *twi, uint8_t address, uint8_t * writeData, uint8_t bytesToWrite) {
	TWI_MasterWrite(twi, address, writeData, bytesToWrite);
	while(TWI_MasterState(twi) != TWI_MASTER_BUSSTATE_IDLE_gc);
}

uint8_t TWI_MasterWriteReadWait(TWI_Master_t *twi, uint8_t address, uint8_t * writeData, uint8_t bytesToWrite, uint8_t bytesToRead) {
	TWI_MasterWriteRead(twi, address, writeData, bytesToWrite, bytesToRead);
	while(TWI_MasterState(twi) != TWI_MASTER_BUSSTATE_IDLE_gc);
}

void TWI_SlaveWrite(TWI_Slave_t* twis, uint8_t* data, uint8_t bytes_to_send) {
	copy_array_into(twis->sendData, data, bytes_to_send, 0);
	twis->bytesSent = 0;
}

#define TWI_BAUDSETTING TWI_BAUD(CPU_SPEED, BAUDRATE)

#define COMMAND_HEAD_BITS_COUNT 3
#define COMMAND_ATTR_BITS_COUNT 5
#define COMMAND_HEAD (0xff << COMMAND_ATTR_BITS_COUNT)
#define COMMAND_ATTR (0xff >> COMMAND_HEAD_BITS_COUNT)

#define COMMAND_HEAD_DO_NOTHING (0b000 << COMMAND_ATTR_BITS_COUNT)
#define COMMAND_HEAD_MOTOR      (0b100 << COMMAND_ATTR_BITS_COUNT)
#define COMMAND_HEAD_ENCODER    (0b010 << COMMAND_ATTR_BITS_COUNT)
#define COMMAND_HEAD_VECTOR     (0b001 << COMMAND_ATTR_BITS_COUNT)

#define MOTOR_NUMBER_MASK 0b01111
#define MOTOR_0 0b00000
#define MOTOR_1 0b00010
#define MOTOR_2 0b00001

#define MOTOR_DIRECTION_MASK 0b10000
#define MOTOR_FORWARD  0b10000
#define MOTOR_BACKWARD 0b00000

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
	float    distance;
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
	// three bytes - [x, y, s] (s = rotation)
	set_vector     = COMMAND_HEAD_VECTOR,
	// one byte in {0, 1, ..., 32}
	set_motor_0b   = (COMMAND_HEAD_MOTOR | MOTOR_0 | MOTOR_BACKWARD),
	set_motor_0f   = (COMMAND_HEAD_MOTOR | MOTOR_0 | MOTOR_FORWARD),
	set_motor_1b   = (COMMAND_HEAD_MOTOR | MOTOR_1 | MOTOR_BACKWARD),
	set_motor_1f   = (COMMAND_HEAD_MOTOR | MOTOR_1 | MOTOR_FORWARD),
	set_motor_2b   = (COMMAND_HEAD_MOTOR | MOTOR_2 | MOTOR_BACKWARD),
	set_motor_2f   = (COMMAND_HEAD_MOTOR | MOTOR_2 | MOTOR_FORWARD),
	// zero
	get_encoders   = (COMMAND_HEAD_ENCODER | ENCODER),
	reset_encoders = (COMMAND_HEAD_ENCODER | ENCODER_RESET),
	get_distance   = (COMMAND_HEAD_ENCODER | ENCODER_GET_DISTANCE),
	get_distance_and_reset = (COMMAND_HEAD_ENCODER | ENCODER_GET_DISTANCE_AND_RESET),
} Commands_t;

typedef enum CommandState {
	NO_STATE = 0,
	WAITING,
	PROCESSED,

} CommandState_t;

typedef struct Command {
	Commands_t command;
	uint8_t    data[4];
	uint8_t    data_count;
	void*      dataref;
	CommandState_t state;
} Command_t;

typedef struct CommandStack {
	Command_t  command[8];
	uint8_t    pos;
	uint8_t    pos_pnext;
} CommandStack_t;

typedef struct Command_twi {
	TWI_Slave_t*  twis;
	TWI_Master_t* twim;
} Command_twi_t;

void command_init(Command_t* const  com, Command_twi_t* const command_twi);
void command_stack_add(CommandStack_t* const  com_stack, Command_t* const com);
void command_stack_pnext(CommandStack_t* const  com, Command_twi_t* const command_twi);
void command_handler(Command_t* const com, Command_twi_t* const commnad_twi);
void command_handler_motor(Command_t* const com, Command_twi_t* const command_twi);
void command_handler_encoder(Command_t* const com, Command_twi_t* const command_twi);
void command_handler_vector(Command_t* const com, Command_twi_t* const command_twi);

void command_init(Command_t* const com, Command_twi_t* const command_twi) {
	com->command    = COMMAND_HEAD_DO_NOTHING;
	com->data_count = 0;
	com->dataref    = 0;

	command_twi->twis = 0;
	command_twi->twim = 0;
}

void command_stack_add(CommandStack_t* const  com_stack, Command_t * const com) {
	uint8_t pos               = com_stack->pos;
	Command_t* const this_com = &com_stack->command[pos];
	switch(this_com->state) {
		case WAITING:
			pos = (pos + 1) % 8;
			break;
		default:
			pos = 0;
	}

	com_stack->command[pos] = (*com);
	com_stack->pos          = pos;
	(&com_stack->command[pos])->state = WAITING;
}

void command_stack_pnext(CommandStack_t* const  com_stack, Command_twi_t* const command_twi) {
	uint8_t pos_pnext          = com_stack->pos_pnext;
	Command_t* const pnext_com = &com_stack->command[pos_pnext];
	switch(pnext_com->state) {
		case WAITING:
			cli();
			com_stack->pos_pnext = (pos_pnext + 1) % 8;
			sei();
			command_handler(pnext_com, command_twi);
			pnext_com->state = PROCESSED;
			break;
		default:
			cli();
			com_stack->pos_pnext = 0;
			sei();
	}
}

void command_handler(Command_t* const com, Command_twi_t* const command_twi) {
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

#define MOTOR_TWI_ADDRESS
void command_handler_motor(Command_t* const com, Command_twi_t* const command_twi) {
	TWI_Master_t* twim = command_twi->twim; 
	uint8_t attr       = (com->command & COMMAND_ATTR);
	uint8_t data       = 0;
	uint8_t address    = 0;

	switch(attr & MOTOR_NUMBER_MASK) {
		case MOTOR_0:
			address = 0x11;
			break;
		case MOTOR_1:
			address = 0x12;
			break;
		case MOTOR_2:
			address = 0x13;
			break;
	}
	switch(attr & MOTOR_DIRECTION_MASK) {
		case MOTOR_FORWARD:
			data = MOTORPROTO_INSTR_SET_FORWARD | com->data[0];
			break;
		case MOTOR_BACKWARD:
			data = MOTORPROTO_INSTR_SET_BACKWARD | com->data[0];
			break;
	}

	TWI_MasterWriteWait(twim, address, &data, 1);
}

void command_handler_encoder(Command_t* const com, Command_twi_t* const command_twi) {
	TWI_Master_t* twim = command_twi->twim; 
	TWI_Slave_t*  twis = command_twi->twis; 
	Encoders_t*   enc  = com->dataref;
	uint8_t attr       = (com->command & COMMAND_ATTR);
	uint8_t data       = 0;
	switch(attr) {
		case ENCODER:	
			data = MOTORPROTO_INSTR_READ;
			TWI_MasterWriteReadWait(twim, 0x11, &data, 1, 4);	
			copy_array_into(enc->data[0], twim->readData, 4, 0);
			TWI_MasterWriteReadWait(twim, 0x12, &data, 1, 4);
			copy_array_into(enc->data[1], twim->readData, 4, 0);
			TWI_MasterWriteReadWait(twim, 0x13, &data, 1, 4);
			copy_array_into(enc->data[2], twim->readData, 4, 0);
			enc->ready = 0;
			break;
		case ENCODER_GET_DISTANCE_AND_RESET:
			encoders_add_and_reset(enc);
			_quadbyte.value = enc->distance;
			copy_array_into(twis->sendData, _quadbyte.byte, 4, 0);
		case ENCODER_RESET:
			data = MOTORPROTO_INSTR_RESET;
			TWI_MasterWriteWait(twim, 0x11, &data, 1);	
			TWI_MasterWriteWait(twim, 0x12, &data, 1);	
			TWI_MasterWriteWait(twim, 0x13, &data, 1);	
			break;
		case ENCODER_GET_DISTANCE:
			encoders_add(enc);
			_quadbyte.value = enc->distance;
			copy_array_into(twis->sendData, _quadbyte.byte, 4, 0);
	}
}


TWI_Master_t   twie_master;
TWI_Slave_t    twic_slave;

Encoders_t     encoders;

CommandStack_t commands;
Command_t      twi_command;
Command_t      command;
Command_twi_t  command_twi = {&twic_slave, &twie_master};

typedef union {
	volatile float value; // float is four byte long
	volatile uint8_t byte[2];
} Doublebyte_int_t;
Doublebyte_int_t _doublebyte;

#define SIN_ALPHA 0.5
#define COS_ALPHA 0.866
#define POWER 32
void command_handler_vector(Command_t* const com, Command_twi_t* const command_twi) {
	// buno 128 ==> zero
	int8_t v_x = 11;
	int8_t v_y = 11;
	int8_t s   = 11;
	int16_t v[3];

	v[0] = POWER * ((SIN_ALPHA / (POWER * (1 + SIN_ALPHA))) * (s - POWER * v_x) - v_x);
	v[1] = POWER * (((float)v_y / (2 * COS_ALPHA)) + (s - POWER * v_x) / (2 * POWER * (1 + SIN_ALPHA)));
	v[2] = (-1) * POWER * (((float)v_y / (2 * COS_ALPHA)) + (float)(s - POWER * v_x) / (2 * POWER * (1 + SIN_ALPHA)));


	uint16_t v_max = 0;
	uint8_t i;
	for(i = 0; i < 3; i++) {
		if(v_max < abs(v[i]))
			v_max = abs(v[i]);
	}

	v[0] = ((float)v[0] / v_max) * POWER;
	v[1] = ((float)v[1] / v_max) * POWER;
	v[2] = ((float)v[2] / v_max) * POWER;
	v[0] = 28;
	v[1] = 28;
	v[2] = 28;

	command.command = set_motor_2b;
	command.data[0] = v[1];
	command_stack_add(&commands, &command);

	if(v[0] > 0) {
		command.command = set_motor_0f;
	} else {
		command.command = set_motor_0b;
	}
	command.data[0] = v[0];
	command_stack_add(&commands, &command);

	if(v[1] > 0) {
		command.command = set_motor_1f;
		command.data[0] = v[1];
	} else {
		command.command = set_motor_1b;
		command.data[0] = (-1)*v[1];
	}
	command_stack_add(&commands, &command);

	if(v[2] > 0) {
		command.command = set_motor_2f;
		command.data[0] = v[2];
	} else {
		command.command = set_motor_2b;
		command.data[0] = (-1)*v[2];
	}
	command_stack_add(&commands, &command);
}




// copy first n bytes from a2 to a1
void copy_array_into(uint8_t* a1, uint8_t* a2, uint8_t n2, uint8_t from) {
	uint8_t i;
	for(i = from; i < n2; i++)
		a1[i] = a2[i];
}











ISR(TWIE_TWIM_vect) {
	TWI_MasterInterruptHandler(&twie_master);
}

ISR(TWIC_TWIS_vect) {
	TWI_SlaveInterruptHandler(&twic_slave);
}

uint8_t twi_bytes_for_receive;
void TWIC_slave_process_data() {
	uint8_t received = twic_slave.bytesReceived;

	if(received == 0) {
		twi_command.command    = twic_slave.receivedData[0];
		twi_command.data_count = 0;
		return;
	} else if(received == 1) {
		twi_bytes_for_receive = twic_slave.receivedData[1];
		return;
	} else {
		twi_command.data[command.data_count] = twic_slave.receivedData[received];
		twi_command.data_count += 1;
	}	

	twi_bytes_for_receive -= 1;
	if(!twi_bytes_for_receive) {
		command_stack_add(&commands, &twi_command);
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
	PORTC_DIR |= PIN1_bm | PIN0_bm;   // enable pullup?
	PORTC_OUT |= PIN1_bm | PIN0_bm;   // enable pullup?
	TWI_SlaveInitializeDriver(&twic_slave, &TWIC, TWIC_slave_process_data);
	TWI_SlaveInitializeModule(&twic_slave, 0x32, TWI_SLAVE_INTLVL_LO_gc);

	// enable LO interrupts
	PMIC.CTRL |= PMIC_LOLVLEN_bm;

	// wait for init other network modules
	_delay_ms(3000);

	// enable interrupts
	sei();
}






int main(void) {
	init();


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

/*	TWI_MasterWrite(&twie_master, 0b001000000, p1, 2);
	while (twie_master.status != TWIM_STATUS_READY); 

	TWI_MasterWrite(&twie_master, 0b001000000, p2, 2);
	while (twie_master.status != TWIM_STATUS_READY);

	TWI_MasterWrite(&twie_master, 0b001000000, p3, 2);
	while (twie_master.status != TWIM_STATUS_READY);

	TWI_MasterWrite(&twie_master, 0b001000000, p4, 2);
	while (twie_master.status != TWIM_STATUS_READY);

	TWI_MasterWrite(&twie_master, 0b001000000, p5, 2);
	while (twie_master.status != TWIM_STATUS_READY);

	TWI_MasterWrite(&twie_master, 0b001000000, p6, 2);
	while (twie_master.status != TWIM_STATUS_READY);*/

	/*uint8_t data2 = 0xa0;
	_data = 0xaf;
	command.command = set_motor_0f;
	command.data[0] = 0;
	command.data_count = 1;*/
	while(1) {
		command_stack_pnext(&commands, &command_twi);
	}
}
