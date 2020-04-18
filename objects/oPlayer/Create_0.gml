/// @description
move_speed = 0;
move_direction = 0;

move_speed_max = 1.9; //base speed
move_acceleration = 0.5;
move_deceleration = 0.9;

knockback = 0;
knockback_direction = 0;

true_max_speed = 3.2;

player_state = player_states.idle;

enum player_states {
	idle,
	walk,
	menu,
	stun,
	dead
}