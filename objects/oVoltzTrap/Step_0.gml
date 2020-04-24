/// @description

// Inherit the parent event
event_inherited();

scale = lerp(scale, 1.0, 0.2);

if (!instance_exists(shockwave)) shockwave = noone;

if (hp != last_hp or place_meeting(x,y,pEnemy)) and shockwave == noone {
	//create damage bubble
	shockwave = instance_create_layer(x,y,layer,oVoltzTrapShockwave);
	
	last_hp = hp;
}