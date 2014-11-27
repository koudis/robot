/* Capture from a video4linux camera driver 
 *
 * <hackfin@section5.ch> explicitely adapted to the OV9655 camera chip
 * in UYVY mode
 *
 * */

#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <errno.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/mman.h>
#include <sys/ioctl.h>
#include <sys/time.h>
#include <termios.h>
#include <linux/videodev.h>

#include "bfin_simple_timer.h"
#include "jpeg.h"

// JPG output buffer
unsigned char jpeg_outbuf[0x100000];

#define DEVICE_FILE "/dev/video0"
#define WIDTH 1280
#define HEIGHT 1024
#define DEFAULT_FMT VIDEO_PALETTE_UYVY
#define DEFAULT_LEN 16
#define DEFAULT_RATE 30

//hdaps{
#define motor_left		0x80
#define motor_right		0x00

#define motor_both_stop()	uart1SendChar(0x00)
#define motor_speed(m, s)	uart1SendChar((m) | ((s) + 0x40))

FILE *MOTOR_fil;

int encoder_l=0;
int encoder_r=0;

void uart1SendChar(unsigned char s){
  fputc(s, MOTOR_fil);
  fflush(MOTOR_fil);
}

void motor_init() {
  MOTOR_fil = fopen ("/dev/ttyBF1","w");
  uart1SendChar(0x00);
}


//hdaps}

struct encoder_context {
    unsigned short width;
    unsigned short height;
    unsigned short pxsize;
    unsigned short size;
} g_context;

/* Video processing */
int encoder_init(unsigned short w, unsigned short h, unsigned short pixsize);
int encoder_exit(void);
int encode(unsigned char *data);

/* console i/o */
long get_cur_ms();
int kbhit();
void nonblock(int);

static int try_format(int fd, struct video_picture *pict, int palette, int depth);
static int try_size(int fd, int width, int height);
static int do_mmap(int fd, struct video_mbuf * pvmbuf, char ** pbuf);

int frame_rate = DEFAULT_RATE;
char * outfile = NULL;
char pix_buf[(HEIGHT * WIDTH * 2)];

int main ()
{
    int err = -1;
    int done = 0;
    int j = 0;
    int video = 0;
    int tmr2, tmr3, tmr6, tmr7;
    int led0, led1, pwml, pwmr, laserl, laserr;
    char * vbuf = NULL, *ptr = NULL;
    int frame_size = 0;
    char ch;
    
    struct video_capability vidcap;
    struct video_mbuf vmbuf;
    struct video_mmap vmmap;
    struct video_picture pict;
    int frame_id = 0;
    int frame_cnt = 0;
    int error;
    long start_ms = 0, now_ms = 0, offset_ms = 0;
    
    led0 = open("/sys/class/gpio/gpio24/value", O_WRONLY);
    led1 = open("/sys/class/gpio/gpio25/value", O_WRONLY);
    pwml = open("/dev/gpio36", O_WRONLY);
    pwmr = open("/dev/gpio37", O_WRONLY);
    laserl = open("/dev/gpio39", O_WRONLY);
    laserr = open("/dev/gpio41", O_WRONLY);
    write(led0, "O0", 2);
    write(led1, "O0", 2);

	tmr2 = open("/dev/timer2", O_RDWR);
	if (!tmr2)
		puts("unable to open timer2!!");
    ioctl(tmr2, BFIN_SIMPLE_TIMER_SET_PERIOD, 1000);  // set period to 1000usec = 1kHz
    ioctl(tmr2, BFIN_SIMPLE_TIMER_SET_WIDTH, 500);  // set width to 500usec = 50% duty cycle
	ioctl(tmr2, BFIN_SIMPLE_TIMER_START, 0);
    write(pwml, "O1", 2);
    
 	tmr3 = open("/dev/timer3", O_RDWR);
	if (!tmr3)
		puts("unable to open timer3!!");
    ioctl(tmr3, BFIN_SIMPLE_TIMER_SET_PERIOD, 1000);  // set period to 1000usec = 1kHz
    ioctl(tmr3, BFIN_SIMPLE_TIMER_SET_WIDTH, 700);  // set width to 200usec = 20% duty cycle
	ioctl(tmr3, BFIN_SIMPLE_TIMER_START, 0);
    write(pwmr, "O1", 2);
    
   printf("open %s\n", DEVICE_FILE);
    video = open(DEVICE_FILE, O_RDWR);
    if (video < 0) {
        printf("cannot open %s\n", DEVICE_FILE);
        return -1;
    }

    err=ioctl(video, VIDIOCGCAP, &vidcap);
    if (err!=0) {
        printf("cannot get device capabilities: %s.\n",strerror(errno));
        return -1;
    }

    //fprintf(stdout, "found %s device. (maxsize=%ix%i)\n",vidcap.name, vidcap.maxwidth, vidcap.maxheight);

    /* get picture properties */
    err=ioctl(video, VIDIOCGPICT, &pict);
    if (err<0){
        printf("could not get picture properties: %s\n",strerror(errno));
        return -1;
    }                write(led0, "O1", 2);

    //fprintf(stdout, "default picture properties: brightness=%i,hue=%i,colour=%i,contrast=%i,depth=%i, palette=%i.\n",
      //  pict.brightness,pict.hue,pict.colour, pict.contrast,pict.depth, pict.palette);

    /* check whether this format is supported */
    if (!try_format(video, &pict, DEFAULT_FMT, DEFAULT_LEN)) {
        printf("unsupported video pixel format.\n");
        return -1;
    }

    if (!try_size(video, WIDTH, HEIGHT))
        return -1;

    if (do_mmap(video, &vmbuf, &vbuf)) {
        printf("cannot mmap\n");
    }
    
    frame_size = vmbuf.size;
    //printf("Frame size: %d\n", frame_size);
    frame_id = 0;

    /* start to grab */
    vmmap.height = HEIGHT;
    vmmap.width = WIDTH;
    vmmap.format = pict.palette;
    
    for (j = 0; j < vmbuf.frames; j++) {
        vmmap.frame = j;
        ioctl(video, VIDIOCMCAPTURE, &vmmap);
    }

    /* capture */
    start_ms = get_cur_ms();
    encoder_init(WIDTH/4, HEIGHT/4, 2);
    nonblock(1);

  motor_init();
  FILE *input;
  struct termios orig_set;

  input = stdin;
//  orig_set = input_conf(input);
printf("start\n");
fflush(stdin);
  int MOTOR_SPEED_R = 38;
  int MOTOR_SPEED_L = 40;
  
  FILE* data = fopen("output_images_raw","w");
  FILE* data2 = fopen("output_images_raw2","w");
  
    for(;;) {
    int x, y;
    x=505;
    y=505;
//    scanf("%d %d", &x,&y);
    int dif2=(x-505)/6;
    int sum=(505-y)/3;
//    motor_speed(motor_left, sum+dif2);
//    motor_speed(motor_right, sum-dif2);
    if (x==666 && y==666)
      break;

                write(led0, "1", 1);
                write(led1, "0", 1);
                while (ioctl(video, VIDIOCSYNC, &frame_id) < 0 &&
                           (errno == EAGAIN || errno == EINTR));
                ptr = vbuf + vmbuf.offsets[frame_id];

                while (ioctl(video, VIDIOCSYNC, &frame_id) < 0 &&
                           (errno == EAGAIN || errno == EINTR));
                ptr = vbuf + vmbuf.offsets[frame_id];

                while (ioctl(video, VIDIOCSYNC, &frame_id) < 0 &&
                           (errno == EAGAIN || errno == EINTR));
                ptr = vbuf + vmbuf.offsets[frame_id];
//                printf("got frame: ms = %lu\n", get_cur_ms());

                int jy,jx;
                for (jy = 0; jy< HEIGHT; jy++)
                  for (jx = 0; jx< WIDTH; jx++){
                    fprintf(data,"%c",ptr[(jx+jy*WIDTH)*2]);
                    fprintf(data,"%c",ptr[(jx+jy*WIDTH)*2+1]);
                  }
                  
                int ix;
                for (ix=0; ix<WIDTH*HEIGHT*2; ix++)
                  fputc(ptr[ix],data2);

                fflush(data);
                fflush(data2);


                /* setup to capture the next frame */
                vmmap.frame = frame_id;
                if (ioctl(video, VIDIOCMCAPTURE, &vmmap) < 0) {
                    perror("VIDIOCMCAPTURE");
                        return -1;
                }
        
                /* this is now the grabbing frame */
                frame_id = (frame_id + 1) % vmbuf.frames;

        
                /* capture rate control */
                frame_cnt++;
                now_ms = get_cur_ms() - start_ms;
                offset_ms = frame_cnt * 1000 / frame_rate;
                if (offset_ms > now_ms)
                    usleep((offset_ms - now_ms) * 1000);
                write(led0, "0", 1);
                write(led1, "1", 1);

    };
  motor_both_stop();
  motor_both_stop();
    nonblock(0);
    encoder_exit();

    return 0;
}

static int try_format(int fd, struct video_picture *pict, int palette, int depth){
    int err;
    pict->palette=palette;
    pict->depth=depth;
    err=ioctl(fd,VIDIOCSPICT,pict);
    if (err<0){
        printf("could not set picture properties: %s\n",strerror(errno));
        return 0;
    }
    return 1;
}

static int try_size(int fd, int width, int height){
    struct video_window win;
    int err;
    memset(&win,0,sizeof(win));
    /*set picture size */
    win.x=win.y=0;
    win.width=width;
    win.height=height;
    win.flags=0;
    win.clips=NULL;
    win.clipcount=0;

    //printf("trying to set capture size to %ix%i\n", width,height);
    err=ioctl(fd,VIDIOCSWIN,&win);
    if (err<0){
        printf("could not set window size: %s\n",strerror(errno));
        return 0;
    }

    err=ioctl(fd, VIDIOCGWIN, &win);
    if (err<0){
        printf("could not get window size: %s\n",strerror(errno));
        return 0;
    }
    if (width!=win.width || height!=win.height){
        printf("capture size is not what we expected: asked for %ix%i and get %ix%i\n",
            width, height, win.width, win.height);
        return 0;
    }

    //printf("capture size set to %ix%i\n", width,height);
    return 1;
}

static int do_mmap(int fd, struct video_mbuf * pvmbuf, char ** pbuf){
    int err;

    memset((void*)pvmbuf,0,sizeof(*pvmbuf));
    /* try to get mmap properties */
    err=ioctl(fd,VIDIOCGMBUF,pvmbuf);
    if (err<0){
        printf("could not get mmap properties: %s\n",strerror(errno));
        return -1;
    }

    *pbuf =mmap(NULL,pvmbuf->size,PROT_READ,MAP_PRIVATE,fd,0);
    if (*pbuf == (void*)-1) {
        printf("could not mmap: %s\n",strerror(errno));
        return -1;
    }
    
    return 0;
}

void hexdump(unsigned char *buf, unsigned long n)
{
    int i = 0;
    int c = 0;
    static char str[8];

    while (i < n) {
        sprintf(str, "%02x ", buf[i]);
        printf("%s", str);
        c++;
        if (c == 16) { c = 0; printf("\r\n"); }
        i++;
    }
    if (c)
        printf("\r\n");
}

void encoder_dummy(unsigned char *buf)
{
    int x, y;
    int val;
    int line = g_context.width / 2;

    unsigned char *p;

    p = buf;
    for (y = 0; y < g_context.height; y++) {
        val = 0;
        for (x = 0; x < line; x++) {
            *p++ = (val + 127) & 0xff; // U
            *p++ = val; // Y
            *p++ = 127; // V
            *p++ = val; // U
            val++;
        }

    }
}


int encoder_init(unsigned short w, unsigned short h, unsigned short pixsize)
{
    g_context.width = w;
    g_context.height = h;
    g_context.size = w * h * pixsize;
    g_context.pxsize = pixsize;

    return 0;
}


int encode(unsigned char *data)
{
    int ix;
    unsigned char *out;
    unsigned long len;
    static char header[32];

    // encoder_dummy(data);

    //printf("Encoding image...\n");
    out = encode_image(data, jpeg_outbuf, 500, FOUR_TWO_TWO,
        g_context.width, g_context.height);

//    printf("done.\nlen=%i\n",out-jpeg_outbuf);

    len = (out - jpeg_outbuf);

    sprintf(header, "##IMJ5%c%c%c%c",
        len & 0xff,
        (len >> 8) & 0xff,
        (len >> 16) & 0xff,
        0);
//    printf("out\n");
    for (ix=0; ix<10; ix++)
        putchar(header[ix]);
    for (ix=0; ix<len; ix++)
        putchar(jpeg_outbuf[ix]);
//    printf("out end\n");
    return 0;
}

int encoder_exit(void)
{
    return 0;
}

long get_cur_ms()
{
    struct timeval tv;
    gettimeofday(&tv, NULL);
    return (tv.tv_sec * 1000 + tv.tv_usec / 1000);
}

int kbhit()
{
    struct timeval tv;
    fd_set fds;
    tv.tv_sec = 0;
    tv.tv_usec = 0;
    FD_ZERO(&fds);
    FD_SET(STDIN_FILENO, &fds); //STDIN_FILENO is 0
    select(STDIN_FILENO+1, &fds, NULL, NULL, &tv);
    return FD_ISSET(STDIN_FILENO, &fds);
}

void nonblock(int state)
{
    struct termios ittystate;
    struct termios ottystate;
 
    //get the terminal state
    tcgetattr(STDIN_FILENO, &ittystate);
    tcgetattr(STDOUT_FILENO, &ottystate);
 
    if (state==1)
    {
        //turn off canonical mode
        ittystate.c_lflag &= ~ICANON;
        //turn off output processing
        ottystate.c_oflag &= ~OPOST;
        //minimum of number input read.
        ittystate.c_cc[VMIN] = 1;
    }
    else if (state==0)
    {
        //turn on canonical mode
        ittystate.c_lflag |= ICANON;
        //turn off output processing
        ottystate.c_oflag |= OPOST;
    }
    //set the terminal attributes.
    tcsetattr(STDIN_FILENO, TCSANOW, &ittystate);
    tcsetattr(STDOUT_FILENO, TCSANOW, &ottystate);
}

