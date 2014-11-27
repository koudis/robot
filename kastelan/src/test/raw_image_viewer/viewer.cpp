#include <stdio.h>
#include <opencv/highgui.h>
#include <opencv/cxcore.h>
#include <opencv/cv.h>

#ifdef OSTRENI
#define WIDTH  100
#define HEIGHT 100
#else
#define WIDTH  1280
#define HEIGHT 1024
#endif

//#define USE_SECOND

void read_image_from(IplImage* img_input, FILE * input_file = 0, int swap = 1) {
  for (int y = 0; y < img_input->height; y++) {
    for (int x = 0; x < img_input->width && !feof(input_file); x+=2) {
      int a = fgetc(input_file);//U = Cb
      int b = fgetc(input_file);//Y
      int c = fgetc(input_file);//V = Cr
      int d = fgetc(input_file);//Y

//You will not belive it, but it is better to set swap to 1
      if (swap==1) {
        int e = a;
        a = c;
        c = e;
      }

      img_input->imageData[(x+0 + y*img_input->width)*3 + 0] = b;//Y1
      img_input->imageData[(x+0 + y*img_input->width)*3 + 1] = a;//U1
      img_input->imageData[(x+0 + y*img_input->width)*3 + 2] = c;//V1
      img_input->imageData[(x+1 + y*img_input->width)*3 + 0] = d;//Y2
      img_input->imageData[(x+1 + y*img_input->width)*3 + 1] = a;//U2
      img_input->imageData[(x+1 + y*img_input->width)*3 + 2] = c;//V2
    }
  }
}

void swap_rg(IplImage* img_input) {//or swap UV
  for (int y = 0; y < img_input->height; y++) {
    for (int x = 0; x < img_input->width; x++) {
      int a = img_input->imageData[(x + y*img_input->width)*3 + 2];
      img_input->imageData[(x + y*img_input->width)*3 + 2] = img_input->imageData[(x + y*img_input->width)*3 + 1];
      img_input->imageData[(x + y*img_input->width)*3 + 1] = a;
    }
  }
}

void YUV_to_BGR(IplImage* img_input, IplImage* img_output) {
  for (int y = 0; y < img_input->height; y++) {
    for (int x = 0; x < img_input->width; x++) {
      int l = img_input->imageData[(x + y*img_input->width)*3 + 0];
      int u = img_input->imageData[(x + y*img_input->width)*3 + 1];
      int v = img_input->imageData[(x + y*img_input->width)*3 + 2];
      img_output->imageData[(x + y*img_input->width)*3 + 0] = 1.164*(l-16)                 + 2.018*(u-128);//B
      img_output->imageData[(x + y*img_input->width)*3 + 1] = 1.164*(l-16) - 0.813*(v-128) - 0.391*(u-128);//G
      img_output->imageData[(x + y*img_input->width)*3 + 2] = 1.164*(l-16) + 1.596*(v-128);//R
//      printf("ok\n");
//      fflush(0);
    }
  }
}

int main (int argc, char** argv) {
  IplImage* img_input = cvCreateImage(cvSize(WIDTH, HEIGHT), IPL_DEPTH_8U, 3);
  IplImage* img_output = cvCreateImage(cvSize(WIDTH, HEIGHT), IPL_DEPTH_8U, 3);
#ifdef USE_SECOND
  IplImage* img_output2 = cvCreateImage(cvSize(WIDTH, HEIGHT), IPL_DEPTH_8U, 3);
#endif
  FILE * input_file = stdin;
//fgetc(input_file);
//fgetc(input_file);
//fgetc(input_file);
//fgetc(input_file);
  cvNamedWindow("image");
#ifdef USE_SECOND
  cvNamedWindow("image2");
#endif
  while (!feof(input_file)) {
    cvZero(img_input);

    read_image_from(img_input, input_file, 1);
    cvCvtColor(img_input, img_output, CV_YCrCb2BGR);
#ifdef USE_SECOND
    swap_rg(img_input);
    cvCvtColor(img_input, img_output2, CV_YCrCb2RGB);
#endif

    cvShowImage("image", img_output);
#ifdef USE_SECOND
    cvShowImage("image2", img_output2);
#endif
    cvWaitKey(0);
  }
  cvDestroyWindow("image");
#ifdef USE_SECOND
  cvDestroyWindow("image2");
#endif
  cvReleaseImage(&img_input);
  cvReleaseImage(&img_output);
#ifdef USE_SECOND
  cvReleaseImage(&img_output2);
#endif
  return 0;
}
