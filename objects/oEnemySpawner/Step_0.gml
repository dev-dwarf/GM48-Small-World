/// @description
difficulty += 0.004;

if (top and oPowerGenerator.too_easy < 0.7) {
	exit;
}

//log(string(id) + "difficulty: " + string(difficulty));

if (floor(difficulty) == ceil(last_difficulty)) {
	switch(floor(difficulty)) {
		default:
			cooldown[oFlyingEnemy] = 65 * 16/ difficulty;
			cooldown[oEnemy] = 66 * 16/ difficulty;
		break;
		case 8:
			cooldown[oFlyingEnemy] = 120;
			cooldown[oEnemy] = 46;
			break;
		case 7:
			cooldown[oFlyingEnemy] = 200;
			cooldown[oEnemy] = 46;
			break;
		case 5:
			cooldown[oEnemy] = 44;
			break;
		case 3:
			cooldown[oEnemy] = 52;
			break;
		case 1:
			cooldown[oEnemy] = 55;
			break;
		case 0:

		break;
	}
}
last_difficulty = difficulty;

if (global.spawn_enemies) {
	switch(floor(difficulty)) {
		default:
			if (timer[oFlyingEnemy] <= 0) {
				timer[oFlyingEnemy] = (cooldown[oFlyingEnemy] + choose(-2, 4) - oPowerGenerator.too_easy * 4)/max(1.0, difficulty/15);
				
				if (chance(30)) {
					difficulty += 0.06;
					instance_create_layer(x,y+irandom_range(-8, 8),layer,oFlyingEnemy);
				}
			} else {
				timer[oFlyingEnemy] -= 1;
			}
			
			if (timer[oEnemy] <= 0) {
				timer[oEnemy] = (cooldown[oEnemy] + choose(-2, 4) - oPowerGenerator.too_easy * 5)/max(1.0, difficulty/15);
				
				if (chance(100)) {
					difficulty += 0.02;
					instance_create_layer(x,y+irandom_range(-8, 8),layer,oEnemy);
					
					if (chance(40)) { //double up
						instance_create_layer(x,y+irandom_range(-8, 8),layer,oEnemy);
					}
				}
				
				if (chance(10)) timer[oEnemy] += irandom(100) + 60;
			} else {
				timer[oEnemy] -= 1;
			}
			
			if (timer[oWisp] <= 0) {
				timer[oWisp] = (cooldown[oWisp] + choose(-2, 4) - oPowerGenerator.too_easy * 5)/max(1.0, difficulty/15);
				
				if (chance(70)) {
					difficulty += 0.03;
					instance_create_layer(x,y+irandom_range(-8, 8),layer,oWisp);

				}
				
				if (chance(10)) timer[oWisp] += irandom(100) + 60;
			} else {
				timer[oWisp] -= 1;
			}
			
			if (timer[oBigEnemy] <= 0) {
				timer[oBigEnemy] = (cooldown[oWisp] + choose(-2, 4) - oPowerGenerator.too_easy * 5)/max(1.0, difficulty/15);
				
				if (chance(70)) {
					difficulty += 0.03;
					instance_create_layer(x,y+irandom_range(-8, 8),layer,oBigEnemy);

				}
				
				if (chance(10)) timer[oBigEnemy] += irandom(100) + 60;
			} else {
				timer[oBigEnemy] -= 1;
			}
			break;
		case 16: oPowerGenerator.too_easy = 1.0;	
		case 11: case 12: case 13: case 14: case 15:
		case 10: case 9: oPowerGenerator.too_easy = max(0.2, oPowerGenerator.too_easy);
			if (timer[oWisp] <= 0) {
				timer[oWisp] = cooldown[oWisp] + choose(-2, 4) - oPowerGenerator.too_easy * 5;
				
				if (chance(40)) {
					difficulty += 0.03;
					instance_create_layer(x,y+irandom_range(-8, 8),layer,oWisp);

				}
				
				if (chance(10)) timer[oWisp] += irandom(100) + 60;
			} else {
				timer[oWisp] -= 1;
			}
		case 8: case 7:
		case 6:
			if (timer[oFlyingEnemy] <= 0) {
				timer[oFlyingEnemy] = cooldown[oFlyingEnemy] + choose(-2, 4) - oPowerGenerator.too_easy * 4;
				
				if (chance(25)) {
					difficulty += 0.06;
					instance_create_layer(x,y+irandom_range(-8, 8),layer,oFlyingEnemy);
				}
			} else {
				timer[oFlyingEnemy] -= 1;
			}
			
			if (timer[oEnemy] <= 0) {
				timer[oEnemy] = cooldown[oEnemy] + choose(-2, 4) - oPowerGenerator.too_easy * 5;
				
				if (chance(85)) {
					difficulty += 0.02;
					instance_create_layer(x,y+irandom_range(-8, 8),layer,oEnemy);
					
					if (chance(20)) { //double up
						instance_create_layer(x,y+irandom_range(-8, 8),layer,oEnemy);
					}
				}
				
				if (chance(10)) timer[oEnemy] += irandom(100) + 60;
			} else {
				timer[oEnemy] -= 1;
			}
			
			break;
		case 4: case 5: 
			if (timer[oEnemy] <= 0) {
				timer[oEnemy] = cooldown[oEnemy] + choose(-2, 4) - oPowerGenerator.too_easy * 5;
				
				if (chance(75)) {
					difficulty += 0.02;
					instance_create_layer(x,y+irandom_range(-8, 8),layer,oEnemy);
					
					if (chance(20)) { //double up
						instance_create_layer(x,y+irandom_range(-8, 8),layer,oEnemy);
					}
				}
				
				if (chance(10)) timer[oEnemy] += irandom(100) + 60;
			} else {
				timer[oEnemy] -= 1;
			}
			break;
		case 1: case 2: case 3: 
		case 0:
			if (timer[oEnemy] <= 0) {
				timer[oEnemy] = cooldown[oEnemy] + choose(-2, 4) - oPowerGenerator.too_easy * 10;
				
				if (chance(60)) {
					difficulty += 0.04;
					instance_create_layer(x,y+irandom_range(-8, 8),layer,oEnemy);
				}
			} else {
				timer[oEnemy] -= 1;
			}
	}
}