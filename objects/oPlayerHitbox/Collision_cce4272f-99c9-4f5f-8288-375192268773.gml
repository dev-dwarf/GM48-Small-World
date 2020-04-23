//Collis
if ds_list_find_index(hitobj, other) != -1
{
	exit;
}

other.flash = 4;
other.scale = 0.6;
oCamera.screenshake += 0.1;

ds_list_add(hitobj, other);

if (!moved_camera) {
	oCamera.x += lengthdir_x(3, image_angle);
	oCamera.y += lengthdir_y(3, image_angle);
	if (parent == oMiniMe) {
		oWrenchLittle.scale = 0.8;
	} else {
		oWrench.scale = 1.3;
	}
	sleep(40);
	moved_camera = true;
}


if (!audio_is_playing(sndGameOver)) {
	audio_sound_gain(hit_sound, 1 * global.sfx_volume, 0);
	audio_sound_gain(miss_sound, 0, 0);
}
