#include <stdio.h>

#include "i2c_communication.h"

int main(int argc, char** argv) {
  i2c_init();

  bool cable = i2c_start_cable_present();
  printf("%x\n", cable);

  i2c_close();

  if (cable != 0)
    return 0;
  else
    return 1;
}
