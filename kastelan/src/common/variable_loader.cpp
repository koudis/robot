#include "variable_loader.h"
#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>

#define LOAD_VAR(VARSTR, VARNAME) if (strcmp(name,#VARNAME) == 0) { sscanf(value, VARSTR, &VARNAME); continue; }
#define SAVE_VAR(VARSTR, VARNAME) fprintf(f, VARSTR, #VARNAME, VARNAME);

// PRIDAT PROMENNOU TADY     !!!! POZOR: prilis dlouhe nazvy nefunguji, program pak pada na bus error a skoro nejde poznat proc !!!!
POS_TYPE wheelparam1;
POS_TYPE wheelparam2;
int speedmax;
int main_loop_usleep;
int enc_loop_usleep;
int pid_loop_usleep;
int pid_prop_const;
int pid_integ_const;
int pid_deriv_const;
int xposmin;
int xposmax;
int yposmin;
int yposmax;
int timeend;
int timewarn;
char ourcolor;
char ourside;
int taos_flipper_center;
int taos_flipper_left;
int taos_flipper_right;
int taos_white_w;
int taos_white_r;
int taos_white_b;
int taos_white_thr;
int servo_left_open;
int servo_left_close;
int servo_right_open;
int servo_right_close;
POS_TYPE pos_error_allow;
POS_TYPE emergency_run_dist;
POS_TYPE emergency_run_turn;
// ---------------------

int var_load(const char filename[]) {
  FILE* f;

  if ((f = fopen(filename, "r")) == NULL) {
    printf("Couldn't open config file for reading!\n");
    return 1;
  }

  char name[20];
  char value[20];
  while (fscanf(f, "%s%s", name, value) >= 0) {

    // PRIDAT PROMENNOU TADY
    LOAD_VAR("%lf", wheelparam1)
    LOAD_VAR("%lf", wheelparam2)
    LOAD_VAR("%d", speedmax)
    LOAD_VAR("%d", main_loop_usleep)
    LOAD_VAR("%d", enc_loop_usleep)
    LOAD_VAR("%d", pid_loop_usleep)
    LOAD_VAR("%d", pid_prop_const)
    LOAD_VAR("%d", pid_integ_const)
    LOAD_VAR("%d", pid_deriv_const)
    LOAD_VAR("%d", xposmin)
    LOAD_VAR("%d", xposmax)
    LOAD_VAR("%d", yposmin)
    LOAD_VAR("%d", yposmax)
    LOAD_VAR("%d", timeend)
    LOAD_VAR("%d", timewarn)
    LOAD_VAR("%c", ourcolor)
    LOAD_VAR("%c", ourside)
    LOAD_VAR("%d", taos_flipper_center)
    LOAD_VAR("%d", taos_flipper_left)
    LOAD_VAR("%d", taos_flipper_right)
    LOAD_VAR("%d", taos_white_w)
    LOAD_VAR("%d", taos_white_r)
    LOAD_VAR("%d", taos_white_b)
    LOAD_VAR("%d", taos_white_thr)
    LOAD_VAR("%d", servo_left_open)
    LOAD_VAR("%d", servo_left_close)
    LOAD_VAR("%d", servo_right_open)
    LOAD_VAR("%d", servo_right_close)
    LOAD_VAR("%lf", pos_error_allow)
    LOAD_VAR("%lf", emergency_run_dist)
    LOAD_VAR("%lf", emergency_run_turn)
    // ---------------------
  }

  fclose(f);
  return 0;
}

int var_save(const char filename[]) {
  FILE* f;

  if ((f = fopen(filename, "w")) == NULL) {
    printf("Couldn't open config file for writing!\n");
    return 1;
  }

  // PRIDAT PROMENNOU TADY
  SAVE_VAR("%s %f\n", wheelparam1)
  SAVE_VAR("%s %f\n", wheelparam2)
  SAVE_VAR("%s %d\n", speedmax)
  SAVE_VAR("%s %d\n", main_loop_usleep)
  SAVE_VAR("%s %d\n", enc_loop_usleep)
  SAVE_VAR("%s %d\n", pid_loop_usleep)
  SAVE_VAR("%s %d\n", pid_prop_const)
  SAVE_VAR("%s %d\n", pid_integ_const)
  SAVE_VAR("%s %d\n", pid_deriv_const)
  SAVE_VAR("%s %d\n", xposmin)
  SAVE_VAR("%s %d\n", xposmax)
  SAVE_VAR("%s %d\n", yposmin)
  SAVE_VAR("%s %d\n", yposmax)
  SAVE_VAR("%s %d\n", timeend)
  SAVE_VAR("%s %d\n", timewarn)
  SAVE_VAR("%s %c\n", ourcolor)
  SAVE_VAR("%s %c\n", ourside)
  SAVE_VAR("%s %d\n", taos_flipper_center)
  SAVE_VAR("%s %d\n", taos_flipper_left)
  SAVE_VAR("%s %d\n", taos_flipper_right)
  SAVE_VAR("%s %d\n", taos_white_w)
  SAVE_VAR("%s %d\n", taos_white_r)
  SAVE_VAR("%s %d\n", taos_white_b)
  SAVE_VAR("%s %d\n", taos_white_thr)
  SAVE_VAR("%s %d\n", servo_left_open)
  SAVE_VAR("%s %d\n", servo_left_close)
  SAVE_VAR("%s %d\n", servo_right_open)
  SAVE_VAR("%s %d\n", servo_right_close)
  SAVE_VAR("%s %f\n", pos_error_allow)
  SAVE_VAR("%s %f\n", emergency_run_dist)
  SAVE_VAR("%s %f\n", emergency_run_turn)
  // ---------------------

  fclose(f);
  return 0;
}

#ifdef STANDALONE
int main(int argc, char** argv) {
  var_load("variable_list");
  var_save("variable_list");
}
#endif
