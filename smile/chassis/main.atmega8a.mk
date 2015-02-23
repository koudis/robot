#
# Config file for program ;).
#

main.atmega8a.hex: lib/mega/TWI_slave.o
main.atmega8a.hex: lib/mega/ENCODER_quadrature.o

# hi-speed crystal (16k startup time) 
PRG_CONF_AVRDUDE_FUSE = -U lfuse:w:0xdf:m -U hfuse:w:0xd9:m 

