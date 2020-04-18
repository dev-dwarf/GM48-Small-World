/// @description
scale = 1;
flash = 0;
hp = 4;
damage = 1;
move_speed_max =1.0;

ignores_turrets = false;

max_hp = hp;
flash = 0
move_speed = 0;

knockback = -1.2;
stun_timer = 0;
dead_timer = 0;
death_speed = 4;
knockup = 0;

state = enemyStates.target;

enum enemyStates {
	target,
	stun,
	dead
}
