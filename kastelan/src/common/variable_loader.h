#ifndef VARIABLE_LOADER_H_
#define VARIABLE_LOADER_H_

#define POS_TYPE double
#define CONFIG_FILE "variable_list"

// PRIDAT PROMENNOU TADY     !!!! POZOR: prilis dlouhe nazvy nefunguji, program pak pada na bus error a skoro nejde poznat proc !!!!
extern POS_TYPE wheelparam1;
extern POS_TYPE wheelparam2;
extern int speedmax;
extern int main_loop_usleep;
extern int enc_loop_usleep;
extern int pid_loop_usleep;
extern int pid_prop_const;
extern int pid_integ_const;
extern int pid_deriv_const;
extern int xposmin;
extern int xposmax;
extern int yposmin;
extern int yposmax;
extern int timeend;
extern int timewarn;
extern char ourcolor;
extern char ourside;
extern int taos_flipper_center;
extern int taos_flipper_left;
extern int taos_flipper_right;
extern int taos_white_w;
extern int taos_white_r;
extern int taos_white_b;
extern int taos_white_thr;
extern int servo_left_open;
extern int servo_left_close;
extern int servo_right_open;
extern int servo_right_close;
extern POS_TYPE pos_error_allow;
extern POS_TYPE emergency_run_dist;
extern POS_TYPE emergency_run_turn;
// ---------------------

int var_load(const char filename[]);
int var_save(const char filename[]);

#endif
