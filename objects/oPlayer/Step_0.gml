/// @description

#region input
var input_vector, input_action, input_direction, input_magnitude, input_restart;

var gamepad = gamepad_is_connected(0);
if (gamepad) {
	gamepad_set_axis_deadzone(0, 0.3);
	input_vector[0] = gamepad_axis_value(0, gp_axislh);
	input_vector[1] = gamepad_axis_value(0, gp_axislv);
	
	input_action[0] = gamepad_button_check_pressed(0, gp_face3);
	input_restart   = gamepad_button_check_pressed(0, gp_start);

} else {
	input_vector[0] = check(vk_d) - check(vk_a);
	input_vector[1] = check(vk_s) - check(vk_w);
	
	input_action[0] = mouse_check_button_pressed(mb_left);
	input_restart   = check_p(vk_r);
}

input_direction = point_direction( 0, 0, input_vector[0], input_vector[1]);
input_magnitude = min(1.0, point_distance( 0, 0, input_vector[0], input_vector[1])); //cap this at 1 so that diagonals are not faster

if (input_restart) room_restart();

#endregion

#region move
if input_magnitude != 0 { // if there is input, set move speed and direction
	move_direction = angle_lerp(move_direction, input_direction, 0.5);
	move_speed = approach(move_speed, move_speed_max * input_magnitude, move_acceleration);
	
	movement_vector[0] = lengthdir_x(move_speed, move_direction);
	movement_vector[1] = lengthdir_y(move_speed, move_direction);
} else {
	move_speed = approach(move_speed, 0, move_deceleration);	
}

move(move_speed, move_direction);
#endregion

#region attack

if (input_action[0] and oWrench.alarm[2] <= 0) {	
	oWrench.lever_state *= -1;
	var target_direction;
	if (gamepad) {
		target_direction = move_direction;	
	} else {
		target_direction = point_direction(x,y,mouse_x, mouse_y);	
	}
	
	if (movement_vector[0] != 0) {
		oWrench.target_angle = target_direction - 60 * sign(movement_vector[0]) * oWrench.lever_state;
	} else {
		oWrench.target_angle = target_direction + 60 * sign(movement_vector[1]) * oWrench.lever_state;
	}	
	
	oWrench.alarm[2] = 7;
	oWrench.alarm[1] = 10; //give some time before returning to neutral state
	
	with instance_create_layer(x,y,"instances",oPlayerHitbox)
	{
		damage = 1.0;
		image_yscale = other.image_xscale;
		image_angle = target_direction;
		
	}
	
//	move(move_speed * 2, target_direction);
	move_speed = lerp(move_speed, 0, .8);
}

if (movement_vector[0] != 0) {
	oWrench.image_yscale = sign(movement_vector[0]) * oWrench.lever_state;
}

#endregion
