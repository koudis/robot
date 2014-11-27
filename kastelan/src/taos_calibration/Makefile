OBJ = led_driver.o input_event_driver.o i2c_communication.o variable_loader.o encoder_driver.o our_time.o motor_driver.o

all: ../../build_arm/taos_calibration

%.o: %.cpp
	g++ -I ../common -c $<

%.o: ../common/%.cpp
	g++ -I ../common -c $<

../../build_arm/taos_calibration: taos_calibration.o $(OBJ)
	g++ -o $@ -pthread $(notdir $^)

run: ../../build_arm/taos_calibration
	cd ../../build_arm/; \
	  sudo ./taos_calibration || true

clean:
	rm -f *.o
