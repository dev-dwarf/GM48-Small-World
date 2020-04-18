/// @description

difficulty += 0.001;

log(string(difficulty));

if (global.spawn_enemies) {
	switch(floor(difficulty)) {
		default:
		case 2:
			cooldown[oFlyingEnemy] = 60;

		case 1:
			cooldown[oEnemy] = 30;
			
			if (timer[oFlyingEnemy] == 0) {
				timer[oFlyingEnemy] = cooldown[oFlyingEnemy] + choose(-2, 4);
				
				if (chance(20)) {
					difficulty += 0.003;
					instance_create_layer(x,y,layer,oFlyingEnemy);
				}
			} else {
				timer[oFlyingEnemy] -= 1;
			}
		case 0:
			if (timer[oEnemy] == 0) {
				timer[oEnemy] = cooldown[oEnemy] + choose(-2, 4);
				
				if (chance(50)) {
					difficulty += 0.005;
					instance_create_layer(x,y,layer,oEnemy);
				}
			} else {
				timer[oEnemy] -= 1;
			}
		break;
	}
}