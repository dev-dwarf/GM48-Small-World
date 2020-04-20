/// @description
draw_sprite_ext(sprite_index, image_index, x, y+3, image_xscale * 0.8 * scale, -1 * image_yscale * scale * 0.6, -image_angle + SHADOW_ANGLE, c_black, SHADOW_ALPHA);

draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * scale, image_yscale * scale, image_angle, image_blend, image_alpha);