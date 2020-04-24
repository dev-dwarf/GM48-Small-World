/// @description

// Inherit the parent event
if (place_meeting(x,y,oPlayerHitbox) and oPlayerHitbox.parent == oPlayer) {
	oPowerGenerator.target = pTurret;	
	oPowerGenerator.scale = 0.8;	
	//scale = 0.8;
}

if (oPowerGenerator.target == pTurret) {
	active = true;
} else {
	active = false;	
}

scale = lerp(scale, 1.0, 0.2);

if (!instance_exists(shockwave)) shockwave = noone;

var inst = instance_nearest(x,y,pEnemy); 
if (inst != noone and distance_to_object(inst) < 16 and inst.state != enemyStates.dead) and shockwave == noone and active and cooldown <= 0 {
	//create damage bubble
	shockwave = instance_create_layer(x,y,layer,oVoltzTrapShockwave);
	
	hp -= 1;
	last_hp = hp;
	cooldown = 80;
}

if (cooldown > 0) cooldown--;