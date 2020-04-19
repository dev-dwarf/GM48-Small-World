/// @description
scale = lerp(scale, 1.0, 0.2);

if (hp <= 0) {
	image_xscale = choose(1,-1)
	oPowerGenerator.voltage = clamp(oPowerGenerator.voltage + abs(max_hp * move_speed_max * damage *  200) + 50 * ignores_turrets, 0, oPowerGenerator.max_voltage);
	hp--;
	
	if (state != enemyStates.dead and dead_timer == 0) {	
		for (var i = 0; i < 2; i++) {
			var inst = instance_create_layer(x, y, layer, oGibs) 
			with inst {
				sprite_index = other.gibs_sprite;
				image_index  = irandom(8);
				move_speed = irandom_range(2, 4);
				z = irandom_range(14, 16);
				move_direction = irandom(360);
			}
		}
		
		state = enemyStates.dead;
		hp = 1;
		dead_timer = 1000;
	} else {
		instance_destroy();	
	}
}
