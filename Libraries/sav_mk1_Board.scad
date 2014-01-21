/*********************************
Measurements taken from 
http://www.reprap.org/wiki/SAV_MKI
*********************************/

//board data
lenght = 99.7;
width = 64.77;
height = 10;
colorBoard = "limegreen";
roundCornersRadio = 3.59;
//mounting holes data
mountingHoleRadio = 1.8;
mountingHolesL = 92.71;
mountingHolesW = 64.77;
mountingDistanceFromBoard = 3.81;

$fn = 64;//3D printing definition

/********************************/
module boardArea(){
	cx = lenght/2 - roundCornersRadio;
	cy = width/2 - roundCornersRadio;
	boardPoints = [
		[cx,cy,0],
	 	[-cx,cy,0],
		[-cx,-cy,0],
		[cx,-cy,0]
	];
	hull(){
		for(x = boardPoints)
			translate(x)
				cylinder(r= roundCornersRadio, h = height, center = true);	
	}
}	
module mountingHolesAll(){
	tx = mountingHolesL/2;
	ty = mountingHolesW/2 - mountingDistanceFromBoard;
	PointsMountingHoles = [
		[tx,ty,0],
		[-tx,ty,0],
		[-tx,-ty,0],
		[tx,-ty,0],
		];
	for(y = PointsMountingHoles)
	translate(y)
		cylinder(r= mountingHoleRadio, h = height+1, center = true);
}
module SAV_MKI_print(){
	color(colorBoard)
	difference(){
		boardArea();
		mountingHolesAll();
	}
}
SAV_MKI_print();


