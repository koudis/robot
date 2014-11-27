#include <stdio.h>
#include "video_driver.h"
#include "our_time.h"

char *buf;
FILE *input;

int video_init() {
  input = fopen("raw_video_frame", "r");
  buf = new char[CAM_WIDTH * CAM_HEIGHT * 2];
  for (int y = 0; y < CAM_HEIGHT; y++) {
    for (int x = 0; x < CAM_WIDTH&& !feof(stdin); x++) {
      buf[((y*CAM_WIDTH) + x ) *2 +0] = fgetc(input);
      buf[((y*CAM_WIDTH) + x ) *2 +1] = fgetc(input);
    }
  }
}

char *video_get_frame() {
  printf("video_driver: video_get_frame: time %u\n", time_remaining_ms());
  return buf;
}

int video_start_capture() {
  printf("video_driver: video_start_capture: time %u\n", time_remaining_ms());
  return 0;
}
