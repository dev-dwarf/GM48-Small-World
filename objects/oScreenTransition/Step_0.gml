/// @description
if (!complete) {
	left_x  = lerp(left_x, DEFAULT_WIDTH/2, percent_per_step);
	right_x = lerp(right_x, DEFAULT_WIDTH, percent_per_step);

	if (left_x == DEFAULT_WIDTH/2 and right_x == DEFAULT_WIDTH) {
		complete = true;
		
		if (target_room == "game over") game_end();
		if (target_room != room) {
			room_goto(target_room);
		} else {
			room_restart();	
		}
		play_sound(sndWrenchHit, 0, false, 1.0, 0);
		play_sound(sndWrenchMiss, 0, false, 0.5, 0);
		
		percent_per_step = 0.0;
	}
} else {
	percent_per_step = approach(percent_per_step, 0.6, 0.05);
	left_x  = lerp(left_x, 0, percent_per_step);
	right_x = lerp(right_x,  DEFAULT_WIDTH * 1.5, percent_per_step);

	if (left_x == 0 and right_x == DEFAULT_WIDTH * 1.5) {
		instance_destroy();
	}

}