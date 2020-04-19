/// @description
move_speed = 0;
move_direction = 0;

scale = 1.5;

target_inst = noone;

move_speed_max = 1.4; //base speed
move_acceleration = 0.5;
move_deceleration = 0.9;

true_max_speed = 3.2;
max_heal_amount = 0.25;

heal_amount = 0.08;

movement_vector[0] = 1;
movement_vector[1] = 1;

player_state = player_states.idle;

offset = 60

footstep_played = false;
update_ai = 0;

instance_create_layer(x,y,layer,oWrenchLittle);
