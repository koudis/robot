OBJ = main.o led_driver.o input_event_driver.o i2c_communication.o variable_loader.o encoder_driver.o our_time.o motor_driver.o strategy.o

all: ../../build_arm/main

%.o: %.cpp
	g++ -I ../common -I ../strategy -c $<

%.o: ../common/%.cpp
	g++ -I ../common -c $<

%.o: ../strategy/%.cpp
	g++ -I ../common -I ../strategy -c $<


../../build_arm/main: $(OBJ)
	g++ -o $@ -pthread $(notdir $^)

run: ../../build_arm/main
	sudo stty -F /dev/ttyAMA0 -echo
	sudo stty -F /dev/ttyAMA0 ospeed 9600 2> /dev/null
	sudo stty -F /dev/ttyAMA0 ispeed 9600
	sudo stty -F /dev/ttyAMA0 ospeed 9600
	cd ../../build_arm/; \
	  sudo nice -n -20 ./main || true

clean:
	rm -f *.o
