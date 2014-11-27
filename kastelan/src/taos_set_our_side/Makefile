OBJ = led_driver.o input_event_driver.o i2c_communication.o variable_loader.o encoder_driver.o our_time.o motor_driver.o

all: ../../build_arm/taos_set_our_side

%.o: %.cpp
	g++ -I ../common -c $<

%.o: ../common/%.cpp
	g++ -I ../common -c $<

../../build_arm/taos_set_our_side: taos_set_our_side.o $(OBJ)
	g++ -o $@ -pthread $(notdir $^)

run: ../../build_arm/taos_set_our_side
	cd ../../build_arm/; \
	  sudo ./taos_set_our_side || true

clean:
	rm -f *.o
