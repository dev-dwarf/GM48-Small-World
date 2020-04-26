/// @description

// Inherit the parent event
//event_inherited();

//if (alarm[0] > 0 and active) {
//	active = false;
//	oPowerGenerator.target = noone;	
	
//}

if (alarm[0] > 0) {
//	image_index = 1;
	scale = lerp(scale, 0.85, 0.02);	
} else {
	scale = lerp(scale, 1.0, 0.2);		
}
	
var price = max(1.0, instance_number(pTurret)/2) * 1000;
	
if (oPowerGenerator.voltage > price and alarm[0] <= 0) {
	if (image_blend != c_white) {
			image_blend = c_white;
			image_index = 1;
			play_sound(sndTurretAcquired, 0, false, 0.7, 0);
		}
	drop_index+=0.2;
	drop_index = wrap(drop_index, 0, 4);
} else {
	image_blend = c_gray;	
	image_index = 0;
}
	
if (place_meeting(x,y,oPlayerHitbox) and oPowerGenerator.voltage > price and alarm[0] <= 0) {
	//oPowerGenerator.target = id;	
	oPowerGenerator.scale = 0.8;	
	oPowerGenerator.voltage -= price;	
	//oPowerGenerator.target = noone;	
	scale = 0.8;
		
	lever_index = 1;
		
	image_index = 0;
	alarm[0] = 40;
	
	if (global.auto_click) {
		oPlayer.alarm[1] += 2;	
	}
	
	// play lottery sound effect
		
	oWrench.turret_obj = choose(oTurret, oLaserTurret, oDoubleTurret, oDoubleLaserTurret);
		
	switch oWrench.turret_obj {
		case	oTurret			: drop_index = 0; break;
		case oLaserTurret		: drop_index = 1;break;
		case oDoubleTurret		: drop_index = 2;break;
		case oDoubleLaserTurret	: drop_index = 3;break;
	}
	// TODO: play slot sounds!
	play_sound(sndTurretAcquired, 0, false, 1.2, 0);
} 
	
if !(oPowerGenerator.voltage > price and alarm[0] <= 0) {
	//active = false;
	//oPowerGenerator.target = noone;	
}
	
	
	

