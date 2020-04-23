/// @description

// Inherit the parent event
event_inherited();

image_blend = c_purple;

shoot_speed = 60 * 0.85 * oPlayer.base_move_speed/oPlayer.move_speed_max;
shoot_timer = 0;
shoot_target = noone;
swivel_speed = 10;
shoot_range = DEFAULT_WIDTH;
targeting_delay = 28;
targeting_timer = 0;

hp = 10 + 4 * oPlayer.heal_amount/0.05;
max_hp = hp;

newly_created = 10;
