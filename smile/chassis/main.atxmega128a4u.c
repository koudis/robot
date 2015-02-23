
#define F_CPU 32000000
#define CPU_SPEED F_CPU
#define BAUDRATE 100000
#include <inttypes.h>
#include <avr/io.h>
#include <util/delay.h>
#include "lib/xmega/TWI/twi_master_driver.h"
//#include "lib/xmega/twi_slave_driver.h"

#define TWI_BAUDSETTING TWI_BAUD(CPU_SPEED, BAUDRATE)



void set_32mhz_osc() {
	OSC.CTRL |= OSC_RC32MEN_bm;             // Enable 32 Mhz osc.
	while(!(OSC.STATUS & OSC_RC32MRDY_bm)); // Wait for stab. 32Mhz osc.
	OSC.CTRL ^= OSC_RC2MEN_bm;              // Disable 2Mhz oscilator 
	CCP      = CCP_IOREG_gc;                // Trigger protection mechanism
	CLK.CTRL = CLK_SCLKSEL_RC32M_gc;        // Select 32Mhz as system clock
}

TWI_Master_t twi_master;
void init() {
	cli();
	// configure 5v branch as master
	TWI_MasterInit(&twi_master, &TWIE, TWI_MASTER_INTLVL_LO_gc, TWI_BAUDSETTING);
	// enable LO interrupts
	PMIC.CTRL |= PMIC_LOLVLEN_bm;    
	// enable interrupts
	sei();
}


ISR(TWIE_TWIM_vect) {
	TWI_MasterInterruptHandler(&twi_master);
}

/*TWI_Slave_t twi_slave;

ISR(TWIE_TWIS_vect) {
	TWI_SlaveInterruptHandler(&twi_slave);
	PORTD_OUT ^= PIN1_bm;
}*/



void TWIE_SlaveProcessData(void)
{
//	uint8_t bufIndex = twi_slave.bytesReceived;
//	twi_slave.sendData[bufIndex] = (~twiSlave.receivedData[bufIndex]);
}




int main(void) {
	set_32mhz_osc();
	init();
	_delay_ms(100);

/*	TWI_SlaveInitializeDriver(&twi_slave, &TWIE, TWIE_SlaveProcessData);
	TWI_SlaveInitializeModule(&twi_slave,
	                          2,
	                          TWI_SLAVE_INTLVL_LO_gc);
*/
	_delay_ms(2000);

	PORTD_DIR = 0b00000110;
PORTD_OUT |= PIN1_bm;

	uint8_t p[2] = {0x05, 0x00};

	//TWI_MasterWrite(&twi_master, 0b00100000, p, 2);
	//while (twi_master.status != TWIM_STATUS_READY) {
		/* Wait until transaction is complete. */
	//}

	uint8_t p1[2] = { 0x00, 0x00 };
	uint8_t p2[2] = { 0x01, 0x00 };
	uint8_t p3[2] = { 0x02, 0x00 };
	uint8_t p4[2] = { 0x06, 0xff };
	uint8_t p5[2] = { 0x09, 0xff };
	uint8_t p6[2] = { 0x0A, 0x00 };

	TWI_MasterWrite(&twi_master, 0b001000000, p1, 2);
	while (twi_master.status != TWIM_STATUS_READY) {  /*Wait until transaction is complete.*/ }

	TWI_MasterWrite(&twi_master, 0b001000000, p2, 2);
	while (twi_master.status != TWIM_STATUS_READY) {  /*Wait until transaction is complete.*/ }

	TWI_MasterWrite(&twi_master, 0b001000000, p3, 2);
	while (twi_master.status != TWIM_STATUS_READY) {  /*Wait until transaction is complete.*/ }

	TWI_MasterWrite(&twi_master, 0b001000000, p4, 2);
	while (twi_master.status != TWIM_STATUS_READY) {  /*Wait until transaction is complete.*/ }

	TWI_MasterWrite(&twi_master, 0b001000000, p5, 2);
	while (twi_master.status != TWIM_STATUS_READY) {  /*Wait until transaction is complete.*/ }

	TWI_MasterWrite(&twi_master, 0b001000000, p6, 2);
	while (twi_master.status != TWIM_STATUS_READY) {  /*Wait until transaction is complete.*/ }

	while(1) {
		_delay_ms(50);
		/*TWI_MasterRead(&twi_master, 0b00100000, 1);
		while (twi_master.status != TWIM_STATUS_READY) {
		}

		if(twi_master.bytesRead) {
			p[0] = ~(twi_master.readData[0]);
		}*/
		//

		TWI_MasterWrite(&twi_master, 2, p, 2);

		while (twi_master.status != TWIM_STATUS_READY) {
			/* Wait until transaction is complete. */
		}

	//	while(!TWI_MasterReady(&twi_master)) {
	//		_delay_ms(165);
		//	PORTD_OUT ^= PIN1_bm;
		//}
		//TWI_MasterWrite(&twi_master, 0b00100000, p3, 10);

		_delay_ms(1550);
	//	while(!TWI_MasterReady(&twi_master)) {
	//		_delay_ms(165);
	//		PORTD_OUT ^= PIN1_bm;
	//	}

		//p2[1] ^= p2[1];
		//TWI_MasterWrite(&twi_master, 2, p2, 2);
		//while(!TWI_MasterReady(&twi_master)) {}
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
