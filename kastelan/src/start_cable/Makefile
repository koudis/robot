all: ../../build_arm/start_cable

%.o: %.cpp
	g++ -I ../common -c $<

%.o: ../common/%.cpp
	g++ -I ../common -c $<

../../build_arm/start_cable: start_cable.o i2c_communication.o variable_loader.o
	g++ -o $@ $(notdir $^)

run: ../../build_arm/start_cable
	cd ../../build_arm/; \
	  sudo ./start_cable || true

clean:
	rm -f *.o ../../build_arm/start_cable
