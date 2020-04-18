/// @description
if (place_meeting(x,y,oPlayerHitbox)) {
	oPowerGenerator.target = object_index;	
	oPowerGenerator.scale = 0.8;	
	//scale = 0.8;
}

if (oPowerGenerator.target == object_index) {
	active = true;
} else {
	active = false;	
}

scale = lerp(scale, 1.0, 0.2);