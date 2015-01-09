
#define F_CPU 32000000
#include <inttypes.h>
#include <avr/io.h>
#include <util/delay.h>

void set_32mhz_osc() {
	OSC.CTRL |= OSC_RC32MEN_bm;             // Enable 32 Mhz osc.
	while(!(OSC.STATUS & OSC_RC32MRDY_bm)); // Wait for stab. 32Mhz osc.
	OSC.CTRL ^= OSC_RC2MEN_bm;              // Disable 2Mhz oscilator 
	CCP      = CCP_IOREG_gc;                // Trigger protection mechanism
	CLK.CTRL = CLK_SCLKSEL_RC32M_gc;        // Select 32Mhz as system clock
}


/**
 * Lib for TWI communication for atxmega128a 
*/
#define uTWI_MODE_READ  0
#define uTWI_MODE_WRITE 1
typedef struct utwi_data {
	uint8_t    mode;
	uint8_t    addr;
	TWI_struct twi;

} utwi_d


/**
 * Interrupts must be enabled!
*/
void twi_init(utwi_d* twi) {
	// No SDA hold time (defaul behavior)
	//twi.twi.CTRL;

	// Select interrupt as low-level (01)
	twi.twi.CTRLA |= TWI_MASTER_INTLVL1_bm;
	// Enable interrupts for read and write
	twi.twi.CTRLA |= TWI_MASTER_RIEN_bm | TWI_MASTER_WIEN_bm

	/**
	 *  Baud must be set before master enable
	 *  BAUD = (fsys / (2*ftwi)) - 5,
	 *  ftwi = 100kHz
	*/
	twi.twi.BAUD  = 155;

	// No QCEN, no Timeout, enable Smart Mode
	twi.twi.CTRLB |= TWI_MASTER_SMEN_bm;

	// Select TWIC as master
	twi.twi.CTRLA |= TWI_MASTER_ENABLE_bm;

	// No explicit ACK bit! (smart mode enabled ;))
	//TWIC.CTRLC;
}



void twi_master_start(utwi_d* twi) {
	// Prepare value for ADDR register
	uint8_t addr;
	addr = twi.addr | (twi.mode << 7);

	while(
	  // Wait for idle status
	  (twi.twi.STATUS & (TWI_MASTER_BUSSTATE_gm ^ TWI_MASTER_BUSSTATE0_bm)) ||
	  // Ouuu, Unknown status
	  (!twi.twi.STATUS)
	);

	// Send start "bit" (maybe is not necessary)
	//TWIC.CTRLC |= TWI_MASTER_CMD0_bm;

	twi.twi.ADDR = addr;
}



void twi_master_end(utwi_d* twi) {
	// Send end bit
	twi.twi.CTRLC |= TWI_MASTER_CMD0_bm | TWI_MASTER_CMD1_bm;
}


void twi_master_set_data(utwi_d* twi, uint8_t data) {
	while()
}

ISR(TWIC_MASTER_vector) {
}

ISR(TWIC_SLAVE_vector) {
}




void init() {
	// Enable interrupts
	CPU_SREG |= CPU_I_bm;
}


int main(void) {
	init();
	set_32mhz_osc();
	_delay_ms(100);

	PORTC_DIR = 0b00100000;
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
	}
}
