all: gui_window gui_image

gui_window: position_analyzer.c
	gcc -DWINDOW `pkg-config cairo-xlib-xrender --cflags --libs` -pthread -lm $< -o $@

gui_image: position_analyzer.c
	gcc `pkg-config cairo-xlib-xrender --cflags --libs` -pthread -lm $< -o $@

clean:
	rm -f gui_window gui_image image-*.png
