/// @description
draw_sprite_ext(sprite_index, image_index, x, y+2, scale *image_xscale * 0.8, -1 * scale*image_yscale * 0.6, image_angle, c_black, SHADOW_ALPHA);
draw_sprite_ext(sprite_index, image_index, x, y, scale *image_xscale, scale*image_yscale, image_angle, image_blend, image_alpha);

draw_sprite_ext(sprite_index, image_index, x, y+2, scale *image_xscale * 0.8, -1 * scale*image_yscale * 0.6, spinoppo, c_black, SHADOW_ALPHA);
draw_sprite_ext(sprite_index, image_index, x, y, scale *image_xscale, scale*image_yscale, spinoppo, image_blend, image_alpha);

draw_sprite_ext(sVoltzTop, image_index, x, y+2, scale *image_xscale * 0.8, -1 * scale*image_yscale * 0.6, 0, c_black, SHADOW_ALPHA);
draw_sprite_ext(sVoltzTop, image_index, x, y, scale *image_xscale, scale*image_yscale, 0, image_blend, image_alpha);