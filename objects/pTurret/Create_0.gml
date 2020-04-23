/// @description

// Inherit the parent event
event_inherited();
hp = 3;
on_list = false;

if (place_meeting(x,y, pSolid) or place_meeting(x,y, oDoor) or place_meeting(x,y,oPowerGenerator)) {
	y += 6;
	
	if (place_meeting(x,y, pSolid) or place_meeting(x,y, oDoor) or place_meeting(x,y,oPowerGenerator)) {
		oWrench.turret_obj = object_index;
		instance_destroy(id, false);
	}
} else {
	
	alarm[4] = 1;
}

mask_index = sTurretHitmask;

// TODO: electricity trap "turret" that does DoT to enemies that walk over it

// TODO?: unlockable player characters?
// TODO: redo sprites for crafting and powerup stations
// TODO: add sounds for crafting and powerup stations
// TODO: transitions between screens, instead of a direct cut

//  sfx, music and screenshake sliders. also maybe a shader option ---> done
//  better enemy spawns ---> done
//  title screen ---> done
//  shells that come out of turrets when they fire ---> done
//  make global draw object, to optimize flash shader so as to break draw batch less ---> done