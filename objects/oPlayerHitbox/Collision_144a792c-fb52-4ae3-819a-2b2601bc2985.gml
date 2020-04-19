//Collis
if ds_list_find_index(hitobj, other) != -1
{
	exit;
}

other.flash = 7;
other.scale = 0.6;
other.hp -= damage;
oCamera.screenshake = 0.1;

ds_list_add(hitobj, other);

var dir = image_angle;
var knockback = 8;

if (other.hp <= 0) {
	knockback += irandom_range(2,4);
	other.knockup = 16;	
	other.max_knockup = 16;
	other.death_speed = 8;
	other.move_direction = image_angle;
} else {
	other.state = enemyStates.stun;
	other.stun_timer = 2;	
}

if (other.object_index == oFlyingEnemy) knockback += 20;

with other { move(knockback, dir) }

if (!moved_camera) {
	oCamera.x += lengthdir_x(3, image_angle);
	oCamera.y += lengthdir_y(3, image_angle);
	oWrench.scale = 1.3;
	sleep(50);
	moved_camera = true;
}

audio_sound_gain(hit_sound, 1, 0);
audio_sound_gain(miss_sound, 0, 0);