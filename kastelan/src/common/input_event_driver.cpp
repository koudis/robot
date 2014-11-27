// Example linux input reader
// (c) 2014 Jan Hadrava <jhadrava@gmail.com>
//
// Inspired by "Using the Input Subsystem, Part II" <http://www.linuxjournal.com/article/6429>

#include <stdio.h>
#include <stdlib.h>
#include <linux/input.h>
#include <fcntl.h>
#include <unistd.h>
#include "input_event_driver.h"

// Maximum string length
#define MAX_LEN	0x80

// TODO: We should print error using perror.
#define TRY(a, b)	if(a) { printf(b); return; }

// Conversion tables are based on linux/input.h.
void input_event_print_event_type(int i) {
	switch (i) {
		case EV_SYN:       printf("EV_SYN");       break;
		case EV_KEY:       printf("EV_KEY");       break;
		case EV_REL:       printf("EV_REL");       break;
		case EV_ABS:       printf("EV_ABS");       break;
		case EV_MSC:       printf("EV_MSC");       break;
		case EV_SW:        printf("EV_SW");        break;
		case EV_LED:       printf("EV_LED");       break;
		case EV_SND:       printf("EV_SND");       break;
		case EV_REP:       printf("EV_REP");       break;
		case EV_FF:        printf("EV_FF");        break;
		case EV_PWR:       printf("EV_PWR");       break;
		case EV_FF_STATUS: printf("EV_FF_STATUS"); break;
		default:           printf("<unknown>");
	}
}

void input_event_print_key_name(int i) {
	switch (i) {
		case KEY_RESERVED:    printf("KEY_RESERVED");   break;
		case KEY_ESC:         printf("KEY_ESC");        break;
		case KEY_1:           printf("KEY_1");          break;
		case KEY_2:           printf("KEY_2");          break;
		case KEY_3:           printf("KEY_3");          break;
		case KEY_4:           printf("KEY_4");          break;
		case KEY_5:           printf("KEY_5");          break;
		case KEY_6:           printf("KEY_6");          break;
		case KEY_7:           printf("KEY_7");          break;
		case KEY_8:           printf("KEY_8");          break;
		case KEY_9:           printf("KEY_9");          break;
		case KEY_0:           printf("KEY_0");          break;
		case KEY_MINUS:       printf("KEY_MINUS");      break;
		case KEY_EQUAL:       printf("KEY_EQUAL");      break;
		case KEY_BACKSPACE:   printf("KEY_BACKSPACE");  break;
		case KEY_TAB:         printf("KEY_TAB");        break;
		case KEY_Q:           printf("KEY_Q");          break;
		case KEY_W:           printf("KEY_W");          break;
		case KEY_E:           printf("KEY_E");          break;
		case KEY_R:           printf("KEY_R");          break;
		case KEY_T:           printf("KEY_T");          break;
		case KEY_Y:           printf("KEY_Y");          break;
		case KEY_U:           printf("KEY_U");          break;
		case KEY_I:           printf("KEY_I");          break;
		case KEY_O:           printf("KEY_O");          break;
		case KEY_P:           printf("KEY_P");          break;
		case KEY_LEFTBRACE:   printf("KEY_LEFTBRACE");  break;
		case KEY_RIGHTBRACE:  printf("KEY_RIGHTBRACE"); break;
		case KEY_ENTER:       printf("KEY_ENTER");      break;
		case KEY_LEFTCTRL:    printf("KEY_LEFTCTRL");   break;
		case KEY_A:           printf("KEY_A");          break;
		case KEY_S:           printf("KEY_S");          break;
		case KEY_D:           printf("KEY_D");          break;
		case KEY_F:           printf("KEY_F");          break;
		case KEY_G:           printf("KEY_G");          break;
		case KEY_H:           printf("KEY_H");          break;
		case KEY_J:           printf("KEY_J");          break;
		case KEY_K:           printf("KEY_K");          break;
		case KEY_L:           printf("KEY_L");          break;
		case KEY_SEMICOLON:   printf("KEY_SEMICOLON");  break;
		case KEY_APOSTROPHE:  printf("KEY_APOSTROPHE"); break;
		case KEY_GRAVE:       printf("KEY_GRAVE");      break;
		case KEY_LEFTSHIFT:   printf("KEY_LEFTSHIFT");  break;
		case KEY_BACKSLASH:   printf("KEY_BACKSLASH");  break;
		case KEY_Z:           printf("KEY_Z");          break;
		case KEY_X:           printf("KEY_X");          break;
		case KEY_C:           printf("KEY_C");          break;
		case KEY_V:           printf("KEY_V");          break;
		case KEY_B:           printf("KEY_B");          break;
		case KEY_N:           printf("KEY_N");          break;
		case KEY_M:           printf("KEY_M");          break;
		case KEY_COMMA:       printf("KEY_COMMA");      break;
		case KEY_DOT:         printf("KEY_DOT");        break;
		case KEY_SLASH:       printf("KEY_SLASH");      break;
		case KEY_RIGHTSHIFT:  printf("KEY_RIGHTSHIFT"); break;
		case KEY_KPASTERISK:  printf("KEY_KPASTERISK"); break;
		case KEY_LEFTALT:     printf("KEY_LEFTALT");    break;
		case KEY_SPACE:       printf("KEY_SPACE");      break;
		case KEY_CAPSLOCK:    printf("KEY_CAPSLOCK");   break;
		case KEY_F1:          printf("KEY_F1");         break;
		case KEY_F2:          printf("KEY_F2");         break;
		case KEY_F3:          printf("KEY_F3");         break;
		case KEY_F4:          printf("KEY_F4");         break;
		case KEY_F5:          printf("KEY_F5");         break;
		case KEY_F6:          printf("KEY_F6");         break;
		case KEY_F7:          printf("KEY_F7");         break;
		case KEY_F8:          printf("KEY_F8");         break;
		case KEY_F9:          printf("KEY_F9");         break;
		case KEY_F10:         printf("KEY_F10");        break;
		case KEY_NUMLOCK:     printf("KEY_NUMLOCK");    break;
		case KEY_SCROLLLOCK:  printf("KEY_SCROLLLOCK"); break;
		case KEY_KP7:         printf("KEY_KP7");        break;
		case KEY_KP8:         printf("KEY_KP8");        break;
		case KEY_KP9:         printf("KEY_KP9");        break;
		case KEY_KPMINUS:     printf("KEY_KPMINUS");    break;
		case KEY_KP4:         printf("KEY_KP4");        break;
		case KEY_KP5:         printf("KEY_KP5");        break;
		case KEY_KP6:         printf("KEY_KP6");        break;
		case KEY_KPPLUS:      printf("KEY_KPPLUS");     break;
		case KEY_KP1:         printf("KEY_KP1");        break;
		case KEY_KP2:         printf("KEY_KP2");        break;
		case KEY_KP3:         printf("KEY_KP3");        break;
		case KEY_KP0:         printf("KEY_KP0");        break;
		case KEY_KPDOT:       printf("KEY_KPDOT");      break;

		case KEY_102ND:       printf("KEY_102ND");      break;
		case KEY_F11:         printf("KEY_F11");        break;
		case KEY_F12:         printf("KEY_F12");        break;
		case KEY_KPJPCOMMA:   printf("KEY_KPJPCOMMA");  break;
		case KEY_KPENTER:     printf("KEY_KPENTER");    break;
		case KEY_RIGHTCTRL:   printf("KEY_RIGHTCTRL");  break;
		case KEY_KPSLASH:     printf("KEY_KPSLASH");    break;
		case KEY_SYSRQ:       printf("KEY_SYSRQ");      break;
		case KEY_RIGHTALT:    printf("KEY_RIGHTALT");   break;
		case KEY_LINEFEED:    printf("KEY_LINEFEED");   break;
		case KEY_HOME:        printf("KEY_HOME");       break;
		case KEY_UP:          printf("KEY_UP");         break;
		case KEY_PAGEUP:      printf("KEY_PAGEUP");     break;
		case KEY_LEFT:        printf("KEY_LEFT");       break;
		case KEY_RIGHT:       printf("KEY_RIGHT");      break;
		case KEY_END:         printf("KEY_END");        break;
		case KEY_DOWN:        printf("KEY_DOWN");       break;
		case KEY_PAGEDOWN:    printf("KEY_PAGEDOWN");   break;
		case KEY_INSERT:      printf("KEY_INSERT");     break;
		case KEY_DELETE:      printf("KEY_DELETE");     break;
		case KEY_MACRO:       printf("KEY_MACRO");      break;
		case KEY_MUTE:        printf("KEY_MUTE");       break;
		case KEY_VOLUMEDOWN:  printf("KEY_VOLUMEDOWN"); break;
		case KEY_VOLUMEUP:    printf("KEY_VOLUMEUP");   break;
		case KEY_POWER:       printf("KEY_POWER");      break;
		case KEY_KPEQUAL:     printf("KEY_KPEQUAL");    break;
		case KEY_KPPLUSMINUS: printf("KEY_KPPLUSMINUS");break;
		case KEY_PAUSE:       printf("KEY_PAUSE");      break;
		case KEY_SCALE:       printf("KEY_SCALE");      break;

		case KEY_KPCOMMA:     printf("KEY_KPCOMMA");    break;
		case KEY_LEFTMETA:    printf("KEY_LEFTMETA");   break;
		case KEY_RIGHTMETA:   printf("KEY_RIGHTMETA");  break;
		case KEY_COMPOSE:     printf("KEY_COMPOSE");    break;

		default:              printf("<unknown>");
	}
}

int input_device;

void input_event_close() {
	close(input_device);
}

void input_event_init() {
	TRY((input_device = open(INPUT_EVENT_FILE, O_RDONLY)) < 0, "Unable to open device\n");

#ifdef debug
	int version;
	TRY(ioctl(input_device, EVIOCGVERSION, &version) < 0, "Unable to read version\n");
	printf("Version: %i.%i+%i (%p)\n", version>>16, (version>>8)&0xFF, version&0xFF, version); // major version, minor version, patch level

	struct input_id id;
	TRY(ioctl(input_device, EVIOCGID, &id) < 0, "Unable to read id\n");
	printf("Id:\n");
	printf("\tBustype: %i (%p)\n", id.bustype, id.bustype);
	if (id.bustype == BUS_USB)
		printf("\t\tUSB\n");
	printf("\tVendor: %i (%p)\n", id.vendor, id.vendor);
	printf("\tProduct: %i (%p)\n", id.product, id.product);
	printf("\tVersion: %i (%p)\n", id.version, id.version);

	char name[MAX_LEN];
	TRY(ioctl(input_device, EVIOCGNAME(MAX_LEN), name) < 0, "Unable to read name\n");
	printf("Name: %s\n", name);

	char phys[MAX_LEN];
	TRY(ioctl(input_device, EVIOCGPHYS(MAX_LEN), phys) < 0, "Unable to read phys\n");
	printf("Phys: %s\n", phys);

	char uniq[MAX_LEN];
	TRY(ioctl(input_device, EVIOCGUNIQ(MAX_LEN), uniq) < 0, "Unable to read uniq\n");
	printf("Uniq: %s\n", uniq);

	// EV_MAX is bitshift of maximal event. EV_CNT is equal to EV_MAX + 1.
	unsigned long long bit[EV_MAX/sizeof(unsigned long long) + 1];
	TRY(ioctl(input_device, EVIOCGBIT(0, sizeof(long long) + 1), &bit) < 0, "Unable to read bit\n");
	printf("Bit: \n");
	for (int i = 0; i < EV_MAX; i++) {
		if ((bit[i/64] >> (i%64)) & 1) {
			printf("\tEvent 0x%02X ", i);
			input_event_print_event_type(i);
			printf("\n");
		}
	}

	// KEY_MAX is bitshift of maximal key. KEY_CNT is equal to KEY_MAX + 1.
	unsigned long long key[KEY_MAX/sizeof(unsigned long long) + 1];
	TRY(ioctl(input_device, EVIOCGKEY(sizeof(key)), key) < 0, "Unable to read key\n");
	printf("Key: \n");
	for (int i = 0; i < KEY_MAX; i++) {
		if ((key[i/64] >> (i%64)) & 1) {
			printf("\tKey 0x%04X ", i);
			input_event_print_key_name(i);
			printf("\n");
		}
	}
#endif
}

struct input_event input_event_wait_for_key() {
	struct input_event event;
	event.type = EV_SYN;
	while ((event.type != EV_KEY) || ((event.value != 0) && (event.value != 1))) {
		read(input_device, &event, sizeof(struct input_event));
	}
	return event;
}

int input_event_wait_for_key_press() {
	struct input_event event;
	event.type = EV_SYN;
	while ((event.type != EV_KEY) || (event.value != 1)) {
		read(input_device, &event, sizeof(struct input_event));
	}
	return event.code;
}


int input_event_is_key_pressed(int i) {
	unsigned long long key[KEY_MAX/sizeof(unsigned long long) + 1];
	ioctl(input_device, EVIOCGKEY(sizeof(key)), key);
	return (key[i/64] >> (i%64)) & 1;
}
