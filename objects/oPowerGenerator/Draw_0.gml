/// @description
//log("too_easy: " + string(too_easy));

var flash_true = flash > 0
if (flash_true) {
	flash--;
	shader_set(shFlash);	
}

draw_set_font(fTextS)


draw_sprite_ext(sprite_index, image_index, x, y - 2, image_xscale * scale * 0.8, -0.3 * image_yscale * scale, 0, c_black, SHADOW_ALPHA);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * scale, image_yscale * scale, 0, c_white, 1);

//draw_text(x,y,string(round(voltage)));

if (flash_true) {
	shader_reset();	
}