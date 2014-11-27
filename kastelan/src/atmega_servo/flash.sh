avr-size main.hex
avrdude -p m8 -c usbasp -U flash:w:main.hex -v

#clk 8MHz
#avrdude -p m8 -c usbasp -U lfuse:w:0xe4:m -v
