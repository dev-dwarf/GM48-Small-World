/// @description
if (z > 0) zspeed -= 1;

z += zspeed;

if (z < 0) {
	
	z=-z;
	
	if (zspeed < 0) zspeed = -zspeed * 0.6 - 0.7; // (handpicked constants) 
    // if the speed is now below the threshold, snap the entity to the ground:
    if (zspeed < 1) {
        z = 0;
        zspeed = 0;
    }
}

if (zspeed == 0) image_alpha-=0.03;

if (image_alpha == 0) instance_destroy();

move_speed = approach(move_speed, 0, 0.1);

move(move_speed, move_direction);

image_angle += zspeed;


if move_speed > 0 {
	gib += 1
	
	if gib >= 3 {
	//	part_type_alpha1(global.blood_particle, random_range(0.5, 1));
		part_particles_create(global.part_system_permanent, xprevious + irandom(16)-8, yprevious + irandom(6)-3, global.blood_particle, 1);
		gib = 0
	}	
}
