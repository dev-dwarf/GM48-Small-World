/// @description



// Inherit the parent event
event_inherited();

shoot_speed = 4 * oPlayer.base_move_speed/oPlayer.move_speed_max;
shoot_timer = 0;
shoot_target = noone;
swivel_speed = 20;
shoot_range = DEFAULT_WIDTH * 0.3;
targeting_delay = 18;
targeting_timer = 0;

gun_scale = 1.0;

hp = 7 + 3 * oPlayer.heal_amount/0.05;
max_hp = hp;
newly_created = 10;
