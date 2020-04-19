/// @description

#region ai
if (update_ai == 0 or target_inst == noone or !instance_exists(target_inst)) {
	update_ai = 15;
	
	var lowest_health = 1000;
	var lowest_instance = noone;
	
	target_inst = oPlayer;
	
	with (pTurret) {
		if hp < lowest_health {
			lowest_health = hp;
			lowest_instance = id;
		}
	}
	
	target_inst = lowest_instance;
} else {
	update_ai--;	
}

	var input_direction = point_direction( x, y, target_inst.x, target_inst.y);
	var input_magnitude = min(1.0, point_distance( x, y, target_inst.x, target_inst.y)); //cap this at 1 so that diagonals are not faster

	var input_action;
	input_action[0] = distance_to_object(target_inst) < 5;
#endregion

#region move
if input_magnitude != 0 and !input_action[0] { // if there is input, set move speed and direction
	move_direction = angle_lerp(move_direction, input_direction, 0.5);
	move_speed = approach(move_speed, move_speed_max * input_magnitude, move_acceleration);
	
	movement_vector[0] = lengthdir_x(move_speed, move_direction);
	movement_vector[1] = lengthdir_y(move_speed, move_direction);
} else {
	move_speed = approach(move_speed, 0, move_deceleration);	
}

x += lengthdir_x(move_speed, move_direction);
y += lengthdir_y(move_speed, move_direction);

image_angle = movement_vector[0] * -3;
#endregion

#region attack

if (input_action[0] and oWrenchLittle.alarm[2] <= 0) {	
	//oWrench.lever_state *= -1;
	var target_direction;
	target_direction = move_direction;	

	//
	//if (movement_vector[0] != 0) {
	//	oWrench.target_angle = target_direction - 60 * sign(movement_vector[0]) * oWrench.lever_state;
	//} else {
	//	oWrench.target_angle = target_direction + 60 * sign(movement_vector[1]) * oWrench.lever_state;
	//}	
	
	if offset = -40
		{
			oWrenchLittle.image_yscale = 1
			offset = 40
			xscale = -1
		}
		else
		{
			oWrenchLittle.image_yscale = -1
			offset = -40
			xscale = 1
		}
	
	oWrenchLittle.alarm[2] = 25;
	oWrenchLittle.alarm[1] = 10; //give some time before returning to neutral state
	
	if (oWrenchLittle.turret_obj == noone) {
		var hitbox = instance_create_layer(x,y,"instances",oPlayerHitbox)
		with hitbox
		{
			damage = .75;
			image_yscale = other.image_xscale * other.scale;
			image_angle = target_direction;
			parent = other.object_index;
		
		}
	} else {
		var hitbox = instance_create_layer(x,y,"instances",oPlayerHitbox)
		with hitbox
		{
			damage = 10.0;
			image_yscale = other.image_xscale * other.scale;
			image_angle = target_direction;
			parent = other.object_index;
		
		}
		mask_index = sTurret;
		var obj_type = oWrenchLittle.turret_obj;
		oWrenchLittle.turret_obj = noone;
		instance_create_layer(x + lengthdir_x(oWrenchLittle.sprite_width, target_direction), y + lengthdir_y(oWrenchLittle.sprite_width, target_direction), layer, obj_type);

		

		mask_index = sprite_index;
	}
	
	audio_sound_pitch(hitbox.hit_sound, 2.0);
	audio_sound_pitch(hitbox.miss_sound, 2.0);
	
//	move(move_speed * 2, target_direction);
	move_speed = lerp(move_speed, 0, .9);
}

if (movement_vector[0] != 0) {
	//oWrench.image_yscale = sign(movement_vector[0]) * oWrench.lever_state;
}

#endregion

if move_speed != 0
{
	
	sprite_index = sPlayerR		
	
	if (floor(image_index) == 3 or floor(image_index) = 7){ //play footstep sounds on frames where foot hits ground
		if (!footstep_played and (xprevious != x and yprevious != y)) {
			play_sound(sndPlayerFootstep, 00, false, 1.8, .15);	
			audio_sound_gain(sndPlayerFootstep, 0.04, 0);
			sleep(10);
			footstep_played = true;	
			 var dust = instance_create_layer(x,y+3,"instances",oParticleGround)
			 
			dust.image_blend = make_color_rgb(200, 212, 93);
			if (distance_to_object(instance_nearest(x,y, oEnemy)) < 20) {
				dust.image_blend = make_color_rgb(156, 42, 112);
			}
			//scale = surface_get_width(application_surface)/DEFAULT_WIDTH;
			//dust.image_blend = draw_getpixel(x * scale, (y+8) * scale);
		}
	} else {
		footstep_played = false;	
	}
}
else
sprite_index = sPlayer

if movement_vector[0] != 0
image_xscale = sign(movement_vector[0]);

scale = lerp(scale, 0.5, 0.05);