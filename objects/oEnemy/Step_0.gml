/// @description
event_inherited();

switch state {
	case enemyStates.target		:		 
	
	break;
	case enemyStates.stun		:		 
	stun_timer--;
	
	if (stun_timer <= 0) state = enemyStates.target;
	break;
	case enemyStates.dead		:		
	image_angle = angle_lerp(image_angle, -90, 0.3);
	image_blend = c_gray;
	break;
}