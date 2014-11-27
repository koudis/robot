#ifndef LED_DRIVER_H_
#define LED_DRIVER_H_

void led_init();
void led_set(int led, int state);
void led_swap(int led);
void led_close();

#endif
