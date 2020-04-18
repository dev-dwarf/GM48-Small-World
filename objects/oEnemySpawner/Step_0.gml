/// @description

difficulty += 0.001;

log(string(difficulty));

if (floor(difficulty) == ceil(last_difficulty)) {
	
}
last_difficulty = difficulty;

if (global.spawn_enemies) {
	switch(floor(difficulty)) {
		default:
		case 8:
			cooldown[oFlyingEnemy] = 180;

		case 6:
			cooldown[oEnemy] = 20;
			
			if (timer[oFlyingEnemy] == 0) {
				timer[oFlyingEnemy] = cooldown[oFlyingEnemy] + choose(-2, 4);
				
				if (chance(20)) {
					difficulty += 0.003;
					instance_create_layer(x,y+irandom_range(-8, 8),layer,oFlyingEnemy);
				}
			} else {
				timer[oFlyingEnemy] -= 1;
			}
		case 1:
			
		case 0:
			if (timer[oEnemy] == 0) {
				timer[oEnemy] = cooldown[oEnemy] + choose(-2, 4);
				
				if (chance(50)) {
					difficulty += 0.005;
					instance_create_layer(x,y+irandom_range(-8, 8),layer,oEnemy);
				}
			} else {
				timer[oEnemy] -= 1;
			}
		break;
	}
}