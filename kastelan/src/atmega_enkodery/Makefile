PRG            = decoder
OBJ            = decoder.o TWI_slave.o
MCU_TARGET     = atmega48p
MCU_LOADERPART = m48p
OPTIMIZE       = -O0

DEFS           =
LIBS           =

# You should not have to change anything below here.

CC             = avr-gcc

# Override is only needed by avr-lib build system.

override CFLAGS        = -g -Wall $(OPTIMIZE) -mmcu=$(MCU_TARGET) $(DEFS) --std=gnu99
override LDFLAGS       = -Wl,-Map,$(PRG).map

OBJCOPY        = avr-objcopy
OBJDUMP        = avr-objdump

all: $(PRG).elf lst text eeprom

$(PRG).elf: $(OBJ)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)

clean:
	rm -rf *.o $(PRG).elf *.eps *.png *.pdf *.bak 
	rm -rf *.lst *.map $(EXTRA_CLEAN_FILES)

lst:  $(PRG).lst

%.lst: %.elf
	$(OBJDUMP) -h -S $< > $@

# Rules for building the .text rom images

text: hex bin srec

hex:  $(PRG).hex
bin:  $(PRG).bin
srec: $(PRG).srec

%.hex: %.elf
	$(OBJCOPY) -j .text -j .data -O ihex $< $@

%.srec: %.elf
	$(OBJCOPY) -j .text -j .data -O srec $< $@

%.bin: %.elf
	$(OBJCOPY) -j .text -j .data -O binary $< $@

# Rules for building the .eeprom rom images

eeprom: ehex ebin esrec

ehex:  $(PRG)_eeprom.hex
ebin:  $(PRG)_eeprom.bin
esrec: $(PRG)_eeprom.srec

%_eeprom.hex: %.elf
	$(OBJCOPY) -j .eeprom --change-section-lma .eeprom=0 -O ihex $< $@

%_eeprom.srec: %.elf
	$(OBJCOPY) -j .eeprom --change-section-lma .eeprom=0 -O srec $< $@

%_eeprom.bin: %.elf
	$(OBJCOPY) -j .eeprom --change-section-lma .eeprom=0 -O binary $< $@

# Every thing below here is used by avr-libc's build system and can be ignored
# by the casual user.

FIG2DEV                 = fig2dev
EXTRA_CLEAN_FILES       = *.hex *.bin *.srec

dox: eps png pdf

eps: $(PRG).eps
png: $(PRG).png
pdf: $(PRG).pdf

%.eps: %.fig
	$(FIG2DEV) -L eps $< $@

%.pdf: %.fig
	$(FIG2DEV) -L pdf $< $@

%.png: %.fig
	$(FIG2DEV) -L png $< $@

program: $(PRG).hex
	uisp -dprog=stk200 --erase --upload --verify if=$< -dlpt=0x378 -v=3 --hash=12

load_raw: $(PRG).hex
	avrdude -c pony-stk200 -E noreset -P /dev/parport0 -p $(MCU_LOADERPART) -U flash:w:$<
load: $(PRG).hex
#	avrdude -c avr109 -P /dev/ttyS0 -b 38400 -p $(MCU_LOADERPART) -U flash:w:$<
	avrdude -c usbasp -p $(MCU_LOADERPART) -U flash:w:$<


read_fuse:
	avrdude -c pony-stk200 -E noreset -P /dev/parport0 -p $(MCU_LOADERPART) -U lfuse:r:lfuse:b -U hfuse:r:hfuse:b -U efuse:r:efuse:b



#fuse:
#	avrdude -U lfuse:w:0xe4:m  tohle by se melo upravit (takhle to bylo pro bootloader na m128)


flash: $(PRG).hex
	avr-size $(PRG).hex
	avrdude -p $(MCU_LOADERPART) -c usbasp -U flash:w:$< -v

