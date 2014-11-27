#include <stdio.h>
#include <unistd.h>
#include <termios.h>

#define motor_left		0x80
#define motor_right		0x00

void motor_init();
#define motor_both_stop()		uart1SendChar(0x00)
#define motor_speed(m, s)	uart1SendChar((m) | ((s) + 0x40))
void motor_test(int type);

FILE *MOTOR_fil;

int encoder_l=0;
int encoder_r=0;

void delayMS(int del){
  usleep(1000*del);
}

void uart1SendChar(unsigned char s){
  fputc(s, MOTOR_fil);
  fflush(MOTOR_fil);
}

void motor_init() {
  MOTOR_fil = fopen ("/dev/ttyAMA0","w");
  uart1SendChar(0x00);
}

void add_enc() {
  encoder_l+=25;
  encoder_r+=25;
  usleep(1);
}

void motor_ride_straight(int ticks) {
  const int MOTOR_SPEED = 40;
  const int MOTOR_EVEN_CHECK = 1;
  const int MOTOR_EVEN_SENSITIVITY = 10;

  int tstart_l = encoder_l;
  int tend_l = tstart_l + ticks;

  int tstart_r = encoder_r;
  int tend_r = tstart_r + ticks;
  
  printf("start_l = %d  end_l = %d\n", tstart_l, tend_l);
  printf("start_r = %d  end_r = %d\n", tstart_r, tend_r);
 
  motor_speed(motor_left, MOTOR_SPEED);
  motor_speed(motor_right, MOTOR_SPEED);
  
  int counter = 0;
  while (encoder_l < tend_l-3000 && encoder_r < tend_r-3000) {
    if (counter % MOTOR_EVEN_CHECK == 0) {
      //printf("levo = %d   pravo = %d\n", encoder_l, encoder_r);
      motor_speed(motor_left, ((encoder_l-tstart_l - encoder_r+tstart_r) > MOTOR_EVEN_SENSITIVITY) ? (MOTOR_SPEED - 5) : MOTOR_SPEED);
      motor_speed(motor_right, ((encoder_r-tstart_r - encoder_l+tstart_l) > MOTOR_EVEN_SENSITIVITY) ? (MOTOR_SPEED - 5) : MOTOR_SPEED);
    }
    counter++;
    add_enc();
  }
  while (encoder_l < tend_l && encoder_r < tend_r) {
    if (counter % MOTOR_EVEN_CHECK == 0) {
      //printf("levo = %d   pravo = %d\n", encoder_l, encoder_r);
      motor_speed(motor_left, ((encoder_l-tstart_l - encoder_r+tstart_r) > MOTOR_EVEN_SENSITIVITY) ? (12) : 14);
      motor_speed(motor_right, ((encoder_r-tstart_r - encoder_l+tstart_l) > MOTOR_EVEN_SENSITIVITY) ? (12) : 14);
    }
    counter++;
    add_enc();
  }
  printf("levo = %d   pravo = %d\n", encoder_l, encoder_r);
  motor_both_stop();
  
  return;
}

void motor_ride_rotate_left(int alpha) {
  const int MOTOR_SPEED = 40;

  int tstart = encoder_r;
  int tend = tstart + (alpha * 60);
  
  printf("start = %d  end = %d\n", tstart, tend);
 
  motor_speed(motor_right, MOTOR_SPEED);
  
  while (encoder_r < (tend-3000)) {
    add_enc();
  }
  
  motor_speed(motor_right, 14);
  
  while (encoder_r < tend) {
    add_enc();
  }
  printf("levo = %d   pravo = %d\n", encoder_l, encoder_r);
  motor_both_stop();
  
  return;
}

void motor_ride_rotate_right(int alpha) {
  const int MOTOR_SPEED = 40;

  int tstart = encoder_l;
  int tend = tstart + (alpha * 59);
  
  printf("start = %d  end = %d\n", tstart, tend);
 
  motor_speed(motor_left, MOTOR_SPEED);
  
  while (encoder_l < (tend-3000)) {
    add_enc();
  }
  
  motor_speed(motor_left, 14);
  
  while (encoder_l < tend) {
    add_enc();
  }
  printf("levo = %d   pravo = %d\n", encoder_l, encoder_r);
  motor_both_stop();
  
  return;
}

struct termios input_conf(FILE *func_in)//nastavi vstup
{
  struct termios func_orig_set, func_act_set;
  
  tcgetattr(fileno(func_in), &func_orig_set);
  func_act_set = func_orig_set;
  func_act_set.c_lflag &= (~ICANON & ~ECHO);//nezobrazovat + okamzite posilat programu
  tcsetattr(fileno(func_in), TCSANOW, &func_act_set);
  return func_orig_set;
}

void input_deconf(FILE *func_in, struct termios func_orig_set)//vrati nastaveni vstupu na vychozi
{
  tcsetattr(fileno(func_in), TCSANOW, &func_orig_set);
}


int main() {
  motor_init();
  FILE *input;
  struct termios orig_set;

  input = stdin;
//  orig_set = input_conf(input);
printf("start\n");
fflush(stdin);
  int MOTOR_SPEED_R = 38;
  int MOTOR_SPEED_L = 40;

  for (;;) {
    int x, y;
    scanf("%d %d", &x,&y);
    int dif2=(x-505)/6;
    int sum=(505-y);
    motor_speed(motor_left, sum+dif2);
    motor_speed(motor_right, sum-dif2);
    if (x==666 && y==666)
      break;
  }
  
  motor_both_stop();
  motor_both_stop();

  printf("levo  %d\npravo %d\n", encoder_l, encoder_r);
//  input_deconf(input, orig_set);

  return 0;
}

/*
void motor_speed(int motor, int speed)
{
    int c=motor | (speed + 0x40);
    uart1SendChar( c );
    //printf("%x ",c);
}
*/

