#include "i2c_communication.h"

#include <sys/io.h>
#include <sys/ioctl.h>
#include <linux/i2c-dev.h>

#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#include "i2c_communication.cpp"

#ifdef TEST_AD
int main(int argc, char** argv) {
  char chan;
  u16 val;

  if ((fAD = i2c_open("/dev/i2c-0", ADDRESS_AD)) == -1) {
    return 1;
  }

  if (argc == 1) {
    printf ("Reading all channels, rerun with number for single one.\n\n");
    get_ad_register(0, &val);
    printf ("Channel 0: %x\n", val);
    get_ad_register(1, &val);
    printf ("Channel 1: %x\n", val);
    get_ad_register(2, &val);
    printf ("Channel 2: %x\n", val);
    get_ad_register(3, &val);
    printf ("Channel 3: %x\n", val);
    get_ad_register(4, &val);
    printf ("Channel 4: %x\n", val);
    get_ad_register(5, &val);
    printf ("Channel 5: %x\n", val);
    get_ad_register(6, &val);
    printf ("Channel 6: %x\n", val);
    get_ad_register(7, &val);
    printf ("Channel 7: %x\n", val);
  } else if (argc == 2) {
    chan = atoi(argv[1]);
    get_ad_register(chan, &val);
    printf ("Channel %d: %x\n", chan, &val);
  } else {
    printf ("USAGE: i2c_ad [CHANNEL]\n");
    printf ("Read value from AD channel 0-7 or all of them with no parameter.\n");
  }

  return close(fAD);
}
#endif

#ifdef TEST_GPIO
int main(int argc, char** argv) {

  if ((fGPIO = i2c_open("/dev/i2c-0", ADDRESS_GPIO)) == -1 || set_gpio_config() == -1) {
    return 1;
  }

  int action = 0;

  while ((argc > 1) && (argv[1][0] == '-')) {
    switch (argv[1][1]) {
      case 'b':
        action |= 2;
        break;
      case 'h':
      default:
        action |= 1;
    }
    ++argv;
    --argc;
  }

  set_gpio_pullup(0xff, 0xff);

  if (((action & 1) == 1) || (argc > 1)) {
    printf ("USAGE: i2c_gpio [-h] [-b]\n");
  } else {
    u16 var;
    get_gpio_ports(&var);
    if ((action & 2) != 2) {
      printf("%04X\n", var);
    } else {
      for (int i = 0; i<16; i++) {
        printf("%i", (var & 0x8000) >> 15);
        if (i == 7)
          printf(" ");
        var = var << 1;
      }
      printf("\n");
    }
  }

  return close(fGPIO);
}
#endif
