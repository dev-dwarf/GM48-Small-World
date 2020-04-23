var keypause = keyboard_check_pressed(vk_escape) or gamepad_button_check_pressed(0, gp_start)
//var keyresume = keyboard_check_pressed(vk_space) or mouse_check_button_pressed(mb_right) or gamepad_button_check_pressed(0, gp_start)

//keyresume = keyresume and !keypause; // added so that same key can be pause and unpause

if (paused) {
	instance_activate_object(oCamera);
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
	} else {
		if (gamepad_cooldown <= 0) {
			input_vector[0] = check(vk_d) - check(vk_a);
			input_vector[1] = check(vk_s) - check(vk_w);
		} else {
			input_vector[0] = false;
			input_vector[1] = false;
			gamepad_cooldown--;	
		}
	
		input_action[0] = mouse_check_button_pressed(mb_left) or check_p(vk_enter);
		input_action[1] = mouse_check_button_pressed(mb_right) or check_p(vk_escape);
	}

	if (input_vector[0] != 0) {
		gamepad_cooldown = 15;
	} 
	
	if (input_vector[1] != 0) {
		play_sound(sndWrenchMiss, 0, false, 1.0, 0.3)
		selected = selected + input_vector[1];
		gamepad_cooldown = 15;
	} 

	selected = wrap(selected, 0, max_selected[state]);
	#endregion
	#region
	switch state {
		case startScreenMenus.main:
		break;
		case startScreenMenus.options:
			if (input_action[0]) {
				play_sound(sndWrenchHit, 0, false, 1.0, 0.2)
			
				switch options[? "1." + string(selected) + ".text"] {
					case "BACK"			: paused = false; selected = 0; 
										  play_sound(sndWrenchMiss, 0, false, 1.4, 0.3);
										  break;
					case "MUSIC"		: options[? "1.1.value"] = 1 - sign(options[? "1.1.value"]); break;
					case "SFX"			: options[? "1.2.value"] = 1 - sign(options[? "1.2.value"]); break;
					case "SHAKE"		: options[? "1.3.value"] = 1 - sign(options[? "1.3.value"]); break;
					case "AUTO-CLICK"	: options[? "1.4.value"] = !options[? "1.4.value"]; break;
					case "FULLSCREEN"	: options[? "1.5.value"] = !options[? "1.5.value"]; break;
				}
			
				oCamera.screenshake = 0.5;
			}
		
			if (input_vector[0] != 0) {
				play_sound(sndPlayerFootstep, 0, false, 1.0, 0.2)
			
				switch options[? "1." + string(selected) + ".text"] {
					case "MUSIC"		: options[? "1.1.value"] += slider_step * sign(input_vector[0]); 
										  options[? "1.1.value"] = clamp(options[? "1.1.value"], 0, 1) 
										  break;
									  
					case "SFX"			: options[? "1.2.value"] += slider_step * sign(input_vector[0]); 
										  options[? "1.2.value"] = clamp(options[? "1.2.value"], 0, 1) 
										  play_sound(sndBasicTurret, 0, false, 1.0, 0.2)
										  break;
									  
					case "SHAKE"		: options[? "1.3.value"] += slider_step * sign(input_vector[0]); 
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
	
	if !paused {
		audio_resume_all()
	    if(sprite_exists(screenShot))
		{
	        sprite_delete(screenShot);
	    }
		charcount = 0
	    instance_activate_all();
	}
	#endregion
} else {
	if !window_has_focus()
	{
		paused = true
	    if(!sprite_exists(screenShot))
		{
	        screenShot = sprite_create_from_surface(application_surface,0,0,view_wport,view_hport,0,0,0,0);    
	    }
	}

	if(keypause and !paused)
	{

	    paused = true;
	    if(!sprite_exists(screenShot))
		{
	        screenShot = sprite_create_from_surface(application_surface,0,0,view_wport,view_hport,0,0,0,0);    
	    }
	}
	if(paused)
	{
		audio_pause_all()
	    instance_deactivate_all(1);
	
		//if (check(vk_escape)) {
		//	//display exit the game prompt	
		//}
	}
	
}

//if keyresume
//{
//    paused = false;
//}

