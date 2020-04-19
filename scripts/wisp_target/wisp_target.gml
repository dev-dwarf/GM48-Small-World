if (update_pathing <= 0) {
	target_point_x = irandom_range(	DEFAULT_WIDTH/4, 3 * DEFAULT_WIDTH/4);
	target_point_y = irandom_range(	DEFAULT_HEIGHT/3, 2 * DEFAULT_HEIGHT/3);

	update_pathing = 40;
} else {
	update_pathing--;	
}

move_speed = move_speed_max;

if (x < 0) {
	move_direction = 0;
	update_pathing = 200;	
}
if (x > room_width) {
	move_direction = 180;
	update_pathing = 200;
}

if (y > room_height) {
	move_direction = 90;
	update_pathing = 140;
}


move_direction = point_direction(x, y, target_point_x, target_point_y);