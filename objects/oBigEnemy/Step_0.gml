/// @description
event_inherited();

if lasthp != hp {
	repeat (2) {
	//	part_type_alpha1(global.blood_particle, random_range(0.5, 1));
		part_particles_create(global.part_system_permanent, xprevious + irandom(16)-8, yprevious + irandom(6)-3, global.blood_particle, 1);
		
		
	}
	lasthp = hp;
}

switch state {
	case enemyStates.target		:		

	if (update_pathing <= 0 or target_inst == noone or !instance_exists(target_inst))  {
		target_inst = oPowerGenerator;
			if (instance_exists(pTurret)) {
				target_inst = instance_nearest(x,y,pTurret);	
			}
		target_point_x = target_inst.x;
		target_point_y = target_inst.y;

		update_pathing = 40;
	} else {
		update_pathing--;	
	}

	move_speed = move_speed_max;

	if (x < 0) {
		move_direction = 0;
		update_pathing = 200;	
	}
	if (x > room_width) {
		move_direction = 180;
		update_pathing = 200;
	}

	if (y > room_height) {
		move_direction = 90;
		update_pathing = 140;
	}


	move_direction = angle_lerp(move_direction, point_direction(x, y, target_point_x, target_point_y), 0.2);
	if (point_distance(x,y,target_inst.x, target_inst.y) > 20) {
		x += lengthdir_x(move_speed, move_direction);
		y += lengthdir_y(move_speed, move_direction);
	}
	
	var correct_frame = floor(image_index) == 3 or  floor(image_index) == 9;
	
	if (correct_frame) {
		for (var i = 0; i < 2 * pi; i += pi/8) {
			with instance_create_layer(x+6+24*cos(i),y+24+24*sin(i),"Bullets",oSmoke1){
				image_xscale = 0.7;
				image_yscale = 0.7;
			}
		}
		if ( snd_played = false) {

		play_sound(sndBoom, 10, false, 1.0, 0.1);
			snd_played = true;
		}
	} else {
		damaged = false
		snd_played = false;
	}
	
	if (point_distance(x,y,target_inst.x, target_inst.y) < 30 and object_is_ancestor(target_inst.object_index, pTurret) and correct_frame) {
		instance_destroy(target_inst);
		exit;
	}
	
	if (point_distance(x,y,target_inst.x, target_inst.y) < 30 and target_inst.object_index == oPowerGenerator and correct_frame and !damaged) {
		oPowerGenerator.hp-= 3;
		damaged = true;
		exit;
	}
	
	//global.spawn_enemies = false;

	
	break;
	case enemyStates.stun		:		 
	state = enemyStates.target;
	break;
	case enemyStates.dead		:	
	play_sound(choose(sndBoom,sndBoom2), 10, false, 1.5, .1)
	oCamera.screenshake += 0.14;
	for (var i = 0; i < 2 * pi; i += pi/8) {
		with instance_create_layer(x+6+24*cos(i)*i/pi,y+24+24*sin(i)*i/pi,"Bullets",oSmoke1){
			image_xscale = 0.7;
			image_yscale = 0.7;
		}
	}
	instance_destroy();
	break;
}

if (x > xprevious) {
	image_xscale = 1;
} else if (x < xprevious) {
	image_xscale = -1;	
}