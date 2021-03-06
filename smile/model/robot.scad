include <motor.scad>
include <breadboard.scad>
include <switch_holder.scad>
include <boards/switchboard_12V.scad>

wood_color = "BurlyWood";
battery_color = "DarkGray";

// CTRL+4
// left
translate([-40,-5,2]) scale([0.75,0.75,0.75]) motor_unit();
// lower right
translate([25,-27,2]) rotate([0,0,130]) scale([0.75,0.75,0.75]) motor_unit();
// upper right
translate([20,32,2]) rotate([0,0,-130]) scale([0.75,0.75,0.75]) motor_unit();

// Robot lower plate
color(wood_color)cylinder(2,50,50);

// Battery
color(battery_color)translate([0,1,-10.5])cube([20,10,10]);
color(battery_color)translate([0,-11,-10.5])cube([20,10,10]);

translate([0,20,-10])rotate([0,180,90])switch_holder(wood_color);

bb_scale = 0.3;
translate([-17,12,0])rotate([0,180,0])scale([bb_scale,bb_scale,bb_scale])breadboard();

sb_12V_scale = 0.15;
translate([-43,0,-1])rotate([180,0,0])scale(sb_12V_scale,sb_12V_scale,sb_12V_scale)switchboard_12V(screws=true);