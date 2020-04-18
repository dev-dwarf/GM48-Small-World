/// @description

// Inherit the parent event
event_inherited();

if (active) {
	oPowerGenerator.voltage_base_decrease_per_step = 16;
	
	image_speed = 1;
	
	if (place_meeting(x,y,oPlayerHitbox) and scale == 1.0) {
		oPowerGenerator.target = id;	
		oPowerGenerator.scale = 0.8;	
		oPowerGenerator.voltage -= 2000;	
		oPowerGenerator.target = noone;	
		scale = 0.8;
		
		image_speed = 0;
		// play lottery sound effect
		
		var rand = random(1); var total = 0;
		for (var i = 0; i < 5; i++) {
			total += possible_drops[i, 1];
			if (rand >= total) {
				oWrench.turret_obj = possible_drops[i, 0];
				break;	
			}
		}
	}
}
