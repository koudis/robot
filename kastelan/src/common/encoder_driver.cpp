#include <stdio.h>
#include <unistd.h>
#include <math.h>
#include <pthread.h>

#include "encoder_driver.h"
#include "variable_loader.h"
#include "i2c_communication.h"

int enc_l_last;
int enc_r_last;

POS_TYPE pos_x;
POS_TYPE pos_y;
POS_TYPE pos_a;
int pos_time;

bool enc_running;
pthread_t enc_loop_tid;
pthread_mutex_t enc_lock;

inline void enc_read() {
  pthread_mutex_lock(&enc_lock);

  u08 buf[9];
  i2c_encoder_get(buf);
  int enc_l_new = *((unsigned int *)buf);
  int enc_r_new = *((unsigned int *)(buf+4));

  int dl = enc_l_new - enc_l_last;
  int dr = enc_r_new - enc_r_last;
  POS_TYPE da = dr - dl;

  POS_TYPE rad = pos_a * PI;
  POS_TYPE cosinus = cos(rad/180.0);
  POS_TYPE   sinus = sin(rad/180.0);

  pos_x += cosinus*(dr+dl)/wheelparam2;
  pos_y +=   sinus*(dr+dl)/wheelparam2;
  pos_a += da / wheelparam1;
  if (pos_a >= 360)
    pos_a -= 360;
  if (pos_a < 0)
    pos_a += 360;
  enc_l_last = enc_l_new;
  enc_r_last = enc_r_new;
  pos_time++;

  pthread_mutex_unlock(&enc_lock);
}

inline void enc_reset() {
  pthread_mutex_lock(&enc_lock);

  // TODO implement in atmega
  /*
  fputc ('R', enc_l_h); // tak a je to tady, tohle nefunguje tak uplne nejlip (echo -n R > /dev/enc0) funguje
  fputc ('R', enc_r_h);
  fflush(enc_l_h);
  fflush(enc_r_h);
  */

  u08 buf[9];
  i2c_encoder_get(buf);
  enc_l_last = *((unsigned int *)buf);
  enc_r_last = *((unsigned int *)(buf+4));

  pos_x = 0;
  pos_y = 0;
  pos_a = 0;

  pthread_mutex_unlock(&enc_lock);
}

void *enc_loop(void *arg) {
  while (enc_running) {
    enc_read();
    printf("enc_loop: %i, %i I'am at %f, %f, %f\n", enc_l_last, enc_r_last, pos_x, pos_y, pos_a);
    usleep(enc_loop_usleep);
  }
  pthread_exit(NULL);
}

void enc_init() {
  i2c_init_encoder();

  enc_reset();
  pos_time = 0;

  enc_running = 1;
  pthread_mutex_init(&enc_lock, NULL);
  pthread_attr_t *thAttr = NULL;
  pthread_create(&enc_loop_tid, thAttr, enc_loop, NULL);
}

void enc_close() {
  enc_running = 0;
  void *enc_loop_return;
  pthread_join(enc_loop_tid, &enc_loop_return);

  i2c_close_encoder();
}

void enc_get(enc_type *position) {
  pthread_mutex_lock(&enc_lock);
   position->enc_l = enc_l_last;
   position->enc_r = enc_r_last;
   position->pos_x = pos_x;
   position->pos_y = pos_y;
   position->pos_a = pos_a;
   position->time  = pos_time;
  pthread_mutex_unlock(&enc_lock);
}
