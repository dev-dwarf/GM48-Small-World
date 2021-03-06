/// @description
lightning_index += 0.3;
if (target != noone) {
	voltage = approach(voltage, 0, voltage_base_decrease_per_step/capacitors);	
}

voltage = clamp(voltage, 0, max_voltage);

if (hp <= 0) {
	if global.points >= global.hscore and room == rGameRoom
	{
		global.hscore = global.points;
		var file = file_text_open_write(SAVE_DIRECTORY);
		file_text_write_real(file, global.hscore)
		file_text_close(file)
	}
	if (!played_game_over) {
		//audio_pause_all();
		play_sound(sndGameOver, 1000, false, 1.0, 0);
		played_game_over = true;
		image_speed = 1;
	}
	
	if (floor(image_index) == image_number-1) image_speed = 0;
		
	flash = (hp * 5) mod 2;
	hp -= 0.1;	
}

if (voltage > (hp-1.8) * 1000) {
	too_easy += 0.001;	

	too_easy = clamp(too_easy, 0, 1);
} else {
	too_easy = 0;	
}

scale = lerp(scale, 1.0 + 0.025 * sin(current_time * 2 * pi * 0.01 * max(1.0, voltage)/max_voltage), 0.5);

if (!instance_exists(target) or voltage == 0) and target != noone {
	target = noone;	
	if (!instance_exists(target))
		if (!audio_is_playing(sndPowerDown))
			play_sound(sndPowerDown, 0, false, 1.0, 0.02);
}

if (place_meeting(x,y,oPlayerHitbox) and alarm[2] <= 0) {
	 alarm[2] = 10;

	target = oDoor;

	scale = 0.8;
	oCamera.screenshake += 0.08;
	with (oPlayerHitbox) {
		audio_sound_gain(hit_sound, 1 * global.sfx_volume, 0);
		audio_sound_gain(miss_sound, 0, 0);	
	}
}

offset = random_range(-6,6)

if hp < max_hp {
	repeat (2) {
		var chnce = max(0, abs(hp - max_hp)) * 30;
		if (chance(chnce)) {
			instance_create_layer(x+offset*2.4,y-20+offset,"Top",oSmoke)
		}
	}
}
if hp > 0
{
	global.points += 1	
}

if (!audio_is_playing(sndGameOver)) {
	played_game_over = false;
} else {
	//var pos = audio_sound_get_track_position(sndGameOver);
	//audio_stop_all();
	//play_sound(sndGameOver, 100, false, 1.0, 0);
	//audio_sound_set_track_position(sndGameOver, pos);
	
	oCamera.screenshake = lerp(oCamera.screenshake, 1.0, 0.8);	
	fade_out_alpha = approach(fade_out_alpha, 1.0, 0.01);
}

if (hp < 0 and !played_game_over) {
	with instance_create_layer(0, 0, layer, oScreenTransition) {
		target_room = room;	
	} 
	part_system_clear(global.part_system_permanent);
	
}


