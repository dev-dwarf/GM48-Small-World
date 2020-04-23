//Create
delete = 10;
parent = oPlayer;

hitobj = ds_list_create();

moved_camera = false;

//miss_sound = play_sound(sndWrenchMiss, 10, false, 1.3, .1);
hit_sound = play_sound(sndWrenchHit, 10, false, 1.1, .1);
miss_sound = play_sound(sndSlice, 10, false, 1.3, .1);

if (!audio_is_playing(sndGameOver)) {
	audio_sound_gain(hit_sound, 0, 0);
	audio_sound_gain(miss_sound, 0.5 * global.sfx_volume, 0);
}