#ifndef DECODER_H
#define DECODER_H

// ---------------------------------------------------
// internal type for storing counter value for a wheel
// ---------------------------------------------------
typedef uint32_t encval_t;


// ---------------------------------------------------
// define default address for i2c slave device
// ---------------------------------------------------
#define DEFAULT_ENCODER_ADDRESS 0x30

// ---------------------------------------------------
// define commands codes
// ---------------------------------------------------

#define SET_ADDRESS 1 
// sets new i2c slave address
// write: one byte of new address
// read: --

#define SET_ENCODERS 2
// sets the encoder value
// write: two numbers to be set to, left first, right second. Their size is dependent on the encval_t definition (must be sizeof(encval_t)). And beware of the Endians!
// read: --

#define RESET_ENCODERS 3
// resets both left and right encoder values to zero
// write: --
// read: --

#define GET_MASK 0xC0
#define GET_ENCODERS 0x40
#define GET_ENCODERS_SHIFT 0x3F
// read both encoder values, shifted as requested
// the command is ORed with requested shift. The bits under GET_MASK tell how much the value will be shifted right when sending
// write: --
// read: value of the encoder as two-byte value for left, two-byte value for right, one-byte CRC

#define GET_ENCODERS_32 0x80
// read both encoder values, shifted as requested
// the command is ORed with requested shift. The bits under GET_MASK tell how much the value will be shifted right when sending
// write: --
// read: value of the encoder as four-byte value for left, four-byte value for right, one-byte CRC



#endif

