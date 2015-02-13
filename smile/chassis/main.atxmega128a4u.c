
#define F_CPU 32000000
#include <inttypes.h>
#include <avr/io.h>
#include <util/delay.h>
#include "../xmega_twi/twi_master_driver.h"

void set_32mhz_osc() {
	OSC.CTRL |= OSC_RC32MEN_bm;             // Enable 32 Mhz osc.
	while(!(OSC.STATUS & OSC_RC32MRDY_bm)); // Wait for stab. 32Mhz osc.
	OSC.CTRL ^= OSC_RC2MEN_bm;              // Disable 2Mhz oscilator 
	CCP      = CCP_IOREG_gc;                // Trigger protection mechanism
	CLK.CTRL = CLK_SCLKSEL_RC32M_gc;        // Select 32Mhz as system clock
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
