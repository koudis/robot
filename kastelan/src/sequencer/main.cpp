#include <stdio.h>
#include <unistd.h>
#include <math.h>

#include "types.h"
#include "variable_loader.h"
#include "i2c_communication.h"
#include "led_driver.h"
#include "input_event_driver.h"
#include "encoder_driver.h"
#include "motor_driver.h"
#include "our_time.h"
#include "strategy.h"

#define time_remain_unload 30

enum STATE {
  EMERGENCY = 0,
  FIXED_ROUTE,
  STANDBY,
  UNLOADING
};

int state;
int last_state;
int wait_for_bumper = 0;

int init_systems();
int shut_systems();
int main_poll();

int main(int argc, char** argv) {
  return -(init_systems() || main_poll() || shut_systems());
}

int main_poll() {
  state = STANDBY; // Vychozi stav automatu
  last_state = STANDBY;
  int fix_step = 0;
  int unl_step = 0;
  u08 last_bumpers = 0;
  int route_variant = 1;

  bool main_running = 1;
  while (main_running) {

    u08 bumpers;
    get_bumpers(&bumpers);
    printf("bumpers: %X\n", bumpers);

    // Skoncila hra, zastavim
    if (time_remaining_s() <= 0) {
       motor_command(0,0,0,1, pos_error_allow);
       main_running = false;
    }

    // Narazim, resim problem
//    else if (bumpers & (~last_bumpers)) {
    else if (bumpers && (bumpers != last_bumpers)) {
      printf("bump_detection: stop\n");
      motor_command(0, 0, 0, 1, pos_error_allow);
      last_state = state == EMERGENCY ? last_state : state;
      state = EMERGENCY;
    }

    last_bumpers = bumpers;

    switch (state) {
      case STANDBY : {
        led_swap(0);
        if (!i2c_start_cable_present()) {
          state = FIXED_ROUTE;
          start_game_watchdog();
          i2c_taos_sort_enable();
        }
        break;
      }
      case EMERGENCY : {
        enc_type pos;
        enc_get(&pos);
        POS_TYPE dest_x;
        POS_TYPE dest_y;

        bool stop;
        motor_get_command(NULL, NULL, NULL, &stop, NULL);
        if (stop) {
          // Narazim zepredu, popojedu pozpatku dozadu
          if ((bumpers & BUMPER_LEFT_FRONT) || (bumpers & BUMPER_RIGHT_FRONT)) {
            dest_x = pos.pos_x - cos(pos.pos_a * PI / 180.0) * emergency_run_dist;
            dest_y = pos.pos_y - sin(pos.pos_a * PI / 180.0) * emergency_run_dist;
            i2c_taos_sort_disable();
            printf("bump_action: FRONT: go back\n");
            motor_command(dest_x, dest_y, 1, 0, pos_error_allow);
          }

          // Narazim zezadu, popojedu popredu dopredu
          else if ((bumpers & BUMPER_LEFT_REAR) || (bumpers & BUMPER_RIGHT_REAR)) {
            if (wait_for_bumper) { // reverse
              motor_command(0,0,0,1, pos_error_allow);
              printf("bump_action: expected action occured: stop\n");
              state = last_state;
            } else {
              dest_x = pos.pos_x + cos(pos.pos_a * PI / 180.0) * emergency_run_dist;
              dest_y = pos.pos_y + sin(pos.pos_a * PI / 180.0) * emergency_run_dist;
              printf("bump_action: REAR: go forward\n");
              motor_command(dest_x, dest_y, 0, 0, pos_error_allow);
            }
          }

          // Narazim zleva, popojedu dopredu a natocim se doleva
          else if (bumpers & BUMPER_LEFT_SIDE) {
            dest_x = pos.pos_x - cos((pos.pos_a - emergency_run_turn) * PI / 180.0) * emergency_run_dist;
            dest_y = pos.pos_y - sin((pos.pos_a - emergency_run_turn) * PI / 180.0) * emergency_run_dist;
            printf("bump_action: LEFT: go left forward\n");
            motor_command(dest_x, dest_y, 0, 0, pos_error_allow);
          }

          // Narazim zprava, popojedu dopredu a natocim se doprava
          else if (bumpers & BUMPER_RIGHT_SIDE) {
            dest_x = pos.pos_x - cos((pos.pos_a + emergency_run_turn) * PI / 180.0) * emergency_run_dist;
            dest_y = pos.pos_y - sin((pos.pos_a + emergency_run_turn) * PI / 180.0) * emergency_run_dist;
            printf("bump_action: RIGHT: go right forward\n");
            motor_command(dest_x, dest_y, 0, 0, pos_error_allow);
          }
          else if (!bumpers) {
            i2c_taos_sort_enable();
            state = last_state;
          }
        }

        break;
      }
      case FIXED_ROUTE : {
        bool stop;
        motor_get_command(NULL, NULL, NULL, &stop, NULL);
        if (!stop)
          break;
        wait_for_bumper = strategy_step();
        break;
      }
      default : {
        return -1;
      }
    }
    usleep(main_loop_usleep);
  }

  return 0;
}

// Inicializace hardware, planovani, zpracovani obrazu
int init_systems() {

  // Nacti vsechny promenne
  var_load(CONFIG_FILE);

  strategy_load("strategy");

  led_init();
  printf("init_systems: 1\n");
  input_event_init();
  printf("init_systems: 2\n");
  enc_init();
  printf("init_systems: 3\n");
  motor_init();
  printf("init_systems: 4\n");
  i2c_init();
  printf("init_systems: done\n");
  return 0;
}

// Zavreni vsech souboru, hardware, ukonceni ostatnich procesu
int shut_systems() {

  // Uloz vsechny promenne
  var_save(CONFIG_FILE);

  i2c_close();
  printf("shut_systems: 1\n");
  motor_close();
  printf("shut_systems: 2\n");
  enc_close();
  printf("shut_systems: 3\n");
  input_event_close();
  printf("shut_systems: 4\n");
  led_close();
  printf("shut_systems: done\n");
  return 0;
}
