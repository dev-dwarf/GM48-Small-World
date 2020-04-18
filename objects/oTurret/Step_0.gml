/// @description

// Inherit the parent event
event_inherited();

if (shoot_target != noone and instance_exists(shoot_target)) {
	var target_angle = point_direction(x,y,shoot_target.x, shoot_target.y);
	
	var target_angle_difference = angle_difference(image_angle, target_angle);
	image_angle -= sign(target_angle_difference) * min(swivel_speed, abs(target_angle_difference));
	
	if (shoot_timer <= 0) {
		shoot_timer = shoot_speed;
		
		// create bullet
	} else {
		shoot_timer--;	
	}
} else {
	shoot_target = noone;
	
	var enemy = instance_nearest(x,y,pEnemy)
	if (enemy and distance_to_object(enemy) < shoot_range) {
		shoot_target = enemy;	
	}
}