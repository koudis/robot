#include <unistd.h>
#include <stdio.h>
#include <sys/time.h>
#include "finder.h"
#include "our_time.h"
#include "variable_loader.h"

int main (int argc, char** argv) {
  timeend = 180;
  start_game_watchdog();
  if (finder_init() == -1)
    return -1;
  usleep(1000*1000*3);

  finder_set_command(GRAB_DEBUG_RAW);

  usleep(1000*1000*1);
  finder_close();
}
