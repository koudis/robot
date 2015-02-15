
TARGET_MCU =atmega8a
CC         ='/media/solid/avr/bin/avr-gcc'
AVROBJCOPY ='/media/solid/avr/bin/avr-objcopy'
AVRDUDE    ='/media/solid/avr/bin/avrdude'
OPTIMIZE   =-O3

DEFS       =

override CFLAGS  = -g -Wall $(OPTIMIZE) $(DEFS) --std=gnu11
override LDFLAGS = -Wall 

include conf/main.mk



TARGET_FILE_NAME:=$(call get_target_file_name,atmega8a,main)

all: $(TARGET_FILE_NAME)




$(call init_mmcu,atmega8a)
$(call include_conf,atmega8a)
$(call include_lib,lib)
$(call include_program_conf,atmega8a,main)






flash: all
	sudo $(AVRDUDE) \
		-B 5 \
		-Uflash:w:$(TARGET_FILE_NAME):i \
		-p $(CONF_AVRDUDE_INSTALL_MCU_ID) \
		-c $(CONF_AVRDUDE_INSTALL_PRG) \
		-P $(CONF_AVRDUDE_INSTALL_PRG_DEV)

clean:
	rm -f *.hex *.elf *.o $(M_CLEAN_VAR)

.PHONY=all flash clean
