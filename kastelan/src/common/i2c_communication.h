#ifndef I2C_COMMUNICATION_H_
#define I2C_COMMUNICATION_H_

#include "types.h"

#define ADDRESS_AD      0x22
#define ADDRESS_GPIO    0x27
#define ADDRESS_TAOS    0x71
#define ADDRESS_SERVO   0x73
#define ADDRESS_ENCODER 0x30

#include "taos.h"
#define PSSR_GC    (1<<PSGC)
#define PSSR_SE    (1<<PSSE)
#define PSSR_DEF   ((1<<PSFE) | (1<<PSLE))
#define TAOS_FLIPPER    PSFP


#define SERVO_AS_SR_DEF 0x08
#define SERVO_RIGHT     0x0F
#define SERVO_LEFT      0x10

// Blackfin - little endian
// AD7998 - big endian

int i2c_init();
int i2c_init_gpio();
int i2c_init_ad();
int i2c_init_taos();
int i2c_init_servo();
int i2c_close();
int i2c_taos_config();
int i2c_taos_config_servo();
int i2c_taos_config_white();
void i2c_taos_get_color();
char i2c_taos_fetch_color(u16* r, u16* g, u16* b, u16* w);
int i2c_taos_set_servo(u08 servo, u08 value);
int i2c_servo_set_servo(u08 servo, u08 value);
int get_ad_register(u08 chreg, u16* value);
int set_gpio_pullup(u08 ioa);
int set_gpio_config();
int get_gpio_aports(u08* value);
bool i2c_start_cable_present();
void i2c_get_bumpers(u08* value);
void i2c_taos_sort_enable();
void i2c_taos_sort_disable();

int i2c_init_encoder();
int i2c_close_encoder();

int i2c_init_encoder();
int i2c_close_encoder();
void i2c_encoder_get(u08* buf);

#endif
