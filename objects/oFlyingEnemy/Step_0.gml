/// @description
event_inherited();

switch state {
	case enemyStates.target		:		
	var ready_to_attack = false;

	ready_to_attack = enemy_target();	
	
	if (ready_to_attack) {
		oPowerGenerator.hp--;
		//if (x 
		move(move_speed, move_direction);
		oCamera.screenshake += 0.8;
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
	oCamera.screenshake += 0.14;
	instance_destroy();
	break;
}

if (x > xprevious) {
	image_xscale = 1;
} else if (x < xprevious) {
	image_xscale = -1;	
}