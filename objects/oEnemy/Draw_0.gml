var temp_y = y;
if (knockup > 0) {
	y -= (sprite_height/2) * sin(pi * knockup/max_knockup);
	knockup--;
}

draw_sprite_ext(sprite_index, image_index, x, y+sprite_height/2, image_xscale * 0.8 * scale, -1 * image_yscale * 0.6, -image_angle + SHADOW_ANGLE, c_black, SHADOW_ALPHA);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * scale, image_yscale * scale, image_angle, image_blend, image_alpha);

//if flash > 0{

//	flash --;
//	shader_set(shFlash);
//	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * scale, image_yscale * scale, image_angle, image_blend, image_alpha);
//	shader_reset();
//}


y = temp_y;