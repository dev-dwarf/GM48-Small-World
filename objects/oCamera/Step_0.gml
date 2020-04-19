window_set_fullscreen(fullscr)

if (check_p(ord("U")) or (gamepad_is_connected(0) and (gamepad_button_check_pressed(0, gp_padu) or gamepad_button_check_pressed(0, gp_padd)))) {
	fullscr = !fullscr
}

/// @description
var screenshake_amount, screenshake_curve;
screenshake = clamp(screenshake, 0, 1);

if (screenshake > 0) {
	var screenshake_curve = power(screenshake, 1.6)*(screenshake_intensity+screenshake*2);
	var screenshake_amount = random_range(ceil(screenshake_curve/2), ceil(screenshake_curve))*choose(-1,1);
	
	camera_set_view_pos(view_camera[0], x + screenshake_amount, y + screenshake_amount);
	
	screenshake = approach(screenshake, 0, screenshake_decrease_per_step);
} else {
	
	camera_set_view_pos(view_camera[0], x, y);
}

x = lerp(x, 0, 0.5);
y = lerp(y, 0, 0.5);