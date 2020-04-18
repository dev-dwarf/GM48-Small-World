/// @description

// Inherit the parent event
event_inherited();

if (alarm[0] > 0 and active) {
	active = false;
	oPowerGenerator.target = noone;	
}

if (active) {
	oPowerGenerator.voltage_base_decrease_per_step = 16;
	
	image_speed = 1;
	
	if (place_meeting(x,y,oPlayerHitbox) and oPowerGenerator.voltage > 2000 and alarm[0] <= 0) {
		oPowerGenerator.target = id;	
		oPowerGenerator.scale = 0.8;	
		oPowerGenerator.voltage -= 2000;	
		oPowerGenerator.target = noone;	
		scale = 0.8;
		
		image_speed = 0;
		alarm[0] = 600;
		// play lottery sound effect
		
		oWrench.turret_obj = choose(oTurret, oTurret, oTurret, oTurret, oTurret, oLaserTurret, oDoubleTurret, oDoubleLaserTurret);
	}
}
