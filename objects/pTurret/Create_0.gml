/// @description

// Inherit the parent event
event_inherited();
hp = 3;

if (place_meeting(x,y, pSolid) or place_meeting(x,y, oDoor) or place_meeting(x,y,oPowerGenerator)) {
	
	oWrench.turret_obj = object_index;
	instance_destroy(id, false);
} else {
	alarm[4] = 1;
}

mask_index = sTurretHitmask;

// TODO: electricity trap "turret" that does DoT to enemies that walk over it
// TODO: force field powerup that protects the generator from damage, and kills enemies that hit it
// TODO: sfx, music and screenshake sliders. also maybe a shader option
// TODO: make blood shiny and reflective?
// TODO: better enemy spawns
// TODO: title screen