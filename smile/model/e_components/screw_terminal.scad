
module screw_terminal(size,color){

module __screw_terminal_body(size, color){

	color(color)cube([4,4,2]);
	color(color)translate([0,1,2])cube([4,2,2]);
	color(color)translate([0,1,4])rotate([180,0,0])__triangle();
	color(color)translate([4,3,4])rotate([180,0,180])__triangle();
}

module __triangle(){

	difference(){
	cube([4,1,2]);
	rotate([-26.5,0,0])translate([-0.5,0,0])cube([5,1,3]);
	}
}

module __holes(){

	translate([1,2,3])cylinder(2,0.5,0.75);
	translate([3,2,3])cylinder(2,0.5,0.75);

	translate([0.5,-1,00.25])cube([1,2,1.5]);
	translate([2.5,-1,00.25])cube([1,2,1.5]);
}

module __screws(){

	difference(){
	union(){
	color("Silver")translate([1,2,2.75])cylinder(1,0.5,0.5);
	color("Silver")translate([3,2,2.75])cylinder(1,0.5,0.5);
	}
	translate([0.5,1.8125,3.5])cube([5,0.25,1]);
	}
}


	difference(){
	__screw_terminal_body(size,color);
	__holes();
	}

	__screws();

	color("SlateGray")translate([0.75,2,-2])cube([0.5,0.5,3]);
	color("SlateGray")translate([2.75,2,-2])cube([0.5,0.5,3]);

	color("SlateGray")translate([0.5,0.5,00.25])cube([0.9,0.25,1.4]);
	color("SlateGray")translate([2.55,0.5,00.25])cube([0.9,0.25,1.4]);
}

//screw_terminal(4,"Green");
