#include "i2c_communication.h"
#include "variable_loader.h"

#include <sys/io.h>
#include <sys/ioctl.h>
#include <linux/i2c-dev.h>

#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int fAD;
int fGPIO;
int fTAOS;
int fSERVO;
int fENCODER;

inline int i2c_write(int file, void* buf, int size) {
  int r = write(file, buf, size);
  if (r != size) {
    fprintf(stderr, "Error writing to i2c, file %d\n", file);
    return -1;
  }
  return 0;
}

inline int i2c_read(int file, void* buf, int size) {
  int r = read(file, buf, size);
  if (r != size) {
    fprintf(stderr, "Error reading from i2c, file %d\n", file);
    return -1;
  }
  return 0;
}

inline int i2c_open(const char* busname, int address) {
  int f = open(busname, O_RDWR);

  if (f < 0)  {
    fprintf(stderr, "Error opening i2c bus for device %x\n", address);
    return -1;
  }
  if (ioctl(f, I2C_SLAVE_FORCE, address) < 0) {
    fprintf(stderr, "Error setting up ioctl() for device %x\n", address);
    return -1;
  }

  return f;
}

int i2c_init() {
//  fAD = i2c_open("/dev/i2c-0", ADDRESS_AD);
  if (i2c_init_gpio() == -1)
    return -1;
  if (i2c_init_taos() == -1)
    return -1;
  if (i2c_init_servo() == -1)
    return -1;
  return 0;
}

int i2c_init_gpio() {
  fGPIO = i2c_open("/dev/i2c-1", ADDRESS_GPIO);
  printf("i2c: gpio:file %d\n", fGPIO);

  if (fGPIO != -1) {
    set_gpio_config();
    return 0;
  } else {
    return -1;
  }
}

int i2c_init_ad() {
  fAD = i2c_open("/dev/i2c-1", ADDRESS_AD);
  printf("i2c: ad:file %d\n", fAD);
  return fAD == -1;
}

int i2c_init_taos() {
  fTAOS = i2c_open("/dev/i2c-1", ADDRESS_TAOS);
  printf("i2c: taos:file %d\n", fTAOS);
  if (fTAOS == -1)
    return -1;

  i2c_taos_config();
  return 0;
}

int i2c_init_servo() {
  fSERVO = i2c_open("/dev/i2c-1", ADDRESS_SERVO);
  printf("i2c: servo:file %d\n", fSERVO);
  if (fSERVO == -1)
    return -1;

  i2c_servo_set_servo(SERVO_LEFT, servo_left_close);
  i2c_servo_set_servo(SERVO_RIGHT, servo_right_close);
  u08 buf[2];
  buf[0] = 0x00, buf[1] = SERVO_AS_SR_DEF;
  i2c_write(fSERVO, buf, 2);
  return 0;
}

int i2c_close() {
  u08 buf[2];

  buf[0] = 0x00, buf[1] = 0x00;
  i2c_write(fSERVO, buf, 2);

  buf[0] = 0x00, buf[1] = 0x00;
  i2c_write(fTAOS, buf, 2);

  return close(fGPIO) && close(fTAOS) && close(fSERVO);
}

int i2c_taos_set_servo(u08 servo, u08 value) {
  u08 buf[2];
  buf[0] = servo, buf[1] = value;
  i2c_write(fTAOS, buf, 2);
}

int i2c_servo_set_servo(u08 servo, u08 value) {
  u08 buf[2];
  buf[0] = servo, buf[1] = value;
  i2c_write(fSERVO, buf, 2);
}

int i2c_taos_config() {
  i2c_taos_config_white();
  i2c_taos_config_servo();
  return 0;
}

int i2c_taos_config_servo() {
  i2c_taos_set_servo(TAOS_FLIPPER, taos_flipper_center);

  u08 buf[2];
  buf[0] = PSSR, buf[1] = PSSR_DEF;
  i2c_write(fTAOS, buf, 2);

  if (((ourside == 'L') && (ourcolor == 'R')) || ((ourside != 'L') && (ourcolor != 'R'))) {
    buf[0] = PSFPR, buf[1] = taos_flipper_left;
    i2c_write(fTAOS, buf, 2);
    buf[0] = PSFPB, buf[1] = taos_flipper_right;
    i2c_write(fTAOS, buf, 2);
  }
  else {
    buf[0] = PSFPB, buf[1] = taos_flipper_left;
    i2c_write(fTAOS, buf, 2);
    buf[0] = PSFPR, buf[1] = taos_flipper_right;
    i2c_write(fTAOS, buf, 2);
  }
  buf[0] = PSFPC, buf[1] = taos_flipper_center;
  i2c_write(fTAOS, buf, 2);
  return 0;
}

int i2c_taos_config_white() {
  u08 buf[2];
  buf[0] = 0x00,  buf[1] = PSSR_DEF;              i2c_write(fTAOS, buf, 2);
  buf[0] = PSCWL, buf[1] = taos_white_w & 0xFF;   i2c_write(fTAOS, buf, 2);
  buf[0] = PSCWH, buf[1] = taos_white_w >> 8;     i2c_write(fTAOS, buf, 2);
  buf[0] = PSCRL, buf[1] = taos_white_r & 0xFF;   i2c_write(fTAOS, buf, 2);
  buf[0] = PSCRH, buf[1] = taos_white_r >> 8;     i2c_write(fTAOS, buf, 2);
  buf[0] = PSCBL, buf[1] = taos_white_b & 0xFF;   i2c_write(fTAOS, buf, 2);
  buf[0] = PSCBH, buf[1] = taos_white_b >> 8;     i2c_write(fTAOS, buf, 2);
  buf[0] = PSSR,  buf[1] = 1<<PSSW;               i2c_write(fTAOS, buf, 2);
  buf[0] = PSCWL, buf[1] = taos_white_thr & 0xFF; i2c_write(fTAOS, buf, 2);
  buf[0] = PSCWH, buf[1] = taos_white_thr >> 8;   i2c_write(fTAOS, buf, 2);
  buf[0] = PSSR,  buf[1] = 1<<PSST;               i2c_write(fTAOS, buf, 2);
}

int get_ad_register(u08 chreg, u16* value) {
  u08 buf[2];
  buf[0] = (chreg << 4) | 0x80 ;

  if (i2c_write(fAD, buf, 1) < 0 || i2c_read(fAD, buf, 2) < 0) {
    return 1;
  }

  *value =  ((buf[0] & 0x0f ) << 8) | buf[1];
  return 0;
}

// Vstupy B jsou ovladany kernelem, nehrabat na ne
int set_gpio_pullup(u08 ioa) {
  u08 buf[] = {0x0c, ioa};
  return i2c_write(fGPIO, buf, 2) < 0;
}

int set_gpio_config() {
  set_gpio_pullup(0xff);
  return 0;
}

int get_gpio_aports(u08* value) {
  u08 buf[] = {0x12};
  return i2c_write(fGPIO, buf, 1) < 0 || i2c_read(fGPIO, value, 1) < 0;
}

void i2c_taos_get_color() {
  u08 buf[2];
  buf[0] = PSSR, buf[1] = PSSR_DEF | PSSR_GC;
  i2c_write(fTAOS, buf, 2);
}

char i2c_taos_fetch_color(u16* r, u16* g, u16* b, u16* w) {
  u08 buf[8];
  u16 *buff = (u16*) buf;

  buf[0] = PSCRL;
  i2c_write(fTAOS, buf, 1);
  i2c_read(fTAOS, buf, 8);

  *r = buff[0];
  *w = buff[1];
  *b = buff[2];
  *g = buff[3];

  printf("TAOS (RGBW): %X %X %X %X", *r, *g, *b, *w);
  // Následující kód je téměř duplicitní s atmega_sort_taos/main.c
  if (*w < taos_white_thr) { // detekovali jsme puk
    int dw = taos_white_w - *w;
    int dr = taos_white_r - *r;
    int db = taos_white_b - *b;
    if ((dw/8) > (db - dr)) {
      printf("\tmodry puk\n");
      return 'B';
    }
    else {
      printf("\tcerveny puk\n");
      return 'R';
    }
  }
  else {
    printf("\tzadny puk\n");
    return 'N';
  }
}

bool i2c_start_cable_present() {
  u08 buf[] = {0x12}; //port A
  i2c_write(fGPIO, buf, 1);
  i2c_read(fGPIO, buf, 1);
  if (buf[0] & 0x40)
    return 1;
  else
    return 0;
}

void i2c_get_bumpers(u08* value) {
  u08 buf[] = {0x12}; //port A
  i2c_write(fGPIO, buf, 1);
  i2c_read(fGPIO, buf, 1);
  *value = (~buf[0]) & 0x3F;
}

void i2c_taos_sort_enable() {
  u08 buf[2];
  buf[0] = PSSR, buf[1] = PSSR_DEF | PSSR_SE;
  i2c_write(fTAOS, buf, 2);
}
void i2c_taos_sort_disable() {
  u08 buf[2];
  buf[0] = PSSR, buf[1] = PSSR_DEF;
  i2c_write(fTAOS, buf, 2);
  i2c_taos_set_servo(TAOS_FLIPPER, taos_flipper_center);
}

int i2c_init_encoder() {
  fENCODER = i2c_open("/dev/i2c-1", ADDRESS_ENCODER);
  printf("i2c: encoder:file %d\n", fENCODER);

  if (fENCODER != -1)
    return 0;
  else
    return -1;
}

int i2c_close_encoder() {
  return close(fENCODER);
}

u08 _crc_ibutton_update(u08 crc, u08 data) {
        u08 i;
        crc = crc ^ data;
        for (i = 0; i < 8; i++)
                if (crc & 0x01)
                        crc = (crc >> 1) ^ 0x8C;
                else
                        crc >>= 1;
        return crc;
}

void i2c_encoder_get(u08* buf) {
  u08 notok = 1;
  while (notok) {
    notok = 0;
    buf[0] = 0x80; // 32-bit without shift

    if (i2c_write(fENCODER, buf, 1) < 0 || i2c_read(fENCODER, buf, 9) < 0) {
      printf("ENCODER: READ/WRITE: ERROR\n");
      notok=1;
    }

    u08 crc = 0;
    for (int i=0; i<8; i++)
      crc = _crc_ibutton_update(crc, buf[i]);

    if (crc != buf[8]) {
      printf("ENCODER: CRC: ERROR\n");
      notok = 1;
    }
  }
}
