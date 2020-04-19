/// @description

//set loop state, get other information
#region
var pos = audio_sound_get_track_position(track_id[musRoboLow]);

//log(string(pos) + " : " + string(previous_robot_position)); 
if (pos < previous_robot_position) {
	robot_loop_count++;
	//log("loop++ = " + string(robot_loop_count));
}
if (pos > 7.0 and !(previous_robot_position > 7.0)) robot_loop_count++;
previous_robot_position = pos;

var avg_difficulty = 0, bottom_gate_open = false, enemies_count = 0, enemies_near_generator = false, generator_hp, generator_voltage;

generator_hp = oPowerGenerator.hp;
generator_voltage = oPowerGenerator.voltage;

with (oEnemySpawner) {
	if (!top) avg_difficulty += difficulty;
}

avg_difficulty /= 2;
bottom_gate_open = oPowerGenerator.too_easy >= 0.7;

with pEnemy {
	if (state != enemyStates.dead) enemies_count++;
}

with oPowerGenerator {
	if (distance_to_object(instance_nearest(x, y, pEnemy)) < 50) enemies_near_generator = true;	
}

#endregion

var fade_speed = 0.02;
if (avg_difficulty <= 20 and robot_loop_count <= 24) {
	if (robot_loop_count > 1) {
		gain[musFlutes] = 0.4;
	}
	
	if (oTutorial.tutorial_event >= 2) {
		gain[musRoboHigh] = 0.3;
	}
	
	if (oTutorial.tutorial_event > 3) {
		gain[musPrimalDrums] = 0.8;
	}
} 


//UPDATE AUDIO GAIN
if (oPowerGenerator.hp <= 0) overall_volume = approach(overall_volume, 0, 0.005);
for (var i = musPrimalDrums; i <= musBellsRight; i++) {
	audio_sound_gain(track_id[i], gain[i]*overall_volume*master_gain[i], 0);	
}