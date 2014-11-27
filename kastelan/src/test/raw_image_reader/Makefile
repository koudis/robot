CC = bfin-uclinux-gcc
EXEC = v4l_test
OBJS = v4l_test.o jpeg.o r8x8dct.o

PATH += :/opt/uClinux/bfin-uclinux/bin/:/opt/uClinux/bfin-linux-uclibc/bin/

CFLAGS += -I. -O2 -Wall
ASMFLAGS = -x assembler-with-cpp

all: $(EXEC)

$(EXEC): $(OBJS)
	$(CC) $(LDFLAGS) -o $@ $(OBJS) $(LIBM) $(LDLIBS) $(LIBGCC)


%.o: %.asm
	$(CC) $(ASMFLAGS) -c -o $@ $<

romfs:
	$(ROMFSINST) /bin/$(EXEC)

clean:
	-rm -f $(EXEC) *.elf *.gdb *.o
