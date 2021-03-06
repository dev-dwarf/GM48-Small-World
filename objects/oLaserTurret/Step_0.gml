/// @description

// Inherit the parent event
var inst = instance_place(x,y,oPlayerHitbox)
if (inst and inst.parent == oPlayer and newly_created <= 0) {
	oPowerGenerator.target = pTurret;	
	oPowerGenerator.scale = 0.8;	
	//scale = 0.8;
}

if (newly_created > 0) newly_created--;

if (oPowerGenerator.target == pTurret) {
	active = true;
} else {
	active = false;	
}

// targeting code
if active {
	oPowerGenerator.voltage_base_decrease_per_step = 15 * instance_number(pTurret);
	if (shoot_target != noone and instance_exists(shoot_target) and shoot_target.state != enemyStates.dead) {
		var target_angle = point_direction(x,y,shoot_target.x, shoot_target.y);
	
		var target_angle_difference = angle_difference(image_angle, target_angle);
		image_angle -= sign(target_angle_difference) * min(swivel_speed, abs(target_angle_difference));
		
			if instance_exists(oLaser)
			{
				aim = image_angle
				
				
				length = 500
			
			}
		if (shoot_timer <= 0) {

			shoot_timer = shoot_speed ;
			scale = 1.2;
			play_sound(sndLaserTurret, 2, false, 1.0, 0.05);
		
			oCamera.screenshake += 0.02
			// create bullet
			with instance_create_layer(x + lengthdir_x(sprite_width/3, image_angle), y + lengthdir_y(sprite_width/3, image_angle), layer, oLaser) {
				oCamera.screenshake += 0.01;
				parent = other.id
			}
		} else {
			shoot_timer--;	
		}
	
		scale = lerp(scale, 1.0, 0.2);
	} else {
		if (shoot_target != noone) {
			shoot_target = noone;
			targeting_timer = targeting_delay;	
		}
		scale = approach(scale, 0.9, 0.02);
	}
		targeting_timer--;
	
		if (targeting_timer <= 0) {
			targeting_timer = targeting_delay;	
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
	
		
	
	//image_blend = c_red;

} else {
	scale = lerp(scale, 0.7, 0.2);
	//image_blend = c_gray;
}