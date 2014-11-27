#ifndef FINDER_H_
#define FINDER_H_

//#define SIZE_QUARTER
#define BLUR

#ifndef SIZE_QUARTER
#define SIZE_HALF
#endif

#ifdef SIZE_QUARTER
#define IMG_WIDTH     320
#define IMG_HEIGHT    256
#endif

#ifdef SIZE_HALF
#define IMG_WIDTH     640
#define IMG_HEIGHT    512
#endif

#define GRAB_DEBUG_SMALL_FOCUS    1
#define GRAB_DEBUG_RAW            2
#define GRAB_DEBUG_Y              4
#define GRAB_DEBUG_U              8
#define GRAB_DEBUG_V             16
#define GRAB_DEBUG_EDGES         32
#define GRAB_DEBUG_SMALL_RAW     64

int finder_init();
void finder_close();
void finder_set_command(int command);

#endif
