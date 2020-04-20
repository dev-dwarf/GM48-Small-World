/// @description

difficulty = 3.0 * top;
last_difficulty = difficulty;

timer[oEnemy] = irandom(20);
cooldown[oEnemy] = 60;

timer[oFlyingEnemy] = irandom(20);
cooldown[oFlyingEnemy] = 240;

timer[oWisp] = irandom(20);
cooldown[oWisp] = 500;

timer[oBigEnemy] = irandom(20);
cooldown[oBigEnemy] = 1000;