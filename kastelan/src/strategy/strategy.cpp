#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include "variable_loader.h"
#include "strategy.h"
#include "i2c_communication.h"
#include "motor_driver.h"

struct wpt {
  int x;
  int y;
  int rev;
  int unload;
  int sleep;
};

struct wpt **strat;
int *cycle;
int cycle_size;
int cycle_position;
int strategy_position;

int strategy_load(const char filename[]) {
  FILE* f;
  char name[100];
  char value[100];

  if ((f = fopen(filename, "r")) == NULL) {
    printf("Couldn't open strategy file for reading!\n");
    return 1;
  }

  int i,j;
  while (fscanf(f, "%s%s", name, value) >= 0) {
    if (strcmp(name,"strategies") == 0) {
      sscanf(value, "%d", &i);
      printf("strat: alloc %i\n", i * sizeof(struct wpt *));
      strat = (struct wpt **) calloc(i, sizeof(struct wpt *));
      i = -1;
      continue;
    }
    if (strcmp(name,"begin") == 0) {
      sscanf(value, "%d", &j);
      i++;
      printf("strat: alloc %i\n", (j+1) * sizeof(struct wpt));
      strat[i] = (struct wpt *) calloc(j+1, sizeof(struct wpt));
      struct wpt tmp;
      tmp.x=j;
      strat[i][0] = tmp;
      j=1;
      continue;
    }
    if (strcmp(name,"wpt") == 0) {
      int x,y,rev,unload,sleep;
      sscanf(value, "%d,%d,%d,%d,%d", &x,&y,&rev,&unload,&sleep);
      printf("add wpt %d,%d,%d,%d,%d\tto%d %d\n", x,y,rev,unload,sleep,i,j);
      strat[i][j].x = x;
      strat[i][j].y = y;
      strat[i][j].rev = rev;
      strat[i][j].unload = unload;
      strat[i][j].sleep = sleep;
      j++;
      continue;
    }
    if (strcmp(name,"fixed") == 0) {
      sscanf(value, "%d", &cycle_size);
      printf("strat: alloc %i\n", cycle_size * sizeof(int));
      cycle = (int *) calloc(cycle_size, sizeof(int));
      cycle_size = 0;
      continue;
    }
    if (strcmp(name,"str") == 0) {
      sscanf(value, "%d", cycle+cycle_size);
      cycle_size++;
      continue;
    }
  }
  cycle_position = 0;
  strategy_position = 1;
}

void do_servo(const struct wpt *goal) {
        if (goal->unload == 1) {
          if (ourside == 'L') {
            i2c_servo_set_servo(SERVO_LEFT, servo_left_open);
          } else {
            i2c_servo_set_servo(SERVO_RIGHT, servo_right_open);
          }
        }
        else if (goal->unload == 2) {
          if (ourside == 'L') {
            i2c_servo_set_servo(SERVO_LEFT, servo_left_close);
          } else {
            i2c_servo_set_servo(SERVO_RIGHT, servo_right_close);
          }
        }
        usleep(goal->sleep);
}

int strategy_step() {
  int next = 1;
  struct wpt *goal;
  while (next) {
    printf("STRATEGY: %i %i %i\n",cycle_position, cycle[cycle_position], strategy_position);
    next = 0;
    goal = strat[cycle[cycle_position]] + strategy_position;
    printf("use wpt %d,%d,%d,%d,%d\n", goal->x,goal->y,goal->rev,goal->unload,goal->sleep);
    if (goal->unload) {
      enc_type pos;
      enc_get(&pos);
      if (!((pos.pos_x > goal->x) || (pos.pos_y > goal->y))) {
        do_servo(goal);
      }
      else {
        u16 r,g,b,w;
        char col='N';
        i2c_taos_get_color();
        usleep(1000*130);
        if (i2c_taos_fetch_color(&r, &g, &b, &w) == ourcolor)
          do_servo(goal);
      }
      next = 1;
    }
    else if ((goal->rev&3) == 0) {
      i2c_taos_sort_enable();
      motor_command(goal->x, goal->y, 0, 0, pos_error_allow);
    }
    else if ((goal->rev&3) == 1) {
      i2c_taos_sort_enable();
      motor_command(goal->x, goal->y, 1, 0, pos_error_allow);
    }
    else if ((goal->rev&3) == 2) {
      i2c_taos_sort_disable();
      motor_command(goal->x, goal->y, 0, 0, pos_error_allow);
    }
    else if ((goal->rev&3) == 3) {
      i2c_taos_sort_disable();
      motor_command(goal->x, goal->y, 1, 0, pos_error_allow);
    }

    strategy_position++;
    if (strategy_position > strat[cycle[cycle_position]][0].x) {
      strategy_position = 1;
      cycle_position++;
      if (cycle_position >= cycle_size)
        cycle_position = 0;
    }
  }
  printf("STRATEGY: done\n");
  return (goal->rev >> 2)&1;
}
