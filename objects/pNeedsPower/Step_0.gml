/// @description
if (place_meeting(x,y,oPlayerHitbox)) {
	oPowerGenerator.target = id;	
	oPowerGenerator.scale = 0.8;	
	//scale = 0.8;
}

if (oPowerGenerator.target == id) {
	active = true;
} else {
	active = false;	
}

scale = lerp(scale, 1.0, 0.2);