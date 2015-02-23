
#include "ENCODER_quadrature.h"
#include <util/atomic.h>



/**
 * States in this array represents encoder states
 *    S0,
 *    S1,
 *    S2,
 *    S3
 * BUNO: forward
*/
const EncoderState_t enc_state_order_f[4] = {
	S1, // S0 ==> S1
	S0, // S3 ==> S0
	S2, // S1 ==> S2
	S3, // S2 ==> S3
};

/**
 * States in this array represents encoder states
 *    S3,
 *    S2,
 *    S1,
 *    S0
 * BUNO: backward
*/
const EncoderState_t enc_state_order_b[4] = {
	S3, // S0 ==> S3
	S2, // S3 ==> S2
	S0, // S1 ==> S0
	S1, // S2 ==> S1
};

// Now, we can easily change order :).
const EncoderState_t* const enc_state_order[2] = {
	enc_state_order_f,
	enc_state_order_b
};



__attribute__((always_inline)) void encoder_inta(Encoder_t* enc) {
	ATOMIC_BLOCK(ATOMIC_FORCEON) {
		enc->last_state[0] = enc->last_state[1];
		enc->last_state[1] = enc->last_state[1] ^ Encoder_IRQ_A_MASK;
	}

	if(enc_state_order[Encoder_LEADING_A][enc->last_state[0]] == enc->last_state[1]) {
		enc->direction = Encoder_DIRECTION_FORWARD;
		enc->counter_a += 1;
	} else if(enc_state_order[Encoder_LEADING_B][enc->last_state[0]] == enc->last_state[1]) {
		enc->direction = Encoder_DIRECTION_BACKWARD;
		enc->counter_a -= 1;
	}
}

__attribute__((always_inline))  void encoder_intb(Encoder_t* enc) {
	ATOMIC_BLOCK(ATOMIC_FORCEON) {
		enc->last_state[0] = enc->last_state[1];
		enc->last_state[1] = enc->last_state[1] ^ Encoder_IRQ_B_MASK;
	}

	if(enc_state_order[Encoder_LEADING_A][enc->last_state[0]] == enc->last_state[1]) {
		enc->direction = Encoder_DIRECTION_FORWARD;
		enc->counter_b += 1;
	} else if(enc_state_order[Encoder_LEADING_B][enc->last_state[0]] == enc->last_state[1]) {
		enc->direction = Encoder_DIRECTION_BACKWARD;
		enc->counter_b -= 1;
	}
}
