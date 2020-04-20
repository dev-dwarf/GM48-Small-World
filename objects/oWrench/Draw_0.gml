/// @description
if (alarm[1] > 3) {
	image_index = 2;
	if (alarm[1] > 4)
		image_index = 1;
	
} else {
	image_index = 0;	
}

draw_sprite_ext(sprite_index, 0, oPlayer.x, oPlayer.y+10, image_xscale * scale * 0.8, image_yscale * scale * -1 * 0.6, image_angle + SHADOW_ANGLE, c_black, SHADOW_ALPHA);


draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * scale, image_yscale * scale, image_angle, image_blend, image_alpha);

if (turret_obj != noone) {
	draw_sprite_ext(object_get_sprite(turret_obj), 0, x + lengthdir_x(sprite_width, image_angle), y + lengthdir_y(sprite_width, image_angle), image_xscale * scale, image_yscale * scale, image_angle, image_blend, image_alpha);	
}