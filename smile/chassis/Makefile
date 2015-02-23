
TARGET_MCU =atxmega128a4u
CC         ='/media/solid/avr/bin/avr-gcc'
AVROBJCOPY ='/media/solid/avr/bin/avr-objcopy'
AVRDUDE    ='/media/solid/avr/bin/avrdude'
OPTIMIZE   =-O3

DEFS       =

override CFLAGS  = -g -Wall $(OPTIMIZE) $(DEFS) --std=gnu99
override LDFLAGS = -Wall 

include conf/main.mk



TARGET_FILE_NAME:=$(call get_target_file_name,$(TARGET_MCU),main)

all: $(TARGET_FILE_NAME)




#$(call init_env_constant,atmega8a)
$(call init_mmcu,$(TARGET_MCU))
$(call include_conf,$(TARGET_MCU))
$(call include_lib,lib)
$(call include_program_conf,$(TARGET_MCU),main)






flash: all
	sudo $(AVRDUDE) \
		$(CONF_AVRDUDE_INSTALL_PARAMS) \
		-Uflash:w:$(TARGET_FILE_NAME):i \
		-p $(CONF_AVRDUDE_INSTALL_MCU_ID) \
		-c $(CONF_AVRDUDE_INSTALL_PRG) \
		-P $(CONF_AVRDUDE_INSTALL_PRG_DEV)

fuses:
	sudo $(AVRDUDE) \
		$(CONF_AVRDUDE_INSTALL_PARAMS) \
		$(PRG_CONF_AVRDUDE_FUSE) \
		-p $(CONF_AVRDUDE_INSTALL_MCU_ID) \
		-c $(CONF_AVRDUDE_INSTALL_PRG) \
		-P $(CONF_AVRDUDE_INSTALL_PRG_DEV)

clean:
	rm -f *.hex *.elf *.o $(M_CLEAN_VAR)

.PHONY=all flash clean