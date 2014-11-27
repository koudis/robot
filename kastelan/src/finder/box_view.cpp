#include <stdio.h>
#include <cxcore.h>
#include <cv.h>
#include <opencv/highgui.h>
#include "finder.h"

int main (int argc, char** argv) {
  IplImage* img = cvCreateImage(cvSize(IMG_WIDTH, IMG_HEIGHT), IPL_DEPTH_8U, 3);
  IplImage* pozadi = cvCreateImage(cvSize(IMG_WIDTH, IMG_HEIGHT), IPL_DEPTH_8U, 3);
  cvNamedWindow("boxes");
  cvZero(img);
//  FILE *fy=fopen("img_y","r");
//  FILE *fu=fopen("img_u","r");
//  FILE *fv=fopen("img_v","r");
  FILE *fr=fopen("raw_video_frame","r");
  for (int y = 0; y < IMG_HEIGHT; y++) {
    for (int x = 0; x < IMG_WIDTH; x++) {
//      img->imageData[(x + y*IMG_WIDTH)*3 + 0] = fgetc(fy);
//      img->imageData[(x + y*IMG_WIDTH)*3 + 1] = fgetc(fu);
//      img->imageData[(x + y*IMG_WIDTH)*3 + 2] = fgetc(fv);
      img->imageData[(x + y*IMG_WIDTH)*3 + 2] = fgetc(fr);
      img->imageData[(x + y*IMG_WIDTH)*3 + 0] = fgetc(fr);
      img->imageData[(x + y*IMG_WIDTH)*3 + 1] = fgetc(fr);fgetc(fr);
    }
    for (int x = 0; x < IMG_WIDTH; x++) {
      fgetc(fr), fgetc(fr), fgetc(fr), fgetc(fr);
    }
  }
  cvCvtColor(img, pozadi, CV_YCrCb2BGR);

  while (!feof(stdin)) {
    printf("Reading...\n");
    cvCopy(pozadi, img);

    int num=0;
    for(;;) {
      CvRect box;
      int col;
      scanf("BOX: x=%d y=%d w=%d h=%d c=%d\n", &box.x, &box.y, &box.width, &box.height, &col);
      if (col==3)
        break;

      CvScalar color = CV_RGB(0, 250, 0);
      if (col == 1)
        color = CV_RGB(250, 0, 0);
      if (col == 2)
        color = CV_RGB(0, 0, 250);

      cvRectangle(img, cvPoint(box.x, box.y), cvPoint(box.x+box.width, box.y+box.height), color);

      cvLine(img , cvPoint(box.x, box.y), cvPoint(box.x+box.width, box.y+box.height), color);
      cvLine(img, cvPoint(box.x+box.width, box.y), cvPoint(box.x, box.y+box.height), color);
      num++;
    }

    if (num)
      cvShowImage("boxes", img);
    cvWaitKey(20);
  }
  cvDestroyWindow("boxes");
  cvReleaseImage(&img);
  return 0;
}
