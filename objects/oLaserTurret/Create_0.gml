/// @description

// Inherit the parent event
event_inherited();

image_blend = c_red;

shoot_speed = 60*1.8 * oPlayer.base_move_speed/oPlayer.move_speed_max;
shoot_timer = 0;
shoot_target = noone;
swivel_speed = 15;
shoot_range = DEFAULT_WIDTH ;
targeting_delay = 50;
targeting_timer = 0;

//laser = noone;
hp = 5 + 2 * oPlayer.heal_amount/0.05;
max_hp = hp;
length = 0

newly_created = 10;