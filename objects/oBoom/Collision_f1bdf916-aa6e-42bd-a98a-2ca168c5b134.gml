/// @description
//Collis
if ds_list_find_index(hitobj, other) != -1
{
	exit;
}

other.flash = 7;
other.scale = 0.6;
other.hp -= 2;
if (other.state != enemyStates.dead)
other.state = enemyStates.stun;
other.stun_timer = 3;
oCamera.screenshake += 0.16;

ds_list_add(hitobj, other);

var dir = point_direction(x,y,other.x,other.y);
var knockback = 8;

if (other.hp <= 0) {
	knockback += 4;
	other.knockup = 16;	
	other.max_knockup = 16;
	other.death_speed = 8;
	other.move_direction = dir;
}

with other { move(8, dir) }
