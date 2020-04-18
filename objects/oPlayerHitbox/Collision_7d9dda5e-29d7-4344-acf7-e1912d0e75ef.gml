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
	oWrench.scale = 1.2;
	sleep(40);
	moved_camera = true;
}

audio_sound_gain(hit_sound, 1, 0);
audio_sound_gain(miss_sound, 0, 0);
