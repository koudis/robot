#ifndef MOTOR_DRIVER_H_
#define MOTOR_DRIVER_H_

#include <stdio.h>
#include "variable_loader.h"
#include "i2c_communication.h"
#include "encoder_driver.h"

#define BUMPER_RIGHT_FRONT  1
#define BUMPER_RIGHT_SIDE   2
#define BUMPER_RIGHT_REAR   4
#define BUMPER_LEFT_FRONT  32
#define BUMPER_LEFT_SIDE   16
#define BUMPER_LEFT_REAR    8

#define VERBOSE

extern FILE *motor_h;
void motor_init();
void motor_close();

void motor_stop();
int rotate_to_pos(POS_TYPE want_x, POS_TYPE want_y, u08* bumpers, u08* flags);
int rotate_to_pos_rev(POS_TYPE want_x, POS_TYPE want_y, u08* bumpers, u08* flags);
int rotate_to(POS_TYPE want_a, u08* bumpers, u08* flags);
int go_to_pos();
int go_to_pos_rev();
void motor_command(POS_TYPE want_x, POS_TYPE want_y, bool reverse, bool stop, int distance_no_angle);
void motor_get_command(POS_TYPE *want_x, POS_TYPE *want_y, bool *reverse, bool *stop, int *distance_no_angle);

/////////////////////////////
void virtual_bumpers_init();
void virtual_bumpers_set_speed(int speed, int ang_speed);
void virtual_bumpers_set_enc(const enc_type *last, const enc_type *act);
void get_bumpers_virtual(u08* value);
void get_bumpers(u08* value);

#endif
