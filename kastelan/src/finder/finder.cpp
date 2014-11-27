#include <stdio.h>
#include <unistd.h>
#include <cv.h>
#include "video_driver.h"
#include "finder.h"

//some macros
#define pix_2(i,x,y,c) i[x + (y)*IMG_WIDTH]
#define sum(a, b) (((a)-(b))*((a)-(b))*10)/((a)+(b)+1)
#define thr(a,t) ((a) > (t) ? 255 : 0)

bool finder_running;
pthread_t finder_loop_tid;
pthread_mutex_t finder_lock;
int finder_command;

IplImage* img_shade;
unsigned char* surveyor_img_Y;
unsigned char* surveyor_img_U;
unsigned char* surveyor_img_V;
unsigned char* surveyor_img_h;
char *ptr;

int * valY;
int * valU;
int * valV;

bool box_filter (CvRect box) {
  if (box.width > (IMG_WIDTH >> 7) && box.width < (IMG_WIDTH >> 3) && box.height > (IMG_HEIGHT >> 8) && box.height < (IMG_HEIGHT >> 3) && box.y > ((IMG_HEIGHT >> 2) + (IMG_HEIGHT >> 4)))
    return true;
  else
    return false;
}

#ifdef SIZE_HALF
int check_color(unsigned char * imgY, unsigned char * imgU, unsigned char * imgV, int xc, int yc) {
  int sumY = 0;
  int sumU = 0;
  int sumV = 0;
  for (int x = xc-1; x <= xc+1; x++)
    for (int y = yc-2; y <= yc+2; y++) {
      sumY += pix_2(imgY, x, y, 0);
      sumU += pix_2(imgU, x, y, 0);
      sumV += pix_2(imgV, x, y, 0);
  }
  if (sumY > 70*15)
    return 0;
  if (sumU > 140*15)
    return 1;
  else
    return 2;
}
#endif

#ifdef SIZE_QUARTER
int check_color(unsigned char * imgY, unsigned char * imgU, unsigned char * imgV, int xc, int yc) {
  int sumY = 0;
  int sumU = 0;
  int sumV = 0;
  for (int y = yc-1; y <= yc+1; y++) {
    sumY += pix_2(imgY, xc, y, 0);
    sumU += pix_2(imgU, xc, y, 0);
    sumV += pix_2(imgV, xc, y, 0);
  }
  if (sumY > 70*3)
    return 0;
  if (sumU > 140*3)
    return 1;
  else
    return 2;
}
#endif

#ifdef SIZE_HALF
void read_image_from(unsigned char * image_Y, unsigned char * image_U, unsigned char * image_V, unsigned char *ptr = NULL) {
  int point = 0;
  for (int y = 0; y < IMG_HEIGHT; y++) {
    for (int x = 0; x < IMG_WIDTH; x++) {
      valV[x]  = ptr[point++];
      valY[x]  = ptr[point++];
      valU[x]  = ptr[point++];
      valY[x] += ptr[point++];
    }
    for (int x = 0; x < IMG_WIDTH; x++) {
      valV[x] += ptr[point++];
      valY[x] += ptr[point++];
      valU[x] += ptr[point++];
      valY[x] += ptr[point++];
      image_Y[x + y*IMG_WIDTH] = valY[x] >> 2;
      image_U[x + y*IMG_WIDTH] = valU[x] >> 1;
      image_V[x + y*IMG_WIDTH] = valV[x] >> 1;
    }
  }
}
#endif

#ifdef SIZE_QUARTER
void read_image_from(unsigned char * image_Y, unsigned char * image_U, unsigned char * image_V, unsigned char *ptr = NULL) {
  int point = 0;
  for (int y = 0; y < IMG_HEIGHT; y++) {
    for (int x = 0; x < IMG_WIDTH; x++) {
      valV[x]  = ptr[point++];//U = Cb
      valY[x]  = ptr[point++];//Y
      valU[x]  = ptr[point++];//V = Cr
      valY[x] += ptr[point++];//Y
      valV[x] += ptr[point++];
      valY[x] += ptr[point++];
      valU[x] += ptr[point++];
      valY[x] += ptr[point++];
    }
    for (int x = 0; x < IMG_WIDTH; x++) {
      valV[x] += ptr[point++];//U = Cb
      valY[x] += ptr[point++];//Y
      valU[x] += ptr[point++];//V = Cr
      valY[x] += ptr[point++];//Y
      valV[x] += ptr[point++];
      valY[x] += ptr[point++];
      valU[x] += ptr[point++];
      valY[x] += ptr[point++];
    }
    for (int x = 0; x < IMG_WIDTH; x++) {
      valV[x] += ptr[point++];//U = Cb
      valY[x] += ptr[point++];//Y
      valU[x] += ptr[point++];//V = Cr
      valY[x] += ptr[point++];//Y
      valV[x] += ptr[point++];
      valY[x] += ptr[point++];
      valU[x] += ptr[point++];
      valY[x] += ptr[point++];
    }
    for (int x = 0; x < IMG_WIDTH; x++) {
      valV[x] += ptr[point++];//U = Cb
      valY[x] += ptr[point++];//Y
      valU[x] += ptr[point++];//V = Cr
      valY[x] += ptr[point++];//Y
      valV[x] += ptr[point++];
      valY[x] += ptr[point++];
      valU[x] += ptr[point++];
      valY[x] += ptr[point++];
      image_Y[x + y*IMG_WIDTH] = valY[x] >> 4;
      image_U[x + y*IMG_WIDTH] = valU[x] >> 3;
      image_V[x + y*IMG_WIDTH] = valV[x] >> 3;
    }
  }
}
#endif

void send_image(unsigned char * image, int width = IMG_WIDTH, int height = IMG_HEIGHT, int x1 = 0, int y1 = 0, int x2 = IMG_WIDTH, int y2 = IMG_HEIGHT) {
  printf("IMAGE:\n");
  for (int y = y1; y < y2; y++)
    for (int x = x1; x < x2; x++)
      putchar(image[x + y*width]);
  printf("\n...DONE\n");
}

void send_image_raw(unsigned char * surveyor_img_Y, unsigned char * surveyor_img_U, unsigned char * surveyor_img_V) {
  printf("IMAGE:\n");
  for (int y = 0; y < IMG_HEIGHT; y++) {
    for (int x = 0; x < IMG_WIDTH; x+=2) {
      putchar(surveyor_img_V[x  + y*IMG_WIDTH]);
      putchar(surveyor_img_Y[x  + y*IMG_WIDTH]);
      putchar(surveyor_img_U[x  + y*IMG_WIDTH]);
      putchar(surveyor_img_Y[x+1+ y*IMG_WIDTH]);
    }
  }
  printf("\n...DONE\n");
}

void detect_pucks(int tmp_command) {
    printf("Reading...\n");
    ptr = video_get_frame();
    printf("Resizing...\n");
    read_image_from(surveyor_img_Y, surveyor_img_U, surveyor_img_V, (unsigned char*)ptr);
    if (tmp_command & GRAB_DEBUG_SMALL_FOCUS)
      send_image((unsigned char *) ptr, CAM_WIDTH*2, CAM_HEIGHT, 1180, 462, 1380, 562); // 100x100 pix
    if (tmp_command & GRAB_DEBUG_RAW)
      send_image((unsigned char *) ptr, CAM_WIDTH*2, CAM_HEIGHT, 0, 0, 1280*2, 1024); // full size
    if (tmp_command & GRAB_DEBUG_Y)
      send_image(surveyor_img_Y);
    if (tmp_command & GRAB_DEBUG_U)
      send_image(surveyor_img_U);
    if (tmp_command & GRAB_DEBUG_V)
      send_image(surveyor_img_V);

#ifdef BLUR
    printf("Bluring...\n");
    for (int y = 1; y < IMG_HEIGHT - 1; y++) {
      for (int x = 1; x < IMG_WIDTH - 1; x++) {
        pix_2(surveyor_img_h, x, y, 1) = (pix_2(surveyor_img_Y, x-1, y-1, 1) + pix_2(surveyor_img_Y, x-1, y, 1) + pix_2(surveyor_img_Y, x-1, y+1, 1) + pix_2(surveyor_img_Y, x, y-1, 1) + pix_2(surveyor_img_Y, x, y, 1) + pix_2(surveyor_img_Y, x, y+1, 1) + pix_2(surveyor_img_Y, x+1, y-1, 1) + pix_2(surveyor_img_Y, x+1, y, 1) + pix_2(surveyor_img_Y, x+1, y+1, 1))/9;
      }
    }
#endif

    printf("Calculating edges...\n");
    for (int y = 0; y < IMG_HEIGHT - 1; y++) {
      for (int x = 0; x < IMG_WIDTH - 1; x++) {
#ifdef BLUR
        pix_2(surveyor_img_h, x, y, 1) = sum(pix_2(surveyor_img_h, x, y, 1), pix_2(surveyor_img_h, x+1, y, 1)) + sum(pix_2(surveyor_img_h, x, y, 1), pix_2(surveyor_img_h, x, y+1, 1));
#else
        pix_2(surveyor_img_h, x, y, 1) = sum(pix_2(surveyor_img_Y, x, y, 1), pix_2(surveyor_img_Y, x+1, y, 1)) + sum(pix_2(surveyor_img_Y, x, y, 1), pix_2(surveyor_img_Y, x, y+1, 1));
#endif
      }
    }

    if (tmp_command & GRAB_DEBUG_EDGES)
      send_image(surveyor_img_h);
    if (tmp_command & GRAB_DEBUG_SMALL_RAW)
      send_image_raw(surveyor_img_Y, surveyor_img_U, surveyor_img_V);

    for (int i=15; i<=90;i+=10) {
      printf("Thresholding %i...\n", i);
      for (int y = 0; y < IMG_HEIGHT - 1; y++) {
        for (int x = 0; x < IMG_WIDTH - 1; x++) {
          pix_2(img_shade->imageData, x, y, 1) = thr(pix_2(surveyor_img_h, x, y, 1),i);
        }
      }

      CvMemStorage* storage = cvCreateMemStorage();
      CvSeq* first_contour = NULL;

      printf("Finding contours...\n");
      int Nc = cvFindContours(img_shade, storage, &first_contour, sizeof(CvContour), CV_RETR_LIST);

      printf( "Total Contours Detected: %d\n", Nc );

      int num=0;
      for( CvSeq* c=first_contour; c!=NULL; c=c->h_next ){
        CvRect box = cvBoundingRect(c);
        int col;
        if (box_filter(box) && (col = check_color(surveyor_img_Y, surveyor_img_U, surveyor_img_V, box.x + (box.width >> 1), box.y + (box.height >> 1))) != 0) {
          printf("BOX: x=%i y=%i w=%i h=%i c=%i\n", box.x, box.y, box.width, box.height, col);
          num++;
        }
      }
      printf( "Total Contours: %d\n", num );
      cvReleaseMemStorage(&storage);
    }
    video_start_capture();
    video_get_frame();
    video_start_capture();
    usleep(1000*34);
}

void finder_set_command(int command) {
  pthread_mutex_lock(&finder_lock);
  finder_command = command;
  pthread_mutex_unlock(&finder_lock);
}

void *finder_loop(void *arg) {
  while (finder_running) {
    int tmp_command;
    pthread_mutex_lock(&finder_lock);
    tmp_command = finder_command;
    finder_command = 0;
    pthread_mutex_unlock(&finder_lock);

    detect_pucks(tmp_command);
  }
  pthread_exit(NULL);
}

int finder_init() {
  img_shade = cvCreateImage(cvSize(IMG_WIDTH, IMG_HEIGHT), IPL_DEPTH_8U, 1);

  surveyor_img_Y = new unsigned char [IMG_WIDTH*IMG_HEIGHT];
  surveyor_img_U = new unsigned char [IMG_WIDTH*IMG_HEIGHT];
  surveyor_img_V = new unsigned char [IMG_WIDTH*IMG_HEIGHT];
  surveyor_img_h = new unsigned char [IMG_WIDTH*IMG_HEIGHT];

  valY = new int [IMG_WIDTH];
  valU = new int [IMG_WIDTH];
  valV = new int [IMG_WIDTH];

  if (video_init() == -1)
    return -1;

  finder_running = 1;
  finder_command = 0;
  pthread_mutex_init(&finder_lock, NULL);
  pthread_attr_t *thAttr = NULL;
  pthread_create(&finder_loop_tid, thAttr, finder_loop, NULL);
  return 0;
}

void finder_close() {
  finder_running = 0;
  void *finder_loop_return;
  pthread_join(finder_loop_tid, &finder_loop_return);

  delete [] surveyor_img_Y;
  delete [] surveyor_img_U;
  delete [] surveyor_img_V;
  delete [] surveyor_img_h;
  cvReleaseImage(&img_shade);
}
