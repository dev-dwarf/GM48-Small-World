if (z > 0) zspeed = approach(zspeed, -7, 1);
if (z <= 0) {
	z = 0;
	zspeed = 0;
	move_speed = 0
}

z += zspeed;
move_speed = approach(move_speed, 0, 0.75);
move(move_speed, move_direction);


if (zspeed == 0) image_alpha-=0.03;

if (image_alpha == 0) instance_destroy();



//image_angle += zspeed * 5;
//image_blend = c_red;
