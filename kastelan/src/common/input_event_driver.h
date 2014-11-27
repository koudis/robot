#ifndef INPUT_EVENT_DRIVER_H_
#define INPUT_EVENT_DRIVER_H_

#include <linux/input.h>

#define INPUT_EVENT_FILE "/dev/input/event0"

void input_event_print_event_type(int i);
void input_event_print_key_name(int i);

void input_event_init();
void input_event_close();
struct input_event input_event_wait_for_key();
int input_event_wait_for_key_press();
int input_event_is_key_pressed(int i);

#endif
