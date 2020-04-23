/// @description
#region input type shit
var input_vector, input_action;

var gamepad = gamepad_is_connected(0);
if (gamepad) {
	gamepad_set_axis_deadzone(0, 0.3);
	if (gamepad_cooldown <= 0) {
		input_vector[0] = sign(gamepad_axis_value(0, gp_axislh));
		input_vector[1] = sign(gamepad_axis_value(0, gp_axislv));
	} else {
		input_vector[0] = false;
		input_vector[1] = false;
		gamepad_cooldown--;	
	}
	
	input_action[0] = gamepad_button_check_pressed(0, gp_face3) or gamepad_button_check_pressed(0, gp_shoulderrb);
	input_action[1] = gamepad_button_check_pressed(0, gp_face2) or gamepad_button_check_pressed(0, gp_shoulderlb);

	if (input_vector[0] != 0) {
		gamepad_cooldown = 15;
	} 
	
	if (input_vector[1] != 0) {
		play_sound(sndWrenchMiss, 0, false, 1.0, 0.3)
		selected = selected + input_vector[1];
		gamepad_cooldown = 15;
	} 
} else {
	input_action[0] = mouse_check_button_pressed(mb_left) or check_p(vk_enter);
	input_action[1] = mouse_check_button_pressed(mb_right) or check_p(vk_escape);
	
	input_vector[0] = check_p(vk_d) - check_p(vk_a);
	input_vector[1] = check_p(vk_s) - check_p(vk_w);
	
	if (input_vector[1] != 0) {
		play_sound(sndWrenchMiss, 0, false, 1.0, 0.3)
		selected += input_vector[1];
	}
}

selected = wrap(selected, 0, max_selected[state]);
	
switch state {
	case startScreenMenus.main:
		if (input_action[0]) {
			play_sound(sndWrenchHit, 0, false, 1.0, 0.2)
			
			switch options[? "0." + string(selected) + ".text"] {
				case "PLAY"		: room_goto(rGameRoom); break;
				case "TUTORIAL"	: room_goto(rTutorialRoom); break;
				case "OPTIONS"	: state = startScreenMenus.options; selected = 0;
								  play_sound(sndWrenchMiss, 0, false, 1.4, 0.3);	
								  break;
								  
				case "EXIT"		: game_end(); break;
			}
		}
	break;
	case startScreenMenus.options:
		if (input_action[0]) {
			play_sound(sndWrenchHit, 0, false, 1.0, 0.2)
			
			switch options[? "1." + string(selected) + ".text"] {
				case "BACK"			: state = startScreenMenus.main; selected = 0; 
									  play_sound(sndWrenchMiss, 0, false, 1.4, 0.3);	
									  break;
				case "MUSIC"		: options[? "1.1.value"] = 1 - sign(options[? "1.1.value"]); break;
				case "SFX"			: options[? "1.2.value"] = 1 - sign(options[? "1.2.value"]); break;
				case "SHAKE"		: options[? "1.3.value"] = 1 - sign(options[? "1.3.value"]); break;
				case "AUTO-CLICK"	: options[? "1.4.value"] = !options[? "1.4.value"]; break;
				case "FULLSCREEN"	: options[? "1.5.value"] = !options[? "1.5.value"]; break;
			}
		}
		
		if (input_vector[0] != 0) {
			play_sound(sndPlayerFootstep, 0, false, 1.0, 0.2)
			
			switch options[? "1." + string(selected) + ".text"] {
				case "MUSIC"		: options[? "1.1.value"] += 0.1 * sign(input_vector[0]); 
									  options[? "1.1.value"] = clamp(options[? "1.1.value"], 0, 1) 
									  break;
									  
				case "SFX"			: options[? "1.2.value"] += 0.1 * sign(input_vector[0]); 
									  options[? "1.2.value"] = clamp(options[? "1.2.value"], 0, 1) 
									  play_sound(sndLaserTurret, 0, false, 1.0, 0.2)
									  break;
									  
				case "SHAKE"		: options[? "1.3.value"] += 0.1 * sign(input_vector[0]); 
									  options[? "1.3.value"] = clamp(options[? "1.3.value"], 0, 1) 
									  oCamera.screenshake = 0.8;
									  break;
									  
			//	case "AUTO-CLICK"	: options[? "1.4.value"] = !options[? "1.4.value"]; break;
			//	case "FULLSCREEN"	: options[? "1.5.value"] = !options[? "1.5.value"]; break;
			}
		}
	break;
}

global.music_volume = options[? "1.1.value"];
global.sfx_volume = options[? "1.2.value"];
global.screenshake_volume = options[? "1.3.value"];
global.auto_click = options[? "1.4.value"];
global.fullscreen = options[? "1.5.value"];

#endregion