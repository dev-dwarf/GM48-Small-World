/// @description

// Inherit the parent event
event_inherited();

if (place_meeting(x,y, pSolid)) {
	
	oWrench.turret_obj = object_index;
	instance_destroy(id, false);
}