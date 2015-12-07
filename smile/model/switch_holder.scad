include <e_components/switch.scad>

module switch_holder(wood_color){

	s_s = 0.3;

	s_z = -1;
	s_y = 2;
	s_x_start = 10;
	s_x_step = 7;
	s_x_count = 40;

	color(wood_color)cube([50,10,2]);

	for(s_x = [s_x_start:s_x_step:s_x_count]){
		translate([s_x, s_y,s_z])rotate([0,0,90])scale([s_s,s_s,s_s])switch_land("Red");
	}


}

switch_holder("BurlyWood");