/// @description
if (hp != 0) {
	if (target != noone and instance_exists(target)) {
		if (target == oDoor) {
			with target {
				draw_line_color(x,y,other.x,other.y, c_blue, c_white);
				var dist = point_distance(x,y,other.x, other.y-51); var dir = point_direction(x,y,other.x, other.y-51);
				var _scale = 1.5 * max(0.2, other.voltage/other.max_voltage);
				var vx = _scale * lengthdir_x(7, dir); var vy = _scale * lengthdir_y(7, dir); 
				for (var i = 0; i < dist/(7*_scale); i++) {
					draw_sprite_ext(sLightning, other.lightning_index, x + vx * i, y + vy * i, _scale, _scale * min(1.0, max(i/16, 0.25)), dir + irandom_range(-10, 10), make_color_rgb(0, 205, 249), 0.9);
					draw_sprite_ext(sLightning, other.lightning_index, x + vx * i, y + vy * i, _scale, _scale * min(1.0, max(i/16, 0.25)) - 0.1, dir + irandom_range(-10, 10), c_white, 1.0);
				}
			}
		} else {
			with target {
				draw_line_color(x,y,other.x,other.y, c_blue, c_white);
				var dist = point_distance(x,y,other.x, other.y-51); var dir = point_direction(x,y,other.x, other.y-51);
				var _scale = 1.5 * max(0.2, other.voltage/other.max_voltage);
				var vx = _scale * lengthdir_x(7, dir); var vy = _scale * lengthdir_y(7, dir); 
				for (var i = 0; i < dist/(7*_scale); i++) {
					draw_sprite_ext(sLightning, other.lightning_index, x + vx * i, y + vy * i, _scale, _scale * min(1.0, max(i/16, 0.25)), dir + irandom_range(-10, 10), make_color_rgb(0, 205, 249), 0.9);
					draw_sprite_ext(sLightning, other.lightning_index, x + vx * i, y + vy * i, _scale, _scale * min(1.0, max(i/16, 0.25)) - 0.1, dir + irandom_range(-10, 10), c_white, 1.0);
				}
			}
		}	
	}
}