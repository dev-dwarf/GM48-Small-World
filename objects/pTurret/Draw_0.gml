/// @description
draw_sprite_ext(sprite_index, image_index, x, y+6, scale *image_xscale * 0.8, -1 * scale*image_yscale * 0.6, image_angle, c_black, SHADOW_ALPHA);
draw_sprite_ext(sprite_index, image_index, x, y, scale *image_xscale, scale*image_yscale, image_angle, image_blend, image_alpha);

if flash > 0 {
	flash --;
	shader_set(shFlash);
	draw_self();
	shader_reset();
}
