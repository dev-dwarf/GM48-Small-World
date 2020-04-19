/// @description
event_inherited();

if lasthp != hp {
	repeat (2) {
		part_type_alpha1(global.blood_particle, random_range(0.5, 1));
		part_particles_create(global.part_system_permanent, xprevious + irandom(16)-8, yprevious + irandom(6)-3, global.blood_particle, 1);
		
		
	}
	lasthp = hp;
}

if state != enemyStates.dead
{
	particle += 1
	
	if particle >= 2
	{
		particle = 0
		var xx = random_range(-5,5)
		var yy = random_range(-5,5)
		instance_create_layer(x+xx,y+yy,"Bullets",oSmoke1)
	}
	
	particle2 += 1
	
	if particle2 >= 10
	{
		particle2 = 0
		instance_create_layer(x,y,"instancesB",oSplat)
	}
}

switch state {
	case enemyStates.target		:	
	
	var ready_to_attack = false;

	ready_to_attack = wisp_target();	
	
	shootdel ++;
	
	if shootdel >= 60
		{
			var target_inst = oPowerGenerator;
			if (instance_exists(pTurret)) {
				target_inst = instance_nearest(x,y,pTurret);	
			}
			
			shootdel = 0
			with instance_create_layer(x,y,"Bullets", oBolt)
			{
				dir = point_direction(x,y,target_inst.x,target_inst.y)
			}
		}
	
	if (ready_to_attack) {
	
		
	} else {
		
		if point_distance(x,y,target_point_x,target_point_y) > 5
			move(move_speed, move_direction);
		image_speed = 1;	
	}
		
	break;
	case enemyStates.stun		:		 
	stun_timer--;
	image_index = 0;
	
	if (stun_timer <= 0) state = enemyStates.target;
	break;
	case enemyStates.dead		:	
	sprite_index = sWispD
	//image_angle = angle_lerp(image_angle, -90, 0.3);
	image_blend = c_gray;
	image_alpha = dead_timer/40;
	dead_timer--;
	
	death_speed = approach(death_speed, 0, 0.35);
	move(death_speed, move_direction);
	
	if (floor(death_speed) != round(death_speed)) {
		for (var i = death_speed; i > 0 and death_speed > 2.5; i-=4.0) {
			var dust = instance_create_layer(x,y,"instances",oParticleGround)
			dust.image_blend = make_color_rgb(156, 42, 112);
			if (chance(75)) {
				part_type_alpha1(global.blood_particle, random_range(0.5, 1));
				part_particles_create(global.part_system_permanent, xprevious + irandom(16)-8, yprevious + irandom(6)-3, global.blood_particle, 1);
			}//part_particles_create(global.part_system_below, x + choose(-1, 1) * i, y + 4, global.dust_up_particle, 1);	
		}
	}
	
	if (xprevious == x and yprevious == y) {
		//move_direction = move_direction + 180;
		
		//switch floor(move_direction/90) {
		//	case 0:	case 1: move_direction = 180 - move_direction; break;
		//	case 2: move_direction = 180 + 180 - move_direction;
		//	case 3: move_direction = 180 + 90 - move_direction;
			
		//}
		move_direction = -1 * move_direction;
	
		death_speed = death_speed;
	}
	
	if (dead_timer == 0) instance_destroy(id, false);
	break;
}

if (x > xprevious) {
	image_xscale = 1;
} else if (x < xprevious) {
	image_xscale = -1;	
}