/// @description
voltage -= voltage_decrease_per_step;

scale = lerp(scale, 1.0, 0.1);

if (!instance_exists(target)) {
	target = noone;	
}