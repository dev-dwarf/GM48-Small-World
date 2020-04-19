/// @description
move_speed = 0;
move_direction = 0;

move_speed_max = 1.9; //base speed
move_acceleration = 0.5;
move_deceleration = 0.9;

true_max_speed = 3.2;
max_heal_amount = 0.25;

heal_amount = 0.05;

movement_vector[0] = 1;
movement_vector[1] = 1;

player_state = player_states.idle;

offset = 60

enum player_states {
	idle,
	walk,
	menu,
	stun,
	dead
}

footstep_played = false;


var xx, yy;

	mask_index = sTurretLaser;
do {
	xx = irandom_range(1 * DEFAULT_WIDTH/4, 3 * DEFAULT_WIDTH/4);
	yy = DEFAULT_HEIGHT/2 + irandom_range(-10, 50);
	
} until place_free(xx, yy);
	mask_index = sprite_index;

instance_create_layer(xx, yy, layer, choose(oTurret, oLaserTurret, oDoubleTurret, oDoubleLaserTurret));
