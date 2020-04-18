/// @description

#region input
var input_vector, input_action, input_direction, input_magnitude;

var gamepad = gamepad_is_connected(0);
if (gamepad) {
	gamepad_set_axis_deadzone(0, 0.3);
	input_vector[0] = gamepad_axis_value(0, gp_axislh);
	input_vector[1] = gamepad_axis_value(0, gp_axislv);
	
	input_action[0] = gamepad_button_check_pressed(0, gp_face3);

} else {
	input_vector[0] = check(vk_d) - check(vk_a);
	input_vector[1] = check(vk_s) - check(vk_w);
	
	input_action[0] = check(vk_e);
}

input_direction = point_direction( 0, 0, input_vector[0], input_vector[1]);
input_magnitude = min(1.0, point_distance( 0, 0, input_vector[0], input_vector[1])); //cap this at 1 so that diagonals are not faster


#endregion

#region move
if input_magnitude != 0 { // if there is input, set move speed and direction
	move_direction = angle_lerp(move_direction, input_direction, 0.5);
	move_speed = approach(move_speed, move_speed_max * input_magnitude, move_acceleration);
} else {
	move_speed = approach(move_speed, 0, move_deceleration);	
}


move(move_speed, move_direction);
#endregion

move(knockback, knockback_direction);
//knockback = lerp(knockback, 0, 0.1);

if (knockback == 0) {
	knockback_direction = 0;	
}