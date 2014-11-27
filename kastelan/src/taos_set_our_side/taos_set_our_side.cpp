#include <stdio.h>
#include <math.h>
#include <pthread.h>
#include <time.h>
#include <unistd.h>

#include "types.h"
#include "variable_loader.h"
#include "i2c_communication.h"
#include "led_driver.h"
#include "input_event_driver.h"
#include "encoder_driver.h"
#include "motor_driver.h"
#include "our_time.h"

int main_poll() {
  u16 r,g,b,w;
  char col='N';
  usleep(1000*130);
  i2c_taos_get_color();
  usleep(1000*130);
  col = i2c_taos_fetch_color(&r, &g, &b, &w);
  if (col=='R' || col=='B')
    ourcolor = col;

  printf("ourcolor = %c\n\n", ourcolor);
  var_save(CONFIG_FILE); //Uloz vsechny promenne
  return 0;
}

int init_systems() {
  var_load(CONFIG_FILE); // Nacti vsechny promenne
  input_event_init(); // Klavesnice
  i2c_init(); // Priprav i2c komunikaci

  return 0;
}

int shut_systems() {
  i2c_close(); // Zavri i2c soubory
  input_event_close(); // Klavesnice
  return 0;
}

int main(int argc, char** argv) {
  if (init_systems())
    return -1;

  main_poll();

  return shut_systems();
}
