avr-gcc -Wall -Os -finline-functions -DF_CPU=8000000     -Iusbdrv -I. -DDEBUG_LEVEL=0 -mmcu=atmega8 -c main.c -o main.o
avr-gcc -Wall -Os -finline-functions -DF_CPU=8000000     -Iusbdrv -I. -DDEBUG_LEVEL=0 -mmcu=atmega8 -o main.elf main.o
rm -f main.hex main.eep.hex
avr-objcopy -j .text -j .data -O ihex main.elf main.hex
avr-size main.hex
