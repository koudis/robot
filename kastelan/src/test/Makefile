OBJ = all_test.o led_driver.o input_event_driver.o i2c_communication.o variable_loader.o encoder_driver.o our_time.o motor_driver.o

all: ../../build_arm/all_test

%.o: %.cpp
	g++ -I ../common -c $<

%.o: ../common/%.cpp
	g++ -I ../common -c $<

../../build_arm/all_test: $(OBJ)
	g++ -o $@ -pthread $(notdir $^)

run: ../../build_arm/all_test
	sudo stty -F /dev/ttyAMA0 -echo
	sudo stty -F /dev/ttyAMA0 ospeed 9600 2> /dev/null
	sudo stty -F /dev/ttyAMA0 ispeed 9600
	sudo stty -F /dev/ttyAMA0 ospeed 9600
	cd ../../build_arm/; \
	  sudo ./all_test || true

clean:
	rm -f *.o
