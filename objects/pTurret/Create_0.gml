/// @description

// Inherit the parent event
event_inherited();

if (place_meeting(x,y, pSolid) or place_meeting(x,y, oDoor) or place_meeting(x,y,oPowerGenerator)) {
	
	oWrench.turret_obj = object_index;
	instance_destroy(id, false);
}