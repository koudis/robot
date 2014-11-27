#include <sys/time.h>
#include <stdio.h>
#include <pthread.h>
#include <unistd.h>
#include "our_time.h"
#include "motor_driver.h"
#include "variable_loader.h"

unsigned long time_game_end = 0;
pthread_t time_watchdog_tid;

unsigned long get_cur_ms() {
  struct timeval tv;
  gettimeofday(&tv, NULL);
  return (tv.tv_sec * 1000 + tv.tv_usec / 1000);
}

void *time_watchdog(void *arg) {
  time_game_end = timeend * 1000 + get_cur_ms();
  sleep(timeend);
  motor_close();
  pthread_exit(NULL); // TODO Bug: nikdo na nej neceka
}

void start_game_watchdog() {
  pthread_attr_t *thAttr = NULL;
  pthread_create(&time_watchdog_tid, thAttr, time_watchdog, NULL);
}

unsigned long time_remaining_ms() {
  unsigned long now = get_cur_ms();
  if (time_game_end > now)
    return time_game_end - now;
  else
    return timeend * 1000;
}

unsigned long time_remaining_s() {
  unsigned long now = get_cur_ms();
  if (time_game_end > now)
    return (time_game_end - now)/1000;
  else
    return timeend;
}
