/// @description

// Inherit the parent event
event_inherited();

image_blend = c_blue;

shoot_speed = 4 * oPlayer.base_move_speed/oPlayer.move_speed_max;
shoot_timer = 0;
shoot_target = noone;
swivel_speed = 30;
shoot_range = DEFAULT_WIDTH * 0.25;
targeting_delay = 18;
targeting_timer = 0;

hp = 8 + 3 * oPlayer.heal_amount/0.05;
max_hp = hp;

gun_scale = 1.0;
newly_created = 10;