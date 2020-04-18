/// @description
scale = lerp(scale, 1.0, 0.2);

if (hp <= 0) {
	oPowerGenerator.voltage = clamp(oPowerGenerator.voltage + abs(max_hp * move_speed_max * damage * 200) + 100 * ignores_turrets, 0, oPowerGenerator.max_voltage);
	
	if (state != enemyStates.dead) {
		state = enemyStates.dead;
		hp = max_hp/2;
		dead_timer = 120;
	} else {
		instance_destroy();	
	}
}