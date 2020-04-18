/// @description
if (alarm[1] > 0) {
	for (var i = last_angle + 720; abs(i - image_angle - 720) > 2; i = approach(i, image_angle + 720, 2)) {
		shader_set(shFlash);
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, i, image_blend, image_alpha);
		shader_reset();
	
	
	}
}

draw_self();
