
AVRGCC='/media/solid/avr/bin/avr-gcc'
AVROBJCOPY='/media/solid/avr/bin/avr-objcopy'
AVRDUDE='/media/solid/avr/bin/avrdude'


all: main.atxmega128a4u.hex

install: all
	sudo $(AVRDUDE) -Uflash:w:main.atxmega128a4u.hex:i -p x128a4u -c dragon_pdi -B 10

read:
	$(AVRDUDE) -c dragon_pdi -p x128a4u -P usb –U flash:r:r_main.atxmega128a4u.hex -B10

clean:
	rm *.hex *.o *.elf


%.atxmega128a4u.hex : %.atxmega128a4u.c
	$(AVRGCC) -g -Os -mmcu=atxmega128a4u -c $<
	$(AVRGCC) -mmcu=atxmega128a4u -o $(patsubst %.c,%.elf,$<) $(patsubst %.c,%.o,$<)
	$(AVROBJCOPY) -R .eeprom -R .fuse -R .lock -R .signature -R .user_signatures -O ihex $(patsubst %.c,%.elf,$<) $(patsubst %.c,%.hex,$<)


.PHONY=all install
