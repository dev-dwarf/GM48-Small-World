/// @description
difficulty += 0.0005;

log(string(difficulty));

if (floor(difficulty) == ceil(last_difficulty)) {
	switch(floor(difficulty)) {
		default:
		case 8:
			cooldown[oFlyingEnemy] = 120;
			cooldown[oEnemy] = 16;
		case 7:
			cooldown[oFlyingEnemy] = 200;
			cooldown[oEnemy] = 22;
			break;
		case 4:
			cooldown[oEnemy] = 32;
			break;
		case 1:
			cooldown[oEnemy] = 35;
			break;
		case 0:

		break;
	}
}
last_difficulty = difficulty;

if (global.spawn_enemies) {
	switch(floor(difficulty)) {
		default:
		case 8:
		case 6:
			if (timer[oFlyingEnemy] == 0) {
				timer[oFlyingEnemy] = cooldown[oFlyingEnemy] + choose(-2, 4) - oPowerGenerator.too_easy * 8;
				
				if (chance(20)) {
					difficulty += 0.02;
					instance_create_layer(x,y+irandom_range(-8, 8),layer,oFlyingEnemy);
				}
			} else {
				timer[oFlyingEnemy] -= 1;
			}
		case 4: case 5: 
			if (timer[oEnemy] == 0) {
				timer[oEnemy] = cooldown[oEnemy] + choose(-2, 4) - oPowerGenerator.too_easy * 5;
				
				if (chance(75)) {
					difficulty += 0.01;
					instance_create_layer(x,y+irandom_range(-8, 8),layer,oEnemy);
					
					if (chance(20)) { //double up
						instance_create_layer(x,y+irandom_range(-8, 8),layer,oEnemy);
					}
				}
			} else {
				timer[oEnemy] -= 1;
			}
		
		break;
		case 1: case 2: case 3: 
		case 0:
			if (timer[oEnemy] == 0) {
				timer[oEnemy] = cooldown[oEnemy] + choose(-2, 4) - oPowerGenerator.too_easy * 10;
				
				if (chance(60)) {
					difficulty += 0.01;
					instance_create_layer(x,y+irandom_range(-8, 8),layer,oEnemy);
				}
			} else {
				timer[oEnemy] -= 1;
			}
		break;
	}
}