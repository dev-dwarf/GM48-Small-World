/// @description
var dir = point_direction(x,y,DEFAULT_WIDTH/2, DEFAULT_HEIGHT/2);
with other {
	x += lengthdir_x(move_speed_max+0.2,dir)
	y += lengthdir_y(move_speed_max+0.2,dir)
}