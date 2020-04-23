/// @description

audio_stop_all();

priority[musPrimalDrums				 ] = 4;
priority[musDidgeridoo				 ] = 5;
priority[musBellsLeft				 ] = 3;
priority[musAdditionalPercussion	 ] = 2;
priority[musRoboLow					 ] = 0;
priority[musRoboHigh				 ] = 0;
priority[musFlutes					 ] = 4;
priority[musBellsRight				 ] = 4;

track_id[musPrimalDrums			 ] = play_sound(musPrimalDrums			, priority[musPrimalDrums			] , true);
track_id[musDidgeridoo			 ] = play_sound(musDidgeridoo			, priority[musDidgeridoo			] , true);
track_id[musBellsLeft			 ] = play_sound(musBellsLeft			, priority[musBellsLeft				] , true);
track_id[musAdditionalPercussion ] = play_sound(musAdditionalPercussion	, priority[musAdditionalPercussion  ] , true);
track_id[musRoboLow				 ] = play_sound(musRoboLow				, priority[musRoboLow			    ] , true);
track_id[musRoboHigh			 ] = play_sound(musRoboHigh				, priority[musRoboHigh				] , true);
track_id[musFlutes				 ] = play_sound(musFlutes				, priority[musFlutes				] , true);
track_id[musBellsRight			 ] = play_sound(musBellsRight			, priority[musBellsRight			] , true);

gain[musPrimalDrums				 ] = 0;
gain[musDidgeridoo				 ] = 0;
gain[musBellsLeft				 ] = 0;
gain[musAdditionalPercussion	 ] = 0.5;
gain[musRoboLow					 ] = 0;
gain[musRoboHigh				 ] = 0;
gain[musFlutes					 ] = 0;
gain[musBellsRight				 ] = 0;

master_gain[musPrimalDrums				 ] = 0.7;
master_gain[musDidgeridoo				 ] = 1;
master_gain[musBellsLeft				 ] = 0.8;
master_gain[musAdditionalPercussion		 ] = 1;
master_gain[musRoboLow					 ] = 0.40;
master_gain[musRoboHigh					 ] = 0.38;
master_gain[musFlutes					 ] = 0.8;
master_gain[musBellsRight				 ] = 0.8;

for (var i = musPrimalDrums; i <= musBellsRight; i++) {
	audio_sound_gain(track_id[i], gain[i], 0);	
}

previous_robot_position = 0;
robot_loop_count = 0;
overall_volume = 1.0;