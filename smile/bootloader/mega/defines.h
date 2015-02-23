/* WARNING - manually patched */
/* definitions generated by preprocessor, copy into defines.h */									
#ifndef	PPINC								
#define	_ATMEGA8	// device select: _ATMEGAxxxx							
#define	_B1024	// boot size select: _Bxxxx (words), powers of two only							
#ifdef	__ICCAVR__								
#include	"iom8.h"								
#endif									
#if	__GNUC__								
#include	<avr/io.h>								
#endif									

/* define pin for enter-self-prog-mode */									
#define	PROGPORT	PORTB
#define	PROGPIN		PINB
#define	PROG_NO		PB3
#define DEBUGPORT	PORTD
#define DEBUGDDR	DDRD
#define DEBUGPIN	PIND
#define DEBUG_NO	PD7

/* baud rate register value calculation for U2X mode */		
/* unused #define	CPU_FREQ	16000000 */
#define	BAUD_RATE	38400
#define	BRREG_VALUE	51
	

/* definitions for UART control */		
#define	BAUD_RATE_LOW_REG	UBRRL
#define	UART_CONTROL_REG	UCSRB
#define	ENABLE_TRANSMITTER_BIT	TXEN
#define	ENABLE_RECEIVER_BIT	RXEN
#define	UART_STATUS_REG		UCSRA
#define	TRANSMIT_COMPLETE_BIT	TXC
#define	RECEIVE_COMPLETE_BIT	RXC
#define	UART_DATA_REG		UDR

/* definitions for SPM control */		
#define	SPMCR_REG	SPMCR
#define	PAGESIZE	64
#define	APP_END		6144
//#define	LARGE_MEMORY	

/* definitions for device recognition */		
#define	PARTCODE		0x77
#define	SIGNATURE_BYTE_1	0x1E
#define	SIGNATURE_BYTE_2	0x93
#define	SIGNATURE_BYTE_3	0x07

/* indicate that preprocessor result is included */		
#define	PPINC
#endif	
