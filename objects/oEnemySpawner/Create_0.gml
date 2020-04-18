/// @description

difficulty = 4.0 + 3.0 * top;
last_difficulty = difficulty;

timer[oEnemy] = irandom(20);
cooldown[oEnemy] = 60;

timer[oFlyingEnemy] = irandom(20);
cooldown[oFlyingEnemy] = 240;