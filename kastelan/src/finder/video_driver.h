#ifndef VIDEO_DRIVER_H_
#define VIDEO_DRIVER_H_

#define CAM_WIDTH    1280
#define CAM_HEIGHT   1024

int video_init();
char *video_get_frame();
//void video_wait_for_next_frame();
int video_start_capture();

#endif
