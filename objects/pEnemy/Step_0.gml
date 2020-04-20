/// @description
scale = lerp(scale, 1.0, 0.2);

if (hp <= 0) {
	image_xscale = choose(1,-1)
	oPowerGenerator.voltage = clamp(oPowerGenerator.voltage + abs(max_hp * move_speed_max * damage *  200) + 50 * ignores_turrets, 0, oPowerGenerator.max_voltage);
	hp--;
	
	if (state != enemyStates.dead and dead_timer == 0) {			
		state = enemyStates.dead;
		repeat(5) {
			instance_create_layer(x +irandom(16)-8,y +irandom(16)-8,global.fx_layer, oPowerParticle);
		}
		hp = 1;
		dead_timer = 1000;
	} else {
		instance_destroy();	
	}
}


alarm[10] = 400;
