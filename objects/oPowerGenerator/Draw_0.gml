/// @description
log("too_easy: " + string(too_easy));
draw_set_font(fTextS)
if (target != noone and instance_exists(target)) {
	if (target == oDoor) {
		draw_line_color(x,y,25,61, c_white, c_blue);
		draw_line_color(x,y,358,61, c_white, c_blue);
		
	} else {
		draw_line_color(x,y,target.x,target.y, c_white, c_blue);
	}	
}

if (too_easy < 0.7 and voltage > 0) {
	draw_line_color(x,y,DEFAULT_WIDTH/2,11, c_white, c_blue);
			
}

draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * scale, image_yscale * scale, 0, c_white, 1);

draw_text(x,y,string(round(voltage)));

