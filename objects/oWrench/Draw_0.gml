/// @description
if (alarm[1] > 4) {
	//while(last_angle < 0) last_angle += 360;
	//while(image_angle < 0) image_angle += 360;
	
	//if (image_angle > last_angle) {
	//	for (var i = last_angle; abs(i - image_angle) > 2; i = approach(i, image_angle, 2)) {
	//		shader_set(shFlash);
	//		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, i, image_blend, image_alpha);
	//		shader_reset();
	
	
	//	}
		
	//} else {
	//	for (var i = image_angle; abs(i - last_angle) > 2; i = approach(i, last_angle, 2)) {
	//		shader_set(shFlash);
	//		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, i, image_blend, image_alpha);
	//		shader_reset();
	
	
	//	}
	//}
	image_index = 1;
} else {
	image_index = 0;	
}

draw_self();
