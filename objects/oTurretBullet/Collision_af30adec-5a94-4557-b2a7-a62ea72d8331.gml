/// @description
if (other.state == enemyStates.dead) {
	exit;
}
if (instance_count < 50)
	instance_create_layer(x,y,layer,oBDeath);
instance_destroy();

other.flash = 7;
other.scale = 0.6;
other.hp -= 4;
if (other.state != enemyStates.dead)
	other.state = enemyStates.stun;
other.stun_timer = 3;
oCamera.screenshake += 0.02;

var dir = image_angle;
var knockback = 8;

if (other.object_index == oBigEnemy) knockback = 4;

if (other.object_index == oWisp) knockback += 16;

if (other.hp <= 0) {
	knockback += 4;
	other.knockup = 16;	
	other.max_knockup = 16;
	other.death_speed = 8;
	other.move_direction = image_angle;
}

with other { move(knockback, dir) }