#ifndef ENCODER_DRIVER_H_
#define ENCODER_DRIVER_H_

#include <stdio.h>
#include "variable_loader.h"
#include "i2c_communication.h"

struct enc_type {
  int enc_l;
  int enc_r;
  POS_TYPE pos_x;
  POS_TYPE pos_y;
  POS_TYPE pos_a;
  int time;
};

void enc_init();
void enc_reset();
void enc_close();
void enc_get(enc_type *position);

#endif
