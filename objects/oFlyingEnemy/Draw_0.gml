	var temp_y = y;
if (knockup > 0) {
	y -= (sprite_height/2) * sin(pi * knockup/max_knockup);
	knockup--;
}

y += 4 * sin(current_time * 2 * pi * 0.001);


draw_sprite_ext(sprite_index, image_index, x, temp_y + sprite_height, image_xscale * scale * 0.8, -1 * image_yscale * scale * 0.6 + 0.1 * sin(current_time * 2 * pi * 0.001), -image_angle + SHADOW_ANGLE, c_black, SHADOW_ALPHA);

draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * scale, image_yscale * scale, image_angle, image_blend, image_alpha);

//if flash > 0{

//	flash --;
//	shader_set(shFlash);
//	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * scale, image_yscale * scale, image_angle, image_blend, image_alpha);
//	shader_reset();
//}


y = temp_y;