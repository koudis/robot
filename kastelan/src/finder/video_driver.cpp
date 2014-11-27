#include <stdio.h>
#include <fcntl.h>
#include <errno.h>
#include <string.h>
#include <sys/mman.h>
#include <sys/ioctl.h>

#include "video_driver.h"
#include "our_time.h"

#ifdef ARCH_ARM
#include <linux/videodev.h>
#else
#include <libv4l1-videodev.h>
#endif

#define CAM_PALETTE VIDEO_PALETTE_UYVY
#define CAM_PIX_LEN 16
#define CAM_FILE "/dev/video0"

//camera handlers
int video = 0;
struct video_mbuf vmbuf;
char * vbuf = NULL;
int frame_id = 0;
struct video_mmap vmmap;

static int try_format(int fd, struct video_picture *pict, int palette, int depth) {
  int err;
  pict->palette = palette;
  pict->depth = depth;
  err = ioctl(fd,VIDIOCSPICT,pict);
  if (err < 0) {
    printf("Could not set picture properties: %s\n", strerror(errno));
    return 0;
  }
  return 1;
}

static int try_size(int fd, int width, int height) {
  struct video_window win;
  int err;
  memset(&win, 0, sizeof(win));
  /*set picture size */
  win.x = win.y = 0;
  win.width = width;
  win.height = height;
  win.flags = 0;
  win.clips = NULL;
  win.clipcount = 0;

  printf("Trying to set capture size to %ix%i\n", width, height);
  err=ioctl(fd, VIDIOCSWIN, &win);
  if (err < 0) {
    printf("Could not set window size: %s\n", strerror(errno));
    return 0;
  }

  err=ioctl(fd, VIDIOCGWIN, &win);
  if (err < 0) {
    printf("Could not get window size: %s\n", strerror(errno));
    return 0;
  }
  if (width!=win.width || height!=win.height) {
    printf("Capture size is not what we expected: asked for %ix%i and get %ix%i\n",
      width, height, win.width, win.height);
    return 0;
  }
  printf("Capture size set to %ix%i\n", width, height);
  return 1;
}

static int do_mmap(int fd, struct video_mbuf * pvmbuf, char ** pbuf) {
  int err;
  memset((void*) pvmbuf, 0, sizeof(*pvmbuf));
  /* try to get mmap properties */
  err = ioctl(fd, VIDIOCGMBUF, pvmbuf);
  if (err < 0) {
    printf("Could not get mmap properties: %s\n", strerror(errno));
    return -1;
  }

  *pbuf = (char*) mmap(NULL, pvmbuf->size, PROT_READ, MAP_PRIVATE, fd, 0);
  if (*pbuf == (void*)-1) {
    printf("Could not mmap: %s\n", strerror(errno));
    return -1;
  }

  return 0;
}

int video_init() {
  struct video_capability vidcap;
  struct video_picture pict;

  printf("Openning %s...\n", CAM_FILE);
  video = open(CAM_FILE, O_RDWR);
  if (video < 0) {
    printf("Cannot open %s\n", CAM_FILE);
    return -1;
  }

  if (ioctl(video, VIDIOCGCAP, &vidcap) != 0) {
    printf("Cannot get device capabilities: %s.\n",strerror(errno));
    return -1;
  }

  fprintf(stdout, "Found %s device. (maxsize=%ix%i)\n",vidcap.name, vidcap.maxwidth, vidcap.maxheight);

  /* get picture properties */
  if (ioctl(video, VIDIOCGPICT, &pict) < 0){
    printf("Could not get picture properties: %s\n",strerror(errno));
    return -1;
  }

  fprintf(stdout, "Default picture properties: brightness=%i,hue=%i,colour=%i,contrast=%i,depth=%i, palette=%i.\n",
    pict.brightness,pict.hue,pict.colour, pict.contrast,pict.depth, pict.palette);

  /* check whether this format is supported */
  if (!try_format(video, &pict, CAM_PALETTE, CAM_PIX_LEN)) {
    printf("Unsupported video pixel format.\n");
    return -1;
  }

  if (!try_size(video, CAM_WIDTH, CAM_HEIGHT))
    return -1;

  if (do_mmap(video, &vmbuf, &vbuf)) {
    printf("Cannot mmap\n");
  }

  /* start to grab */
  vmmap.height = CAM_HEIGHT;
  vmmap.width = CAM_WIDTH;
  vmmap.format = pict.palette;

  for (int j = 0; j < vmbuf.frames; j++) {
    vmmap.frame = j;
    ioctl(video, VIDIOCMCAPTURE, &vmmap);
  }
  return 0;
}

char *video_get_frame() {
  printf("video_driver: video_get_frame: time %u\n", time_remaining_ms());
  fflush(stdout);
  char *ptr = NULL;
  while (ioctl(video, VIDIOCSYNC, &frame_id) < 0 && (errno == EAGAIN || errno == EINTR));
    ptr = vbuf + vmbuf.offsets[frame_id];
  return ptr;
}

//void video_wait_for_next_frame() {
//  frame_cnt++;
//  now_ms = get_cur_ms() - start_ms;
//  offset_ms = frame_cnt * 1000 / frame_rate;
//  if (offset_ms > now_ms)
//    usleep((offset_ms - now_ms) * 1000);
//}

int video_start_capture() {
  printf("video_driver: video_start_capture: time %u\n", time_remaining_ms());
  fflush(stdout);
  /* setup to capture the next frame */
  vmmap.frame = frame_id;
  if (ioctl(video, VIDIOCMCAPTURE, &vmmap) < 0) {
    perror("VIDIOCMCAPTURE");
    return -1;
  }

  /* this is now the grabbing frame */
  frame_id = (frame_id + 1) % vmbuf.frames;
  return 0;
}
