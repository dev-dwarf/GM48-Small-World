/// @description



// Inherit the parent event
event_inherited();

shoot_speed = 8;
shoot_timer = 0;
shoot_target = noone;
swivel_speed = 20;
shoot_range = DEFAULT_WIDTH * 0.3;
targeting_delay = 18;
targeting_timer = 0;

gun_scale = 1.0;

hp = 6 + 2 * oPlayer.heal_amount/0.05;
max_hp = hp;
