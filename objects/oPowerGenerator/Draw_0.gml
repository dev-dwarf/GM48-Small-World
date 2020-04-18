/// @description
draw_set_font(fTextS)
if (target != noone and instance_exists(target)) {
	draw_line_color(x,y,target.x,target.y, c_white, c_blue);
	
} else {
	target = noone;	
	draw_line_color(x,y,25,61, c_white, c_blue);
	draw_line_color(x,y,358,61, c_white, c_blue);
}

draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * scale, image_yscale * scale, 0, merge_colour(c_black, c_white, clamp(voltage/max_voltage, 0, 1)), 1);

draw_text(x,y,string(voltage));