/// @descriptionv
var temp_angle = image_angle
image_angle = body_angle;
draw_sprite_ext(sprite_index, image_index, x, y+sprite_height/2, image_xscale * 0.8, -1 * image_yscale * 0.6, -image_angle + SHADOW_ANGLE, c_black, SHADOW_ALPHA);

draw_self();

image_angle = temp_angle;