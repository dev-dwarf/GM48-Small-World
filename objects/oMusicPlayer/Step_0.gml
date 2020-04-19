/// @description

//set loop state, get other information
#region
var pos = audio_sound_get_track_position(track_id[musRoboLow]);

log(string(pos) + " : " + string(previous_robot_position)); 
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

#region set gains
var fade_speed = 0.02;
if (avg_difficulty <= 20 and robot_loop_count <= 24) {
	gain[musRoboLow	] = 0.6;
	gain[musRoboHigh] = 0;
	
	if (robot_loop_count >= 1) {
		gain[musPrimalDrums] = 1;
	
		if (robot_loop_count mod 8 >= 6) {
			gain[musAdditionalPercussion] = 1;
		
			if (robot_loop_count mod 8 >= 7) {
				gain[musPrimalDrums] = 0;
			}
		} else {
			gain[musAdditionalPercussion] = 0;
		}
	}
	
	#region basics
	

	if (robot_loop_count mod 4 <= 2 and robot_loop_count > 2) {
		gain[musBellsLeft] = 1;
		//log("musBellsLeft");
	} else {
		gain[musBellsLeft] = approach(gain[musBellsLeft], 0, fade_speed);	
	}

	if (robot_loop_count mod 4 > 2 and robot_loop_count > 8) {
		gain[musBellsRight] = 1;
	//	log("musBellsRight");
	} else {
		gain[musBellsRight] = approach(gain[musBellsRight], 0, fade_speed);	
	}
	
	if (generator_hp <= 2) {
		gain[musBellsRight] = 1;
		gain[musBellsLeft] = 1;
	}
	
	if (generator_hp <= 1) {
		gain[musRoboLow	] = 1;
	}	gain[musRoboHigh] = 1;
	
	if (bottom_gate_open or enemies_count > 15 or enemies_near_generator) and robot_loop_count > 2 {
		gain[musDidgeridoo] = approach(gain[musDidgeridoo], 1, fade_speed);
	} else {
		gain[musDidgeridoo] = approach(gain[musDidgeridoo], 0, fade_speed);
	}
	
	if (bottom_gate_open or generator_hp <= 3) and robot_loop_count > 4 {
		gain[musFlutes] = 1;
		gain[musAdditionalPercussion] = 1;
	} else {
		gain[musFlutes] = approach(gain[musFlutes], 0, fade_speed);
	}

#endregion
} else if ((avg_difficulty <= 30 or (robot_loop_count >= 24)) and avg_difficulty <= 50) {	
	gain[musRoboLow	] = approach(gain[musRoboLow ], 0, fade_speed);
	gain[musRoboHigh] = approach(gain[musRoboHigh], 0.8, fade_speed);  
	
	if (robot_loop_count >= 1) {
		gain[musPrimalDrums] = 1;
	
		if (robot_loop_count mod 16 >= 13) {
			gain[musAdditionalPercussion] = 1;
		
			if (robot_loop_count mod 16 >= 15) {
				gain[musPrimalDrums] = 0;
			}
		} else {
			gain[musAdditionalPercussion] = 0;
		}
	}	
	#region basics
	if (robot_loop_count mod 4 <= 2 and robot_loop_count > 2) {
		gain[musBellsLeft] = 1;
		//log("musBellsLeft");
	} else {
		gain[musBellsLeft] = approach(gain[musBellsLeft], 0, fade_speed);	
	}

	if (robot_loop_count mod 4 > 2 and robot_loop_count > 8) {
		gain[musBellsRight] = 1;
		//log("musBellsRight");
	} else {
		gain[musBellsRight] = approach(gain[musBellsRight], 0, fade_speed);	
	}
	
	if (generator_hp <= 2) {
		gain[musBellsRight] = 1;
		gain[musBellsLeft] = 1;
	}
	
	if (generator_hp <= 1) {
		gain[musRoboLow	] = 1;
	}	gain[musRoboHigh] = 1;
	
	if (bottom_gate_open or enemies_count > 15 or enemies_near_generator) and robot_loop_count > 2 {
		gain[musDidgeridoo] = 1;
	} else {
		gain[musDidgeridoo] = approach(gain[musDidgeridoo], 0, fade_speed);
	}
	
	if (bottom_gate_open or generator_hp <= 3) and robot_loop_count > 4 {
		gain[musFlutes] = 1;
		gain[musAdditionalPercussion] = 1;
	} else {
		gain[musFlutes] = approach(gain[musFlutes], 0, fade_speed);
	}

#endregion
} else {
	gain[musRoboLow	] = approach(gain[musRoboLow ],  1.0, fade_speed);
	gain[musRoboHigh] = approach(gain[musRoboHigh],  1.0, fade_speed);  
	
	if (robot_loop_count >= 1) {
		gain[musPrimalDrums] = 1;
		gain[musBellsRight] = 1;
		gain[musBellsLeft] = 1;
	
		if (robot_loop_count mod 16 >= 13) {
			gain[musAdditionalPercussion] = 1;
		
			if (robot_loop_count mod 16 >= 15) {
				gain[musPrimalDrums] = 1;
				gain[musBellsRight] = 0;
				gain[musBellsLeft] = 0;
			}
		} else {
			gain[musAdditionalPercussion] = 0;
		}
	}	
	#region basics		
	if (generator_hp <= 1) {
		gain[musRoboLow	] = 1;
	}	gain[musRoboHigh] = 1;
	
	if (bottom_gate_open or enemies_count > 15 or enemies_near_generator) and robot_loop_count > 2 {
		gain[musDidgeridoo] = 1;
	} else {
		gain[musDidgeridoo] = approach(gain[musDidgeridoo], 0, fade_speed);
	}
	
	if (bottom_gate_open or generator_hp <= 3 or enemies_count > 20) and robot_loop_count > 4 {
		gain[musFlutes] = 1;
		gain[musAdditionalPercussion] = 1;
	} else {
		gain[musFlutes] = approach(gain[musFlutes], 0, fade_speed);
	}

#endregion
}

if (instance_exists(oBigEnemy)) {
	gain[musFlutes] = 1;
}

#endregion


//UPDATE AUDIO GAIN
if (oPowerGenerator.hp <= 0) overall_volume = approach(overall_volume, 0, 0.005);
for (var i = musPrimalDrums; i <= musBellsRight; i++) {
	audio_sound_gain(track_id[i], gain[i]*overall_volume*master_gain[i], 0);	
}