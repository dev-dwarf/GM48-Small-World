///@desc play_sound
///@param index
///@param priority
///@param loop?
///@param optional-pitch
///@param optional-variance

var index		= argument[0];
var priority	= argument[1];
var loop		= argument[2];

// play audio
var sound_id = audio_play_sound(index, priority, loop);

//set pitch
if (argument_count > 3) {
	var pitch		= argument[3];
	var variance	= argument[4]; variance = random_range(-variance/2, variance/2);
	
	audio_sound_pitch(sound_id, pitch + variance);
}

// return
return sound_id;
