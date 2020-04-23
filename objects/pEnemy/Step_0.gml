/// @description
scale = lerp(scale, 1.0, 0.2);

if (hp <= 0) {
	image_xscale = choose(1,-1)
	oPowerGenerator.voltage = clamp(oPowerGenerator.voltage + abs(max_hp * move_speed_max * damage *  200) + 50 * ignores_turrets, 0, oPowerGenerator.max_voltage);
	if (audio_is_playing(sndGameOver)) {
		global.points += abs(max_hp * move_speed_max * damage *  5) + 5 * ignores_turrets;
	}
	hp--;
	
	if (state != enemyStates.dead and dead_timer == 0) {			
		state = enemyStates.dead;
		var snd = play_sound(sndGetVolts, 2, false, 2.0, 0.3);
		audio_sound_gain(snd, 0.2* audio_sound_get_gain(snd) * global.sfx_volume, 0);
		var _layer = global.fx_layer;
		repeat(5) {
			instance_create_layer(x +irandom(16)-8,y +irandom(16)-8,_layer, oPowerParticle);
		}
		hp = 1;
		dead_timer = 1000;
	} else {
		instance_destroy();	
	}
}

if (flash > 0 and !on_list) {
	if (!on_list) {
		on_list = true;
		ds_list_add(oFlashDrawer.flash_list, id);
	}
	flash--;
}


alarm[10] = 400;
