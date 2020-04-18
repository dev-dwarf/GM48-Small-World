/// @description
event_inherited();

switch state {
	case enemyStates.target		:		
	var ready_to_attack = false;

	ready_to_attack = enemy_target();	
	
	if (ready_to_attack) {
		image_speed = 0;
	} else {
		image_speed = 1;	
	}
		
	break;
	case enemyStates.stun		:		 
	stun_timer--;
	
	if (stun_timer <= 0) state = enemyStates.target;
	break;
	case enemyStates.dead		:		
	image_angle = angle_lerp(image_angle, -90, 0.3);
	image_blend = c_gray;
	image_alpha = dead_timer/40;
	dead_timer--;
	
	death_speed = approach(death_speed, 0, 0.35);
	move(death_speed, move_direction);
	
	if (xprevious == x and yprevious == y) {
		//move_direction = move_direction + 180;
		
		switch floor(move_direction/90) {
			case 0:	case 1: move_direction = 180 - move_direction; break;
			case 2: move_direction = move_direction + 90;
			case 3: move_direction = move_direction - 90;
			
		}
		
		death_speed = death_speed * 0.92;
	}
	
	if (dead_timer == 0) instance_destroy(id, false);
	break;
}

if (x > xprevious) {
	image_xscale = 1;
} else if (x < xprevious) {
	image_xscale = -1;	
}