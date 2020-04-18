/// @description
move_speed = 0;
move_direction = 0;

move_speed_max = 1.9; //base speed
move_acceleration = 0.5;
move_deceleration = 0.9;

true_max_speed = 3.2;

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