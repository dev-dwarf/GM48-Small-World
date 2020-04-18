//Collis
if ds_list_find_index(hitobj, other) != -1
{
	exit;
}

other.flash = 7;
other.scale = 0.6;
other.hp -= damage;
other.state = enemyStates.stun;
other.stun_timer = 2;
oCamera.screenshake += 0.16;

ds_list_add(hitobj, other);

var dir = image_angle;
var knockback = 8;

if (other.hp <= 0) {
	knockback += 4;
	other.knockup = 16;	
	other.max_knockup = 16;
	other.death_speed = 8;
	other.move_direction = image_angle;
}

with other { move(8, dir) }

if (!moved_camera) {
	oCamera.x += lengthdir_x(3, image_angle);
	oCamera.y += lengthdir_y(3, image_angle);
	sleep(40);
	moved_camera = true;
}