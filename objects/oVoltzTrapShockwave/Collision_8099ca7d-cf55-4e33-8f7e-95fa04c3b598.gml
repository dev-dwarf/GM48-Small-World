/// @description
if (other.state == enemyStates.dead or other.flash > 0) {
	exit;
}

other.flash = 4;
other.scale = 0.6;
other.hp -= 0.25;
oCamera.screenshake += 0.01;

if (other.hp <= 0) {
	other.knockup = 16;	
	other.max_knockup = 16;
	other.death_speed = 8;
	other.move_direction = image_angle;
}
