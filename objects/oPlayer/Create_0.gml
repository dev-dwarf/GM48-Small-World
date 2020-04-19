/// @description
move_speed = 0;
move_direction = 0;

move_speed_max = 1.9; //base speed
move_acceleration = 0.5;
move_deceleration = 0.9;

base_move_speed = move_speed_max;
true_max_speed = 2.3;
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
body_angle = 0;


var freebie = instance_create_layer(0, 0, layer, choose(oTurret, oLaserTurret, oDoubleTurret, oDoubleLaserTurret));

with freebie {
	do {
		x = irandom_range(1 * DEFAULT_WIDTH/4, 3 * DEFAULT_WIDTH/4);
		y = DEFAULT_HEIGHT/2 + irandom_range(-10, 50);
	
	} until place_free(x, y);
}

