/// @description
if (hp != 0) {
	if (target != noone and instance_exists(target)) {
		if (target == oDoor) {
				var target_x = 348; target_y = 141;
				var dist = point_distance(x, y-51, target_x,target_y); var dir = point_direction(x, y-51, target_x,target_y);
				var _scale = 1.5 * max(0.2, voltage/max_voltage);
				var vx = _scale * lengthdir_x(7, dir); var vy = _scale * lengthdir_y(7, dir); 
				for (var i = 0; i < dist/(7*_scale); i++) {
					draw_sprite_ext(sLightning, lightning_index, x + vx * i, y -51 + vy * i, _scale, _scale * min(1.0, max((16-i)/16, 0.25)), dir + irandom_range(-5, 5), make_color_rgb(0, 205, 249), 0.9);
					draw_sprite_ext(sLightning, lightning_index, x + vx * i, y  -51+ vy * i, _scale, _scale * min(1.0, max((16-i)/16, 0.25)) - 0.1, dir + irandom_range(-5, 5), c_white, 1.0);
					
				}
				var target_x = 191; target_y = 193;
				var dist = point_distance(x, y-51, target_x,target_y); var dir = point_direction(x, y-51, target_x,target_y);
				var _scale = 1.5 * max(0.2, voltage/max_voltage);
				var vx = _scale * lengthdir_x(7, dir); var vy = _scale * lengthdir_y(7, dir); 
				for (var i = 0; i < dist/(7*_scale); i++) {
					draw_sprite_ext(sLightning, lightning_index, x + vx * i, y -51 + vy * i, _scale, _scale * min(1.0, max((16-i)/16, 0.25)), dir + irandom_range(-5, 5), make_color_rgb(0, 205, 249), 0.9);
					draw_sprite_ext(sLightning, lightning_index, x + vx * i, y  -51+ vy * i, _scale, _scale * min(1.0, max((16-i)/16, 0.25)) - 0.1, dir + irandom_range(-5, 5), c_white, 1.0);
					
				}			
				var target_x = 34; target_y = 141;
				var dist = point_distance(x, y-51, target_x,target_y); var dir = point_direction(x, y-51, target_x,target_y);
				var _scale = 1.5 * max(0.2, voltage/max_voltage);
				var vx = _scale * lengthdir_x(7, dir); var vy = _scale * lengthdir_y(7, dir); 
				for (var i = 0; i < dist/(7*_scale); i++) {
					draw_sprite_ext(sLightning, lightning_index, x + vx * i, y  -51+ vy * i, _scale, _scale * min(1.0, max((16-i)/16, 0.25)), dir + irandom_range(-5, 5), make_color_rgb(0, 205, 249), 0.9);
					draw_sprite_ext(sLightning, lightning_index, x + vx * i, y  -51+ vy * i, _scale, _scale * min(1.0, max((16-i)/16, 0.25)) - 0.1, dir + irandom_range(-5, 5), c_white, 1.0);
					
				}		
		} else {
			with target {
				var dist = point_distance(x,y,other.x, other.y-51); var dir = point_direction(x,y,other.x, other.y-51);
				var _scale = 1.5 * max(0.2, other.voltage/other.max_voltage);
				var vx = _scale * lengthdir_x(7, dir); var vy = _scale * lengthdir_y(7, dir); 
				for (var i = 0; i < dist/(7*_scale); i++) {
					draw_sprite_ext(sLightning, other.lightning_index, x + vx * i, y + vy * i, _scale, _scale * min(1.0, max(i/16, 0.25)), dir + irandom_range(-5, 5), make_color_rgb(0, 205, 249), 0.9);
					draw_sprite_ext(sLightning, other.lightning_index, x + vx * i, y + vy * i, _scale, _scale * min(1.0, max(i/16, 0.25)) - 0.1, dir + irandom_range(-5, 5), c_white, 1.0);
				}
			}
		}	
		
					draw_sprite(sLightnignStart, other.lightning_index, x, y -51);
	}

}
