//Create
delete = 10;

hitobj = ds_list_create();

moved_camera = false;

miss_sound = play_sound(sndWrenchMiss, 10, false, 1.0, .1);
hit_sound = play_sound(sndWrenchHit, 10, false, 1.0, .1);
//audio_sound_gain(hit_sound, 0, 0);