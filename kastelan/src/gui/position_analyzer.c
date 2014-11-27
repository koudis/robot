/* compile with:
 * gcc $(pkg-config cairo-xlib-xrender --cflags --libs) cairo-example.c
 */

#include <cairo-xlib.h>
#include <X11/Xlib.h>
#include <stdio.h>
#include <math.h>
#include <pthread.h>
#include <unistd.h>

#define PI  3.14159265
#define WIN_SIZE_X 800
#define WIN_SIZE_Y 800
#define START_X    600
#define START_Y    450

#define HISTORY_SIZE 5000

static cairo_surface_t *surface;
static cairo_surface_t *surfaceimg;
static cairo_t *cairowin;
static cairo_t *cairo;
static Display *dpy;

static cairo_surface_t *final_image_surface;
static cairo_t *final_image_cairo;

int trans_x(int x) {
  return (x + 350)/4;
}
int trans_y(int y) {
  return WIN_SIZE_Y - (y + 350)/4;
}

char our_color = 'R';
int command_x = 0;
int command_y = 0;
int command_rev = 0;
int command_brake = 1;
int command_distance = 0;

int history_x[HISTORY_SIZE];
int history_y[HISTORY_SIZE];
int history_a[HISTORY_SIZE];
int history_bumpers[HISTORY_SIZE];
int history_akt=0;

pthread_t scanf_loop_tid;
pthread_mutex_t scanf_lock;
pthread_t redraw_loop_tid;


void paint(int write_file_num) {
#ifdef WINDOW
 pthread_mutex_lock(&scanf_lock);
#endif
  cairo_set_source_rgba(cairo, 0, 0, 0, 1);
  cairo_rectangle(cairo, 0, 0, WIN_SIZE_X, WIN_SIZE_Y);
  cairo_fill(cairo);

  cairo_set_line_width(cairo, 1);
  cairo_set_source_rgba(cairo, 0.4, 0.4, 0.4, 1);
  cairo_rectangle(cairo, trans_x(0), trans_y(2500), 2500/4, 2500/4);
  cairo_stroke(cairo);

  if (our_color=='R')
    cairo_set_source_rgba(cairo, 1, 0, 0, 1);
  else
    cairo_set_source_rgba(cairo, 0, 0, 1, 1);
  cairo_rectangle(cairo, trans_x(0), trans_y(700), 700/4, 700/4);
  cairo_stroke(cairo);

  if (our_color=='R')
    cairo_set_source_rgba(cairo, 0, 0, 1, 1);
  else
    cairo_set_source_rgba(cairo, 1, 0, 0, 1);
  cairo_rectangle(cairo, trans_x(1800), trans_y(2500), 700/4, 700/4);
  cairo_stroke(cairo);

  int i = (history_akt+1)%HISTORY_SIZE;
  double j = 0;
  cairo_set_source_rgba(cairo, 1, 1, 0, j);
  cairo_move_to(cairo, trans_x(history_x[i]+START_X), trans_y(history_y[i]+START_Y));
  int mam_kreslit_x = history_x[i];
  int mam_kreslit_y = history_y[i];

  for (; i!=history_akt; i=(i+1)%HISTORY_SIZE) {
    j+=0.0002;
    cairo_set_source_rgba(cairo, 1, 1, 0, j);
    mam_kreslit_x -= history_x[i];
    mam_kreslit_x *= mam_kreslit_x;
    mam_kreslit_y -= history_y[i];
    mam_kreslit_y *= mam_kreslit_y;
    if ((mam_kreslit_x + mam_kreslit_y) < 160000) {
      cairo_line_to(cairo, trans_x(history_x[i]+START_X), trans_y(history_y[i]+START_Y));
      cairo_stroke(cairo);
    }
    // Let the bumpers disappear faster than yellow line
    double old_j = j;
    j -= 0.5;
    j *= 2;
    if (history_bumpers[i] & 1) {
      cairo_set_source_rgba(cairo, 1, 0, 0, j);
      cairo_move_to(cairo, trans_x(history_x[i]+START_X +90*cos(history_a[i]*PI/180.0)  +0*sin(history_a[i]*PI/180.0)), trans_y(history_y[i]+START_Y +90*sin(history_a[i]*PI/180.0)  -0*cos(history_a[i]*PI/180.0)));
      cairo_line_to(cairo, trans_x(history_x[i]+START_X +90*cos(history_a[i]*PI/180.0)+250*sin(history_a[i]*PI/180.0)), trans_y(history_y[i]+START_Y +90*sin(history_a[i]*PI/180.0)-250*cos(history_a[i]*PI/180.0)));
      cairo_stroke(cairo);
    }
    if (history_bumpers[i] & 2) {
      cairo_set_source_rgba(cairo, 1, 0, 0, j);
      cairo_move_to(cairo, trans_x(history_x[i]+START_X -70*cos(history_a[i]*PI/180.0)+210*sin(history_a[i]*PI/180.0)), trans_y(history_y[i]+START_Y -70*sin(history_a[i]*PI/180.0)-210*cos(history_a[i]*PI/180.0)));
      cairo_line_to(cairo, trans_x(history_x[i]+START_X-280*cos(history_a[i]*PI/180.0)+210*sin(history_a[i]*PI/180.0)), trans_y(history_y[i]+START_Y-280*sin(history_a[i]*PI/180.0)-210*cos(history_a[i]*PI/180.0)));
      cairo_stroke(cairo);
    }
    if (history_bumpers[i] & 4) {
      cairo_set_source_rgba(cairo, 1, 0, 0, j);
      cairo_move_to(cairo, trans_x(history_x[i]+START_X-290*cos(history_a[i]*PI/180.0)  +0*sin(history_a[i]*PI/180.0)), trans_y(history_y[i]+START_Y-290*sin(history_a[i]*PI/180.0)  -0*cos(history_a[i]*PI/180.0)));
      cairo_line_to(cairo, trans_x(history_x[i]+START_X-290*cos(history_a[i]*PI/180.0)+185*sin(history_a[i]*PI/180.0)), trans_y(history_y[i]+START_Y-290*sin(history_a[i]*PI/180.0)-185*cos(history_a[i]*PI/180.0)));
      cairo_stroke(cairo);
    }
    if (history_bumpers[i] & 8) {
      cairo_set_source_rgba(cairo, 1, 0, 0, j);
      cairo_move_to(cairo, trans_x(history_x[i]+START_X-290*cos(history_a[i]*PI/180.0)  +0*sin(history_a[i]*PI/180.0)), trans_y(history_y[i]+START_Y-290*sin(history_a[i]*PI/180.0)  -0*cos(history_a[i]*PI/180.0)));
      cairo_line_to(cairo, trans_x(history_x[i]+START_X-290*cos(history_a[i]*PI/180.0)-185*sin(history_a[i]*PI/180.0)), trans_y(history_y[i]+START_Y-290*sin(history_a[i]*PI/180.0)+185*cos(history_a[i]*PI/180.0)));
      cairo_stroke(cairo);
    }
    if (history_bumpers[i] & 16) {
      cairo_set_source_rgba(cairo, 1, 0, 0, j);
      cairo_move_to(cairo, trans_x(history_x[i]+START_X -70*cos(history_a[i]*PI/180.0)-210*sin(history_a[i]*PI/180.0)), trans_y(history_y[i]+START_Y -70*sin(history_a[i]*PI/180.0)+210*cos(history_a[i]*PI/180.0)));
      cairo_line_to(cairo, trans_x(history_x[i]+START_X-280*cos(history_a[i]*PI/180.0)-210*sin(history_a[i]*PI/180.0)), trans_y(history_y[i]+START_Y-280*sin(history_a[i]*PI/180.0)+210*cos(history_a[i]*PI/180.0)));
      cairo_stroke(cairo);
    }
    if (history_bumpers[i] & 32) {
      cairo_set_source_rgba(cairo, 1, 0, 0, j);
      cairo_move_to(cairo, trans_x(history_x[i]+START_X +90*cos(history_a[i]*PI/180.0)  +0*sin(history_a[i]*PI/180.0)), trans_y(history_y[i]+START_Y +90*sin(history_a[i]*PI/180.0)  -0*cos(history_a[i]*PI/180.0)));
      cairo_line_to(cairo, trans_x(history_x[i]+START_X +90*cos(history_a[i]*PI/180.0)-250*sin(history_a[i]*PI/180.0)), trans_y(history_y[i]+START_Y +90*sin(history_a[i]*PI/180.0)+250*cos(history_a[i]*PI/180.0)));
      cairo_stroke(cairo);
    }
    j = old_j;
    cairo_move_to(cairo, trans_x(history_x[i]+START_X), trans_y(history_y[i]+START_Y));
    mam_kreslit_x = history_x[i];
    mam_kreslit_y = history_y[i];
  }

  int x = history_x[(history_akt + HISTORY_SIZE - 1) % HISTORY_SIZE];
  int y = history_y[(history_akt + HISTORY_SIZE - 1) % HISTORY_SIZE];
  int a = history_a[(history_akt + HISTORY_SIZE - 1) % HISTORY_SIZE];

  cairo_set_source_rgba(cairo, 0, 1, 0, 1);
  cairo_move_to(cairo, trans_x(x+START_X-32*cos(a*PI/180.0)+32*sin(a*PI/180.0)), trans_y(y+START_Y-32*sin(a*PI/180.0)-32*cos(a*PI/180.0)));
  cairo_line_to(cairo, trans_x(x+START_X+32*cos(a*PI/180.0)-32*sin(a*PI/180.0)), trans_y(y+START_Y+32*sin(a*PI/180.0)+32*cos(a*PI/180.0)));
  cairo_move_to(cairo, trans_x(x+START_X-32*cos(a*PI/180.0)-32*sin(a*PI/180.0)), trans_y(y+START_Y-32*sin(a*PI/180.0)+32*cos(a*PI/180.0)));
  cairo_line_to(cairo, trans_x(x+START_X+32*cos(a*PI/180.0)+32*sin(a*PI/180.0)), trans_y(y+START_Y+32*sin(a*PI/180.0)-32*cos(a*PI/180.0)));

  cairo_move_to(cairo, trans_x(x+START_X +90*cos(a*PI/180.0)-250*sin(a*PI/180.0)), trans_y(y+START_Y +90*sin(a*PI/180.0)+250*cos(a*PI/180.0)));
  cairo_line_to(cairo, trans_x(x+START_X +90*cos(a*PI/180.0)+250*sin(a*PI/180.0)), trans_y(y+START_Y +90*sin(a*PI/180.0)-250*cos(a*PI/180.0)));
  cairo_move_to(cairo, trans_x(x+START_X +90*cos(a*PI/180.0)+210*sin(a*PI/180.0)), trans_y(y+START_Y +90*sin(a*PI/180.0)-210*cos(a*PI/180.0)));
  cairo_line_to(cairo, trans_x(x+START_X-290*cos(a*PI/180.0)+210*sin(a*PI/180.0)), trans_y(y+START_Y-290*sin(a*PI/180.0)-210*cos(a*PI/180.0)));
  cairo_line_to(cairo, trans_x(x+START_X-290*cos(a*PI/180.0)-210*sin(a*PI/180.0)), trans_y(y+START_Y-290*sin(a*PI/180.0)+210*cos(a*PI/180.0)));
  cairo_line_to(cairo, trans_x(x+START_X +90*cos(a*PI/180.0)-210*sin(a*PI/180.0)), trans_y(y+START_Y +90*sin(a*PI/180.0)+210*cos(a*PI/180.0)));

  cairo_stroke(cairo);

  // motor_command
  if (!command_brake) {
    if (command_rev)
      cairo_set_source_rgba(cairo, 0, 0, 1, 1);
    else
      cairo_set_source_rgba(cairo, 1, 1, 1, 1);
    x = command_x;
    y = command_y;
    cairo_move_to(cairo, trans_x(x+START_X-32), trans_y(y+START_Y-32));
    cairo_line_to(cairo, trans_x(x+START_X+32), trans_y(y+START_Y+32));
    cairo_move_to(cairo, trans_x(x+START_X-32), trans_y(y+START_Y+32));
    cairo_line_to(cairo, trans_x(x+START_X+32), trans_y(y+START_Y-32));

    cairo_stroke(cairo);
  }

#ifdef WINDOW
  cairo_set_source_surface(cairowin, surfaceimg, 0, 0);
#endif
  if (write_file_num + 1) {
    char filename [100];
    sprintf(filename, "image-%010i.png", write_file_num);
    cairo_surface_write_to_png(surfaceimg, filename);
  }
#ifdef WINDOW
  cairo_paint(cairowin);
 pthread_mutex_unlock(&scanf_lock);
#endif
}

#define ABS(X)  (((X)>0)?(X):(-(X)))

int old_el = 0, old_er = 0;
void *scanf_loop(void *arg) {
  int x = 0, y = 0, a = 0, b = 0;
  int el = 0, er = 0;
  int step = 0;
  char string[300];
  int tx=0,ty=0,ta=0;
  while(!feof(stdin)) {
    scanf("%[^\n]\n", string);
    if (string[0]=='b') {
      sscanf(string, "bumpers: %x", &b);
    }
    if (string[0]=='e') {
      char str[40];
      sscanf(string, "%s %d%s %d %s %s %d%s %d%s %d" , str,&el,str,&er,str,str, &tx,str, &ty,str, &ta);
      printf("speed %d %d\n", ABS(old_el-el), ABS(old_er-er));
      old_el=el;
      old_er=er;
//FIXME vedohrani HACK torus mode
      while (tx < -950)
        tx+=3200;
      while (tx > 2250)
        tx-=3200;
      while (ty < -800)
        ty+=3200;
      while (ty > 2400)
        ty-=3200;
//
#ifdef WINDOW
      pthread_mutex_lock(&scanf_lock);
#endif
       x=tx, y=ty, a=ta;
       history_x[history_akt]=x;
       history_y[history_akt]=y;
       history_a[history_akt]=a;
       history_bumpers[history_akt]=b;
       history_akt = (history_akt+1) % HISTORY_SIZE;
#ifdef WINDOW
      pthread_mutex_unlock(&scanf_lock);
      usleep(2000);// i tak dojde ke zdržení
#else
      paint(step);
      //paint(-1);
      step++;
#endif
      // final image
      int history_prev = (history_akt - 2 + HISTORY_SIZE) % HISTORY_SIZE;
      cairo_set_source_rgba(final_image_cairo, 1, 1, 1, 0.3);
      cairo_set_line_width(final_image_cairo, 0);
      cairo_move_to(final_image_cairo, trans_x(x+START_X +90*cos(a*PI/180.0)+185*sin(a*PI/180.0)), trans_y(y+START_Y +90*sin(a*PI/180.0)-185*cos(a*PI/180.0)));
      cairo_line_to(final_image_cairo, trans_x(x+START_X +90*cos(a*PI/180.0)-185*sin(a*PI/180.0)), trans_y(y+START_Y +90*sin(a*PI/180.0)+185*cos(a*PI/180.0)));
      x=history_x[history_prev];
      y=history_y[history_prev];
      a=history_a[history_prev];
      cairo_line_to(final_image_cairo, trans_x(x+START_X +90*cos(a*PI/180.0)-185*sin(a*PI/180.0)), trans_y(y+START_Y +90*sin(a*PI/180.0)+185*cos(a*PI/180.0)));
      cairo_line_to(final_image_cairo, trans_x(x+START_X +90*cos(a*PI/180.0)+185*sin(a*PI/180.0)), trans_y(y+START_Y +90*sin(a*PI/180.0)-185*cos(a*PI/180.0)));
      cairo_close_path(final_image_cairo);
      cairo_stroke_preserve(final_image_cairo);
      cairo_fill(final_image_cairo);


      // yellow line
      cairo_set_source_rgba(final_image_cairo, 1, 1, 0, 1);
      cairo_set_line_width(final_image_cairo, 1);
      cairo_move_to(final_image_cairo, trans_x(x+START_X), trans_y(y+START_Y));
      cairo_line_to(final_image_cairo, trans_x(tx+START_X), trans_y(ty+START_Y));
      cairo_stroke(final_image_cairo);
    }
    if (string[0]=='W') {
      char str[40];
      int tb;
      sscanf(string, "%s %s %s %s %s %d%s %d%s %d%s %s %x" , str,str,str,str,str, &tx,str, &ty,str, &ta, str, str, &tb);
      if (str[0] == 'b')
        b = tb;
//FIXME vedohrani HACK torus mode
      while (tx < -950)
        tx+=3200;
      while (tx > 2250)
        tx-=3200;
      while (ty < -800)
        ty+=3200;
      while (ty > 2400)
        ty-=3200;
//
      x=tx, y=ty, a=ta;
    }
    if ((string[0]=='m') && (string[6]=='c')) {// motor_command
      char str[40];
      double x, y;
      sscanf(string, "%s %lf %lf %d %d %d" , str,&x,&y,&command_rev, &command_brake, &command_distance);
      command_x = x;
      command_y = y;
    }
  }
  cairo_surface_write_to_png(final_image_surface, "image-final.png");
}

void *redraw_loop(void *arg) {
  Window w = * (Window *) arg;
  while(1) {
#ifdef WINDOW
    paint(-1);
#endif
    usleep(10000);
  }
}

int main(int argc, char **argv) {
  int i;
  for (i = 1; i<argc; i++) {
    if ((argv[i][0]=='-') && (argv[i][1]=='c'))
      if (argv[i][2])
        our_color = argv[i][2];
      else if (i+1 < argc)
        our_color = argv[i+1][0];
  }

#ifdef WINDOW
  if (!XInitThreads()) {
    fprintf(stderr, "Error: XInitThreads() returned non-zero status.\n");
    return 1;
  }

  dpy = XOpenDisplay(NULL);
  if (dpy == NULL) {
    fprintf(stderr, "Error: Can't open display. Is DISPLAY set?\n");
    return 1;
  }

  Window w;
  w = XCreateSimpleWindow(dpy, RootWindow(dpy, 0),
                          0, 0, WIN_SIZE_X, WIN_SIZE_Y, 0, 0, BlackPixel(dpy, 0));
  XSelectInput(dpy, w, StructureNotifyMask | ExposureMask);
  XMapWindow(dpy, w);
#endif

#ifdef WINDOW
  surface = cairo_xlib_surface_create(dpy, w, DefaultVisual(dpy, 0), WIN_SIZE_X, WIN_SIZE_Y);
#else
  surface = cairo_image_surface_create(CAIRO_FORMAT_ARGB32, WIN_SIZE_X, WIN_SIZE_Y);
#endif
  cairowin = cairo_create(surface);
  surfaceimg = cairo_image_surface_create(CAIRO_FORMAT_ARGB32, WIN_SIZE_X, WIN_SIZE_Y);
  cairo = cairo_create(surfaceimg);

  // Final image
  final_image_surface = cairo_image_surface_create(CAIRO_FORMAT_ARGB32, WIN_SIZE_X, WIN_SIZE_Y);
  final_image_cairo = cairo_create(final_image_surface);
  cairo_set_source_rgba(final_image_cairo, 0, 0, 0, 1);
  cairo_rectangle(final_image_cairo, 0, 0, WIN_SIZE_X, WIN_SIZE_Y);
  cairo_fill(final_image_cairo);

  cairo_set_line_width(final_image_cairo, 1);
  cairo_set_source_rgba(final_image_cairo, 0.4, 0.4, 0.4, 1);
  cairo_rectangle(final_image_cairo, trans_x(0), trans_y(2500), 2500/4, 2500/4);
  cairo_stroke(final_image_cairo);

  if (our_color=='R')
    cairo_set_source_rgba(final_image_cairo, 1, 0, 0, 1);
  else
    cairo_set_source_rgba(final_image_cairo, 0, 0, 1, 1);
  cairo_rectangle(final_image_cairo, trans_x(0), trans_y(700), 700/4, 700/4);
  cairo_stroke(final_image_cairo);

  if (our_color=='R')
    cairo_set_source_rgba(final_image_cairo, 0, 0, 1, 1);
  else
    cairo_set_source_rgba(final_image_cairo, 1, 0, 0, 1);
  cairo_rectangle(final_image_cairo, trans_x(1800), trans_y(2500), 700/4, 700/4);
  cairo_stroke(final_image_cairo);
  // end of final image

#ifdef WINDOW
  pthread_mutex_init(&scanf_lock, NULL);
  pthread_attr_t *thAttr = NULL;
  pthread_create(&scanf_loop_tid, thAttr, scanf_loop, NULL);
  thAttr = NULL;
  pthread_create(&redraw_loop_tid, thAttr, redraw_loop, &w);

  while (1) {
    XEvent e;
    XNextEvent(dpy, &e);
    //printf("Got event: %d\n", e.type);

    switch (e.type) {
      case MapNotify:
      case Expose:
      case ConfigureNotify:
      //default:
        paint(-1);
        break;
    }

  }
#else
  scanf_loop(NULL);
#endif

  return 0;
}

