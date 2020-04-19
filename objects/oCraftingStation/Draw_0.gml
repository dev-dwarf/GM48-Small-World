/// @description
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * scale * 0.8, -0.6 * image_yscale * scale, 0, c_black, SHADOW_ALPHA);
draw_sprite_ext(sLever, lever_index, x-18, y-8, image_xscale * scale * 0.8, -0.6 * image_yscale * scale, 0, c_black, SHADOW_ALPHA);

draw_sprite_ext(sprite_index, image_index, x, y, scale *image_xscale, scale*image_yscale, image_angle, image_blend, image_alpha);
draw_sprite_ext(sRandomGun, drop_index, x, y-13, scale *image_xscale, scale*image_yscale, image_angle, image_blend, image_alpha);
draw_sprite_ext(sLever, lever_index, x-18, y-8, scale *image_xscale, scale*image_yscale, image_angle, image_blend, image_alpha);


if flash > 0 {
	flash --;
	shader_set(shFlash);
	draw_self();
	shader_reset();
}
