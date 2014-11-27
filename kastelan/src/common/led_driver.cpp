#include <fcntl.h>
#include <unistd.h>
#include "led_driver.h"

int led_0, led_1;
bool led_status_0;
bool led_status_1;

void led_init() {
  led_0 = open("/sys/class/gpio/gpio24/value", O_WRONLY);
  led_1 = open("/sys/class/gpio/gpio25/value", O_WRONLY);
  led_set(0, 0);
  led_set(1, 0);
}

void led_set(int led, int state) {
  int fd;
  if (state != 0)
    state = 1;

  if (led == 0) {
    led_status_0 = state;
    fd = led_0;
  }
  else if (led == 1) {
    led_status_1 = state;
    fd = led_1;
  }
  else
    return;

  if (state)
    write(fd, "0", 1); // led on
  else
    write(fd, "1", 1);
}

void led_swap(int led) {
  int fd;
  int state;

  if (led == 0) {
    led_status_0 = (led_status_0 + 1) % 2;
    state = led_status_0;
    fd = led_0;
  }
  else if (led == 1) {
    led_status_1 = (led_status_1 + 1) % 2;
    state = led_status_1;
    fd = led_1;
  }
  else
    return;

  if (state)
    write(fd, "0", 1); // led on
  else
    write(fd, "1", 1);
}

void led_close() {
  led_set(0, 1);
  led_set(1, 1);
  close(led_0);
  close(led_1);
}
