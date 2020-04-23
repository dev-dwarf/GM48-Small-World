/// @description
difficulty += 0.0023;

if (top and oPowerGenerator.too_easy < 0.7) {
	exit;
}

//log(string(id) + "difficulty: " + string(difficulty));

if (floor(difficulty) == ceil(last_difficulty)) {
	switch(floor(difficulty)) {
		default:
		if (difficulty >= 16) {
			cooldown[oFlyingEnemy] = 100 * 16/ difficulty;
			cooldown[oEnemy] = 66 * 16/ difficulty;
			cooldown[oWisp] = 80 * 16/difficulty;
		}
		break;
		case 8: 
			cooldown[oFlyingEnemy] = 120;
			cooldown[oEnemy] = 46;
			break;
		case 7: case 6:
			cooldown[oFlyingEnemy] = 300;
			cooldown[oEnemy] = 46;
			break;
		case 5: case 4:
			cooldown[oEnemy] = 44;
			break;
		case 3: case 2:
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
		if (timer[0] > 0) {
			timer[0]--;
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
					var inst = instance_create_layer(x,y+irandom_range(-8, 8),layer,oEnemy);
					inst.move_speed_max = min(0.4 * difficulty/16, 0.8);
					if (chance(40)) { //double up
						var inst = instance_create_layer(x,y+irandom_range(-8, 8),layer,oEnemy);
						inst.move_speed_max = min(0.4 * difficulty/16, 0.8);
					}
				}
				
				
				
				if (chance(10)) timer[oEnemy] += irandom(100) + 60;
			} else {
				timer[oEnemy] -= 1;
			}
			
			if (timer[oWisp] <= 0 and top) {
				timer[oWisp] = (cooldown[oWisp] + choose(-2, 4) - oPowerGenerator.too_easy * 5)/max(1.0, difficulty/15);
				
				if (chance(50)) {
					difficulty += 0.03;
					instance_create_layer(x,y+irandom_range(-8, 8),layer,oWisp);

				}
				
				if (chance(10)) timer[oWisp] += irandom(100) + 60;
			} else {
				timer[oWisp] -= 1;
			}
			
			if (timer[oBigEnemy] <= 0 and !top and !instance_exists(oBigEnemy)) {
				timer[oBigEnemy] = cooldown[oBigEnemy] * (difficulty/30)
				
				if (chance(100)) {
					difficulty += 0.03;
					instance_create_layer(x,y+irandom_range(-8, 8),layer,oBigEnemy);

				}
				
				if (chance(10)) timer[oBigEnemy] += irandom(100) + 60;
			} else {
				timer[oBigEnemy] -= 1;
			}
		} else {
			timer[1]--;
			if (timer[1] <= 0) {
				timer[1] = 500;
				timer[0] = 60 * 3 * difficulty;
			}
		}
			break;
		case 17: case 18: case 19: case 20:
			timer[0]--;
			if (timer[oFlyingEnemy] <= 0) {
				timer[oFlyingEnemy] = (cooldown[oFlyingEnemy] + choose(-2, 4) - oPowerGenerator.too_easy * 4)/max(1.0, difficulty/15);
				
				if (chance(28)) {
					difficulty += 0.06;
					instance_create_layer(x,y+irandom_range(-8, 8),layer,oFlyingEnemy);
				}
			} else {
				timer[oFlyingEnemy] -= 1;
			}
			
			if (timer[oEnemy] <= 0) {
				timer[oEnemy] = (cooldown[oEnemy] + choose(-2, 4) - oPowerGenerator.too_easy * 5)/max(1.0, difficulty/15);
				
				if (chance(90)) {
					difficulty += 0.02;
					var inst = instance_create_layer(x,y+irandom_range(-8, 8),layer,oEnemy);
					inst.move_speed_max = min(0.4 * difficulty/16, 0.8);
					if (chance(40)) { //double up
						var inst = instance_create_layer(x,y+irandom_range(-8, 8),layer,oEnemy);
						inst.move_speed_max = min(0.4 * difficulty/16, 0.8);
					}
				}
				
				
				
				if (chance(10)) timer[oEnemy] += irandom(100) + 60;
			} else {
				timer[oEnemy] -= 1;
			}
			
			if (timer[oWisp] <= 0 and top) {
				timer[oWisp] = (cooldown[oWisp] + choose(-2, 4) - oPowerGenerator.too_easy * 5)/max(1.0, difficulty/15);
				
				if (chance(45)) {
					difficulty += 0.03;
					instance_create_layer(x,y+irandom_range(-8, 8),layer,oWisp);

				}
				
				if (chance(2)) {
					instance_create_layer(x,y+irandom_range(-8, 8),layer,oBigEnemy);
				}
				
				if (chance(10)) timer[oWisp] += irandom(100) + 60;
			} else {
				timer[oWisp] -= 1;
			}
		
		break;
		case 16: oPowerGenerator.too_easy = 1.0;	
		case 11: case 12: case 13: case 14: case 15:
		case 10: case 9: oPowerGenerator.too_easy = max(0.2, oPowerGenerator.too_easy);
			if (timer[oWisp] <= 0 and !instance_exists(oWisp)) {
				timer[oWisp] = cooldown[oWisp] + choose(-2, 4) - oPowerGenerator.too_easy * 5;
				
				if (chance(10)) {
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
				
				if (chance(2)) {
					instance_create_layer(x,y+irandom_range(-8, 8),layer,oWisp);	
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
					difficulty += 0.01;
					instance_create_layer(x,y+irandom_range(-8, 8),layer,oEnemy);
					
					if (chance(20)) { //double up
						instance_create_layer(x,y+irandom_range(-8, 8),layer,oEnemy);
					}
				}
				
				if (chance(1)) {
					instance_create_layer(x,y+irandom_range(-8, 8),layer,oFlyingEnemy);
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
					difficulty += 0.01;
					instance_create_layer(x,y+irandom_range(-8, 8),layer,oEnemy);
				}
			} else {
				timer[oEnemy] -= 1;
			}
	}
}