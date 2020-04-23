/// @description

// Inherit the parent event
event_inherited();

//if (alarm[0] > 0 and active) {
//	active = false;
//	oPowerGenerator.target = noone;	
	
//}

if (alarm[0] > 0) {
	image_speed = 1;
	scale = lerp(scale, 0.85, 0.02);	
} else {
	scale = lerp(scale, 1.0, 0.2);		
}


	//oPowerGenerator.voltage_base_decrease_per_step = 16;
	
	
	
	var price = 2000 + times_rolled * 250;
	
	if (price > oPowerGenerator.max_voltage) instance_destroy();
	
	if (place_meeting(x,y,oPlayerHitbox) and oPowerGenerator.voltage > price and alarm[0] <= 0) {
		//oPowerGenerator.target = id;	
		oPowerGenerator.scale = 0.8;	
		oPowerGenerator.voltage -= price;	
		//oPowerGenerator.target = noone;	
		scale = 0.8;
		
		lever_index = 1;
		
		times_rolled++;
		
		image_speed = 0;
		alarm[0] = 40;
		// play lottery sound effect
		
		if (global.auto_click) {
			oPlayer.alarm[1] += 2;	
		}
	
		
		var effect = irandom(4);
		
		switch effect {
			case 0:
				oPlayer.move_speed_max = approach( oPlayer.move_speed_max, oPlayer.true_max_speed, 0.1);
				drop_index = 0;
				break;
			case 1:
				oPlayer.heal_amount = approach( oPlayer.heal_amount, oPlayer.max_heal_amount, 0.05);
				oPowerGenerator.hp++;
				drop_index = 1;
				break;
			case 2:
				if (!instance_exists(oMiniMe)) {
					// TODO: create particles
					instance_create_layer(x, y + 60, layer, oMiniMe);
				}
				global.max_turrets++;
				drop_index = 2;
				break;
		}
		// TODO: play slot sounds!
	} 
	
	//if !(oPowerGenerator.voltage > price and alarm[0] <= 0) {
	//	active = false;
	//	oPowerGenerator.target = noone;	
	//}
//}
var price = 2000 + times_rolled * 250;
	if (oPowerGenerator.voltage > price and alarm[0] <= 0) {
		image_blend = c_white;
		drop_index+=0.2
		drop_index = wrap(drop_index, 0, 2.9);
	} else {
		image_blend = c_gray;	
	}