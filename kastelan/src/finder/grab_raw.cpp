#include <unistd.h>
#include "finder.h"

int main (int argc, char** argv) {
  if (finder_init() == -1)
    return -1;
  usleep(1000*1000*4);

  finder_set_command(GRAB_DEBUG_RAW);

  usleep(1000*1000*3);
  finder_close();
}
