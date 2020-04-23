/// @description
if (oPowerGenerator.target == object_index) {
	active = true;
} else {
	active = false;	
}

if (active) {
	global.spawn_enemies = false;	
	oPowerGenerator.voltage_base_decrease_per_step = 25;
} else {
	global.spawn_enemies = true;	
}
