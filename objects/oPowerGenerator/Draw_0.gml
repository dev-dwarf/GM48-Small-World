/// @description
if (target != noone and instance_exists(target)) {
	draw_line_color(x,y,target.x,target.y, c_white, c_blue);
	
} else {
	target = noone;	
}

draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * scale, image_yscale * scale, 0, merge_colour(c_black, c_white, voltage/max_voltage), 1);