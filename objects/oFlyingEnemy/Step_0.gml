/// @description
event_inherited();

switch state {
	case enemyStates.target		:		
	var ready_to_attack = false;

	ready_to_attack = enemy_target();	
	
	//move(move_speed, move_direction);
	
	x += lengthdir_x(move_speed, move_direction);
	y += lengthdir_y(move_speed, move_direction);
	
	if (ready_to_attack) {
		oPowerGenerator.hp--;
		oPowerGenerator.too_easy = 0.0;
		//if (x 
		move(move_speed, move_direction);
		oCamera.screenshake += 0.8;
		play_sound(choose(sndBoom,sndBoom2), 10, false, 1.0, .1)
		instance_destroy();
	} else {
		image_speed = 1;	
	}
		
	break;
	case enemyStates.stun		:		 
	stun_timer--;
	
	if (stun_timer <= 0) state = enemyStates.target;
	break;
	case enemyStates.dead		:
	play_sound(choose(sndBoom,sndBoom2), 10, false, 1.5, .1)
	oCamera.screenshake += 0.14;
	instance_destroy();
	break;
}

if (x > xprevious) {
	image_xscale = 1;
} else if (x < xprevious) {
	image_xscale = -1;	
}