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
	
		if (shoot_timer <= 0) {
			shoot_timer = shoot_speed * oPowerGenerator.max_voltage/max(oPowerGenerator.voltage, 3000);
			scale = 1.2;
			gun_scale = 0.3;
			
			
			play_sound(sndBasicTurret, 1, false, 1.0, 0.1);
		
			oCamera.screenshake += 0.02
			// create bullet
			if (instance_number(oShell) < 15 or chance(25)) {
				var shell = instance_create_layer(x+irandom_range(-8, 8), y+irandom_range(-8, 8), layer, oShell);
				shell.image_blend = make_color_rgb(104, 111, 153);
				shell.move_direction = 180+image_angle;
			}
			
			with instance_create_layer(x + lengthdir_x(sprite_width/3, image_angle), y + lengthdir_y(sprite_width/3, image_angle), layer, oTurretBullet) {
				  oCamera.screenshake += 0.01;
				speed = 9;
				direction = other.image_angle+irandom_range(-5,5);
				image_angle = direction;
				image_xscale = 1.2;
				image_yscale = 1.2;
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
	
		
	
	//image_blend = c_white;

} else {
	scale = lerp(scale, 0.7, 0.2);
	//image_blend = c_gray;
}

gun_scale = lerp(gun_scale, 1.0, .2);