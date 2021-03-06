/// @description
scale = lerp(scale, 2.0, 0.2);

add_prompt_alarm--;	

switch (tutorial_event) {
	case 0:
		instance_destroy(pTurret, false);
		instance_destroy(pEnemy)
		global.spawn_enemies = false;
		
		if ((gamepad_button_check_pressed(0, gp_face3) or gamepad_button_check_pressed(0, gp_shoulderrb) or mouse_check_button_pressed(mb_left))) {
			if (add_prompt_alarm < 0) {
				tutorial_event++;
				scale = 0.0;
				add_prompt_alarm = 50;
			} else {
				add_prompt_alarm -= 30;
			}
		}		
	break;
	case 1:
		global.spawn_enemies = false;
		if (!instance_exists(pTurret)) {
			
			freebie = instance_create_layer(0, 0, layer, choose(oTurret, oLaserTurret, oDoubleTurret, oDoubleLaserTurret));

			with freebie {
				do {
					x = irandom_range(1 * DEFAULT_WIDTH/4, 3 * DEFAULT_WIDTH/4);
					y = DEFAULT_HEIGHT/2 + irandom_range(-10, 50);
	
				} until !place_meeting(x, y, oPlayer);
				
				active = false;
				oPowerGenerator.target = noone;
			}
		}
		
		
		//if ((gamepad_button_check_pressed(0, gp_face3) or gamepad_button_check_pressed(0, gp_shoulderrb) or mouse_check_button_pressed(mb_left))) {	
			var special_condition = (pTurret.active == true);
			
			if (special_condition) {
				tutorial_event++;
				scale = 0.0;
				add_prompt_alarm = 50;
			} else {
				add_prompt_alarm -= 30;
			}
	//	}
	break;
	case 2:
		global.spawn_enemies = false;
		var special_condition = (oPowerGenerator.target == noone);
			
			if (special_condition) {
				tutorial_event++;
				scale = 0.0;
				add_prompt_alarm = 50;
			//	oPowerGenerator.voltage = 0;
			} else {
				add_prompt_alarm -= 30;
			}
		break;
	case 4:
		global.spawn_enemies = false;
		//if ((gamepad_button_check_pressed(0, gp_face3) or gamepad_button_check_pressed(0, gp_shoulderrb) or mouse_check_button_pressed(mb_left))) {		
			var special_condition = (oPowerGenerator.target == oDoor);
			
			if (special_condition) {
				tutorial_event++;
				scale = 0.0;
				add_prompt_alarm = 50;
			//	oPowerGenerator.voltage = 0;
			} else {
				add_prompt_alarm -= 30;
			}
		//}
	break;
	case 3:
		oPowerGenerator.hp = 1000;
		oPowerGenerator.target = noone;
		global.spawn_enemies = true;
		
	//	if ((gamepad_button_check_pressed(0, gp_face3) or gamepad_button_check_pressed(0, gp_shoulderrb) or mouse_check_button_pressed(mb_left))) {		
		var special_condition = (oPowerGenerator.voltage > 3000);
			
			if (special_condition) {
				tutorial_event++;
				scale = 0.0;
				add_prompt_alarm = 50;
			} else {
				add_prompt_alarm -= 30;
			}
		//}
		break;
	case 5:
	//	instance_destroy(pTurret);
		instance_destroy(pEnemy)
		global.spawn_enemies = false;
		var special_condition = (oCraftingStation.lever_index == 1);
			
			if (special_condition) {
				tutorial_event++;
				scale = 0.0;
				add_prompt_alarm = 50;
			} else {
				add_prompt_alarm -= 30;
			}	
	break;	
	case 6:
		//instance_destroy(pTurret);
		instance_destroy(pEnemy)
		global.spawn_enemies = false;
		var special_condition = (oPowerupStation.lever_index == 1);
			
			if (special_condition) {
				tutorial_event++;
				scale = 0.0;
				add_prompt_alarm = 50;
			} else {
				add_prompt_alarm -= 30;
			}	
	break;	
	//case 7:		
	//	global.spawn_enemies = false;
	//	if ((gamepad_button_check_pressed(0, gp_face3) or gamepad_button_check_pressed(0, gp_shoulderrb) or mouse_check_button_pressed(mb_left))) {
	//		if (add_prompt_alarm < 0) {
	//			tutorial_event++;
	//			scale = 0.0;
	//			add_prompt_alarm = 50;
	//		} else {
	//			add_prompt_alarm -= 30;
	//		}
	//	}		
	//break;	
	case 7:		
		global.spawn_enemies = false;
		if ((gamepad_button_check_pressed(0, gp_face3) or gamepad_button_check_pressed(0, gp_shoulderrb) or mouse_check_button_pressed(mb_left))) {
			if (add_prompt_alarm < 0) {
				tutorial_event++;
				scale = 0.0;
				add_prompt_alarm = 50;
			} else {
				add_prompt_alarm -= 30;
			}
		}		
	break;	
	case 8:
	if (!instance_exists(oScreenTransition)) {
		with instance_create_layer(0, 0, layer, oScreenTransition) {
			target_room = rGameRoom;	
		}
		part_system_clear(global.part_system_permanent);
	}
	break;
		
}

oPowerGenerator.voltage = 3000;