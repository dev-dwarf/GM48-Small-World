/// @description

// Inherit the parent event
event_inherited();

if (shoot_target != noone and instance_exists(shoot_target) and shoot_target.state != enemyStates.dead) {
	var target_angle = point_direction(x,y,shoot_target.x, shoot_target.y);
	
	var target_angle_difference = angle_difference(image_angle, target_angle);
	image_angle -= sign(target_angle_difference) * min(swivel_speed, abs(target_angle_difference));
	
	if (shoot_timer <= 0) {
		shoot_timer = shoot_speed;
		
		// create bullet
		with instance_create_layer(x + lengthdir_x(sprite_width/2, image_angle), y + lengthdir_y(sprite_width/2, image_angle), layer, oTurretBullet) {
			speed = 8;
			direction = other.image_angle;
		}
	} else {
		shoot_timer--;	
	}
} else {
	shoot_target = noone;
	
	var enemy = instance_nearest(x,y,pEnemy)
	
	if (enemy and distance_to_object(enemy) < shoot_range) {
		shoot_target = enemy;	
		
		while(enemy.state == enemyStates.dead) {
			enemy = instance_nearest(x,y,pEnemy);
		
			if (!enemy) break; //no enemies, so exit
		
			if (distance_to_object(enemy) < shoot_range) {
				if (enemy.state != enemyStates.dead) {
					shoot_target = enemy;	 //set target
				} else {
					instance_deactivate_object(enemy);	//deactivate enemy so we dont target them
				}
			} else {
				break; // nearest enemy out of range, so exit	
			}	
		}
	
		instance_activate_object(pEnemy);
	}
	
}