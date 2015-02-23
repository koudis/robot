#ifndef LIB_ENCODER_quadrature
#define LIB_ENCODER_quadrature

#include <inttypes.h>

/**
 *  ;
 *  USAGE:
 *    1) create instance of Encoder_t;
 *    2) enable two independent interrupts
 *    3) encoder_inta and encoder_intb represetns
 *       implementation of ite. for quadrature encoder
*/

/**
 * Choose leading channel.
 * You must specify order for both channels!
*/
#ifndef Encoder_LEADING_A
#define Encoder_LEADING_A 0
#endif
#ifndef Encoder_LEADING_B
#define Encoder_LEADING_B 1
#endif

#ifndef Encoder_IRQ_A_VECTOR
#define Encoder_IRQ_A_VECTOR 
#endif
#ifndef Encoder_IRQ_B_VECTOR
#define Encoder_IRQ_B_VECTOR 
#endif

#define Encoder_IRQ_A_MASK 0b10 
#define Encoder_IRQ_B_MASK 0b01 

#define Encoder_DIRECTION_FORWARD  1
#define Encoder_DIRECTION_BACKWARD 2
#define Encoder_DIRECTION_DEFAULT  0

struct Encoder_s {
	int32_t counter_a;
	int32_t counter_b;
	uint8_t  last_state[2];
	uint8_t  direction;
};
typedef struct Encoder_s Encoder_t;

typedef enum {
	S0 = 0b00, // 0
	S1 = 0b10, // 2
	S2 = 0b11, // 3
	S3 = 0b01  // 1
} EncoderState_t;



/**
 * Interupt for A channel
*/
void encoder_inta(Encoder_t* enc);

/**
 * Interupt for B channel
*/
void encoder_intb(Encoder_t* enc);




#endif
