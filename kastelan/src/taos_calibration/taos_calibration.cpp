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

void print_help() {
  printf("Program na kalibraci TAOSu.\n");
  printf("1 - nastav servo na levou přihrádku\n");
  printf("2 - nastav servo doprostřed\n");
  printf("3 - nastav servo na pravou přihrádku\n");
  printf("7 - začni sám třídit\n");
  printf("9 - přestaň sám třídit\n");
  printf("H - nápověda\n");
  printf("G - sejmi barvu\n");
  printf("F - přečti barvu\n");
  printf("Enter - sejmi + přečti barvu\n");
  printf("W - Nastav aktuální barvu jako referenci bílé\n");
  printf("T - Nastav aktuální barvu jako práh mezi bílou a pukem\n");
  printf("O - Nastav aktuální barvu jako naši\n");
  printf("S - ulož konfiguraci do variable_list\n");
  printf("P - vypiš aktuální konfiguraci\n");
  printf("Q - skonči bez uložení\n");
  printf("\n");
}

int main_poll() {
  u16 r,g,b,w;
  char col='N';
  for (;;) {
    int k = input_event_wait_for_key_press();
    if (k==KEY_1)
      i2c_taos_set_servo(TAOS_FLIPPER, taos_flipper_left);
    if (k==KEY_2)
      i2c_taos_set_servo(TAOS_FLIPPER, taos_flipper_center);
    if (k==KEY_3)
      i2c_taos_set_servo(TAOS_FLIPPER, taos_flipper_right);
    if (k==KEY_7)
      i2c_taos_sort_enable();
    if (k==KEY_9)
      i2c_taos_sort_disable();

    if (k==KEY_H)
      print_help();
    if (k==KEY_G)
      i2c_taos_get_color();
    if (k==KEY_F)
      col = i2c_taos_fetch_color(&r, &g, &b, &w);

    if (k==KEY_ENTER) {
      i2c_taos_get_color();
      usleep(1000*130);
      col = i2c_taos_fetch_color(&r, &g, &b, &w);
    }

    if (k==KEY_W) {
      taos_white_w = w;
      taos_white_r = r;
      taos_white_b = b;
      i2c_taos_config();
    }

    if (k==KEY_T) {
      taos_white_thr = w;
      i2c_taos_config();
    }

    if (k==KEY_O) {
      if (col=='R' || col=='B')
        ourcolor = col;
    }

    if (k==KEY_S)
      var_save(CONFIG_FILE); //Uloz vsechny promenne

    if (k==KEY_P) {
      printf("white_w = %i\n", taos_white_w);
      printf("white_r = %i\n", taos_white_r);
      printf("white_b = %i\n", taos_white_b);
      printf("white_thr = %i\n", taos_white_thr);
      printf("ourcolor = %c\n\n", ourcolor);
    }

    if (k==KEY_Q)
      break;
    sched_yield();
  }
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

  print_help();
  main_poll();

  return shut_systems();
}
