include <e_components/switch.scad>

module switch_holder(wood_color){

	hol_length = 50;
	hol_width = 10;
	hol_height = 2;

	pole_height = 10;
	pole_width = 2;

	s_s = 0.3;

	s_z = -1;
	s_y = 2;
	s_x_start = 10;
	s_x_step = 7;
	s_x_count = 40;

	color(wood_color)cube([hol_length,hol_width,hol_height]);

	for(s_x = [s_x_start:s_x_step:s_x_count]){
		translate([s_x, s_y,s_z])rotate([0,0,90])scale([s_s,s_s,s_s])switch_land("Red");
	}

	color(wood_color)translate([3,hol_width/2,-pole_height])cylinder(pole_height,pole_width,pole_width);
	color(wood_color)translate([hol_length-(pole_width+1),hol_width/2,-pole_height])cylinder(pole_height,pole_width,pole_width);
}

//switch_holder("BurlyWood");