/*
 *  decoder.c
 *
 *  Created: 2/13/2013 9:58:26 AM
 *  Author: Ondrap, ondrap.cz
 */ 

#define F_CPU 20000000UL  // 20 MHz

#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/eeprom.h>
#include <util/atomic.h>
#include <util/crc16.h>

#include "TWI_slave.h"
#include "decoder.h"

void writeLedError(uint8_t errorValue){
	PORTB = (PINB & (~7)) | ((errorValue >> 3 ) & 7);
	PORTD = (PIND & ~(7 << 5)) | (errorValue << 5);
}



union doublebyte{
	uint16_t value;
	uint8_t bytes[2];
};

union quadbyte{
	uint32_t value;
	uint8_t bytes[4];
};

struct encoders{
	encval_t left;
	encval_t right;	
};


// decode array for quadrature signal
static uint8_t encoderStateTable[4][2] = {
	{1,2},
	{3,0},
	{0,3},
	{2,1},		
};

uint8_t EEMEM TWI_SlaveAddressEEPROM = DEFAULT_ENCODER_ADDRESS; //set on default address
volatile struct encoders encodersState;

//last quadrature state
uint8_t lastLeftState;
uint8_t lastRightState;
unsigned char messageBuf[TWI_BUFFER_SIZE];

void TWIInit(uint8_t Address){
	// Initialize TWI module for slave operation. Include address and/or enable General Call.
	//TWI_Slave_Initialise( (Address<<TWI_ADR_BITS) | (TRUE<<TWI_GEN_BIT));
	TWI_Slave_Initialise((Address<<TWI_ADR_BITS));
}

// Update I2C address in internal eeprom memory and reinitialize TWI
void setTWIAddress(uint8_t Address){
	if(Address > 127)
		Address = Address >> 1;	// automatic correction if the caller uses the other convention
	
	eeprom_write_byte(&TWI_SlaveAddressEEPROM, Address);
	TWIInit(Address); // reinit the module
}

uint8_t readTWIAddress(){
	return eeprom_read_byte(&TWI_SlaveAddressEEPROM);
}

void setEncodersValue(encval_t l, encval_t r){
	ATOMIC_BLOCK(ATOMIC_RESTORESTATE){
		encodersState.left = l;
		encodersState.right = r;
	}		
}

void setInputInterruptForDecoder(){
	// set interrupt pin as input with pull up 
	PORTC |= (1 << PC1) | (1 << PC0);
	DDRC &= ~((1 << PC1) | (1 << PC0));
	
	PORTD |= (1 << PD1) | (1 << PD0);
	DDRD &= ~((1 << PD1) | (1 << PD0));
	
	// Insert nop for synchronization
	asm volatile ("NOP"::);
	
	// read initial state of decoder
	lastLeftState = PINC & 3;
	lastRightState = PIND & 3;
	
	// enable interrupt 
	PCICR = (1 << PCIE2) | (1 << PCIE1); // use change interrupt PCIE1,2
	PCMSK1 = (1 << PCINT9) | (1 << PCINT8); // enable interrupt on PCINT8,9
	PCMSK2 = (1 << PCINT17) | (1 << PCINT16); // enable interrupt on PCINT16,17
}

void sendEncoders(uint8_t shift){
	union doublebyte L,R; // we always send two-byte value regardless on the internal representation
	ATOMIC_BLOCK(ATOMIC_FORCEON){	
		L.value = encodersState.left >> shift ;
		R.value = encodersState.right >> shift ;
	}
	messageBuf[0] = L.bytes[0];
	messageBuf[1] = L.bytes[1];
	messageBuf[2] = R.bytes[0];
	messageBuf[3] = R.bytes[1];
writeLedError(R.bytes[0]);

	uint8_t crc = 0 , i;
	for(i=0; i<4; ++i){
		crc=_crc_ibutton_update(crc, messageBuf[i]);
	}

	messageBuf[4] = crc;
	
	TWI_Start_Transceiver_With_Data(messageBuf, 5);
}

void sendEncoders32(uint8_t shift){
	union quadbyte L,R; // we always send two-byte value regardless on the internal representation
	ATOMIC_BLOCK(ATOMIC_FORCEON){	
		L.value = encodersState.left >> shift ;
		R.value = encodersState.right >> shift ;
	}
	messageBuf[0] = L.bytes[0];
	messageBuf[1] = L.bytes[1];
	messageBuf[2] = L.bytes[2];
	messageBuf[3] = L.bytes[3];
	messageBuf[4] = R.bytes[0];
	messageBuf[5] = R.bytes[1];
	messageBuf[6] = R.bytes[2];
	messageBuf[7] = R.bytes[3];
writeLedError(R.bytes[0]);

	uint8_t crc = 0 , i;
	for(i=0; i<8; ++i){
		crc=_crc_ibutton_update(crc, messageBuf[i]);
	}

	messageBuf[8] = crc;
	
	TWI_Start_Transceiver_With_Data(messageBuf, 9);
}


ISR(PCINT1_vect, ISR_NOBLOCK){
	uint8_t leftState = PINC & 3;
	
	if(encoderStateTable[lastLeftState][1] == leftState){ // Left wheel had switch second part of array because had opposite direction
		encodersState.left++;
	}else{
		if(encoderStateTable[lastLeftState][0] == leftState){
			encodersState.left--;
		}
		//else{
			// TODO: error 
		//}
	}			
			
	lastLeftState = leftState;
}

ISR(PCINT2_vect, ISR_NOBLOCK){
	uint8_t rightState = PIND & 3;
	
	if(encoderStateTable[lastRightState][0] == rightState){
		encodersState.right++;
	}		
	else{
		if(encoderStateTable[lastRightState][1] == rightState){
			encodersState.right--;
		}
		//else{
			// TODO: error
		//}			
	}			
	
	lastRightState = rightState;
}

int main(void)
{
	setEncodersValue(32767,32767); // a to proc vlastne?
	//setEncodersValue(127,127);

	setEncodersValue(0,0); // a to je vlastne jedno, dam si tam 0.
	
	// set output ports for diodes
	DDRD |= (1 << PD5) | (1 << PD6) | (1 << PD7);
	//PORTD |= (1 << PD5) | (1 << PD6);
	DDRB |= (1 << PB0) | (1 << PB1) | (1 << PB2);
	//PORTB |= (1 << PB0) | (1 << PB1);
	
	writeLedError(0xa);
	setInputInterruptForDecoder();
	
	uint8_t TWI_SlaveAddress;
//	TWI_SlaveAddress = readTWIAddress();
//	if(!TWI_SlaveAddress || TWI_SlaveAddress==0xff)
		TWI_SlaveAddress = DEFAULT_ENCODER_ADDRESS ; // if the EEPROM is not set, we set it to default
	
	TWIInit(TWI_SlaveAddress);
	
	// Enable interrupt
	sei();
	
	// Start the TWI transceiver to enable reception of the first command from the TWI Master.
	TWI_Start_Transceiver();
	
//writeLedError(1);
			
	// Never ending loop witch read from I2C and response on command.
	while(TRUE){
		if(!TWI_Transceiver_Busy()){
			if(TWI_statusReg.RxDataInBuf){
				// get command code
//				writeLedError(2);
				TWI_Get_Data_From_Transceiver(messageBuf, 1);
//				writeLedError(3);
				if((messageBuf[0]&GET_MASK)==GET_ENCODERS){
//					writeLedError(4);
//					PORTD ^=  (1 << PD7);
					sendEncoders(messageBuf[0]&GET_ENCODERS_SHIFT);
				}
				else if((messageBuf[0]&GET_MASK)==GET_ENCODERS_32){
//					writeLedError(5);
//					PORTD ^=  (1 << PD7);
					sendEncoders32(messageBuf[0]&GET_ENCODERS_SHIFT);
				} 
				else switch(messageBuf[0]){
					case SET_ADDRESS:
						{
							uint8_t a;
					writeLedError(6);
							TWI_Get_Data_From_Transceiver((unsigned char*)&a, 1);
							setTWIAddress(a);
						}
					case SET_ENCODERS:
						{
							encval_t l,r;
					writeLedError(7);
							TWI_Get_Data_From_Transceiver((unsigned char*)&l, sizeof(l)); // warning - Endians...
							TWI_Get_Data_From_Transceiver((unsigned char*)&r, sizeof(r));
							setEncodersValue(l,r);
						}	
						break;
					case RESET_ENCODERS:
					writeLedError(8);

						setEncodersValue(0,0);
						break;
					default:
						//writeLedError(5);
						//TWI_Start_Transceiver();
						break;
				}	
			}							
		}
		
		asm volatile ("NOP"::);  // Do something else while waiting			
	}
}

