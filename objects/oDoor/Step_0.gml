/// @description
if (oPowerGenerator.target == noone and oPowerGenerator.voltage != 0) {
	global.spawn_enemies = false;	
	oPowerGenerator.voltage_base_decrease_per_step = 11;
} else {
	global.spawn_enemies = true;	
}
