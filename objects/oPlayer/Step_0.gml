/// @description

#region input
var input_vector, input_action, input_direction, input_magnitude, input_restart;

var gamepad = gamepad_is_connected(0);
if (gamepad) {
	gamepad_set_axis_deadzone(0, 0.3);
	input_vector[0] = gamepad_axis_value(0, gp_axislh);
	input_vector[1] = gamepad_axis_value(0, gp_axislv);
	
	input_action[0] = gamepad_button_check_pressed(0, gp_face3) or gamepad_button_check_pressed(0, gp_shoulderrb);
	if (global.auto_click) 	input_action[0] = gamepad_button_check(0, gp_face3) or gamepad_button_check(0, gp_shoulderrb);

	input_action[1] = gamepad_button_check_pressed(0, gp_face2) or gamepad_button_check_pressed(0, gp_shoulderlb);
	input_restart   = gamepad_button_check_pressed(0, gp_select);

} else {
	input_vector[0] = check(vk_d) - check(vk_a);
	input_vector[1] = check(vk_s) - check(vk_w);
	
	input_action[0] = mouse_check_button_pressed(mb_left);
	if (global.auto_click) 	input_action[0] = mouse_check_button(mb_left);
	
	input_action[1] = mouse_check_button_pressed(mb_right);
	input_restart   = check_p(vk_r);
}

input_direction = point_direction( 0, 0, input_vector[0], input_vector[1]);
input_magnitude = min(1.0, point_distance( 0, 0, input_vector[0], input_vector[1])); //cap this at 1 so that diagonals are not faster

if (input_restart) {
	with instance_create_layer(0, 0, layer, oScreenTransition) {
		target_room = room;	
	} 
	part_system_clear(global.part_system_permanent);
}

#endregion

#region move
if input_magnitude != 0 { // if there is input, set move speed and direction
	move_direction = angle_lerp(move_direction, input_direction, 0.5);
	move_speed = approach(move_speed, move_speed_max * input_magnitude, move_acceleration);
	
	movement_vector[0] = lengthdir_x(move_speed, move_direction);
	movement_vector[1] = lengthdir_y(move_speed, move_direction);
} else {
	move_speed = approach(move_speed, 0, move_deceleration);	
}

move(move_speed, move_direction);
#endregion

if (!gamepad) {
	cursor_sprite = sCursor;
	if (mouse_check_button(mb_left)) cursor_sprite = sCursor1;
}

#region attack

if (input_action[1] and oPowerGenerator.target != noone) {
	oPowerGenerator.target = noone;	
	if (!audio_is_playing(sndPowerDown))
		play_sound(sndPowerDown, 0, false, 1.0, 0.02);
	//play power disconnect sound ---> donzo
}

if (input_action[0] and oWrench.alarm[2] <= 0) {	
	//oWrench.lever_state *= -1;
	var target_direction;
	if (gamepad) {
		target_direction = move_direction;	
	} else {
		target_direction = point_direction(x,y,mouse_x, mouse_y);	
	}
	//
	//if (movement_vector[0] != 0) {
	//	oWrench.target_angle = target_direction - 60 * sign(movement_vector[0]) * oWrench.lever_state;
	//} else {
	//	oWrench.target_angle = target_direction + 60 * sign(movement_vector[1]) * oWrench.lever_state;
	//}	
	
	if offset = -40
		{
			oWrench.image_yscale = 1
			offset = 40
			xscale = -1
		}
		else
		{
			oWrench.image_yscale = -1
			offset = -40
			xscale = 1
		}
	
	oWrench.alarm[2] = floor(7 * base_move_speed/move_speed_max) + 3 * global.auto_click; //increase attack speed if speed upgrade
	oWrench.alarm[1] = floor(10 * base_move_speed/move_speed_max); //give some time before returning to neutral state
	
	if (oWrench.turret_obj == noone) {
		with instance_create_layer(x,y,"instances",oPlayerHitbox)
		{
			damage = .75;
			image_yscale = other.image_xscale;
			image_angle = target_direction;
		
		}
	} else {
		
		with instance_create_layer(x,y,"instances",oPlayerHitbox)
		{
			damage = 10.0;
			image_yscale = other.image_xscale;
			image_angle = target_direction;
		
		}
		mask_index = sTurret;
		var obj_type = oWrench.turret_obj;
		oWrench.turret_obj = noone;
		instance_create_layer(x + lengthdir_x(oWrench.sprite_width, target_direction), y + lengthdir_y(oWrench.sprite_width, target_direction), layer, obj_type);

		

		mask_index = sprite_index;
	}
	
//	move(move_speed * 2, target_direction);
	move_speed = lerp(move_speed, 0, .9);
}

if (movement_vector[0] != 0) {
	//oWrench.image_yscale = sign(movement_vector[0]) * oWrench.lever_state;
}

body_angle = movement_vector[0] * -3;

#endregion

if move_speed != 0
{
	
	sprite_index = sPlayerR		
	
	if (floor(image_index) == 3 or floor(image_index) = 7) { //play footstep sounds on frames where foot hits ground
		if (!footstep_played) {
			var snd = play_sound(sndPlayerFootstep, 80, false, 1.3 + (move_speed_max/base_move_speed -1), .15);	
			audio_sound_gain(snd, 0.06 * global.sfx_volume, 0);
			sleep(10);
			footstep_played = true;	
			 var dust = instance_create_layer(xprevious,yprevious+8,"instances",oParticleGround)
			 
			dust.image_blend = make_color_rgb(200, 212, 93);
			if (distance_to_object(instance_nearest(x,y, oEnemy)) < 20) {
				dust.image_blend = make_color_rgb(156, 42, 112);
			}
			
			if (move_speed_max > base_move_speed) {
				repeat(2)
					instance_create_layer(x+irandom_range(-7, 7),y+8,"InstancesB",oParticleSpeed);
					
				oParticleSpeed.image_angle = move_direction + irandom_range(-7, 7)
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

if input_vector[0] != 0
image_xscale = sign(input_vector[0]);