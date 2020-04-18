/// @description
voltage = approach(voltage, 0, voltage_decrease_per_step);

scale = lerp(scale, 1.0, 0.1);

if (!instance_exists(target)) {
	target = noone;	
}

if (place_meeting(x,y,oPlayerHitbox)) {
	target = noone;
	scale = 0.8;
	oCamera.screenshake += 0.04;
	with (oPlayerHitbox) {
		audio_sound_gain(hit_sound, 1, 0);
		audio_sound_gain(miss_sound, 0, 0);	
	}
}