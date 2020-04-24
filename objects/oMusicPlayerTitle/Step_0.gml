/// @description

//set loop state, get other information
#region
var pos = audio_sound_get_track_position(track_id[musRoboLow]);

log(string(pos));

//log(string(pos) + " : " + string(previous_robot_position)); 
if (pos < previous_robot_position) {
	robot_loop_count++;
	//log("loop++ = " + string(robot_loop_count));
}
if (pos > 7.0 and !(previous_robot_position > 7.0)) robot_loop_count++;
previous_robot_position = pos;



#endregion

if (oStartScreen.state == startScreenMenus.main) {
	switch oStartScreen.selected {
		case 0: case 1:
			gain[musFlutes] = approach(gain[musFlutes], 0, 0.05);
			gain[musDidgeridoo] = approach(gain[musDidgeridoo], 0, 0.05);
			gain[musBellsLeft] = approach(gain[musBellsLeft], 1.0, 0.05);
			break;
		case 2:
			gain[musFlutes] = approach(gain[musFlutes], 0.5, 0.02);
			gain[musDidgeridoo] = approach(gain[musDidgeridoo], 0, 0.05);
			gain[musBellsLeft] = approach(gain[musBellsLeft], 0, 0.05);
			break;
			
		case 3:
			gain[musDidgeridoo] = approach(gain[musDidgeridoo], 0.5, 0.02);
			gain[musFlutes] = approach(gain[musFlutes], 0, 0.05);
			gain[musBellsLeft] = approach(gain[musBellsLeft], 0, 0.05);
			break;	
	}
	
} else {
	gain[musFlutes] = approach(gain[musFlutes], 1.0, 0.02);
	gain[musDidgeridoo] = approach(gain[musDidgeridoo], 0, 0.05);
}




//UPDATE AUDIO GAIN
if (oPowerGenerator.hp <= 0) overall_volume = approach(overall_volume, 0, 0.005);
for (var i = musPrimalDrums; i <= musBellsRight; i++) {
	audio_sound_gain(track_id[i], gain[i]*global.music_volume * (1 - MUTE_MUSIC) * master_gain[i] * overall_volume, 0);	
}