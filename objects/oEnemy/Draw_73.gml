/// @description
if (zap_self and state == enemyStates.stun) {
	var target_x = oPowerGenerator.x; var target_y = oPowerGenerator.y-51;
	var dist = point_distance(target_x, target_y, x,y); var dir = point_direction(target_x, target_y, x,y);
	var _scale = 1.5;
	var vx = _scale * lengthdir_x(7, dir); var vy = _scale * lengthdir_y(7, dir); 
	for (var i = 0; i < dist/(7*_scale); i++) {
		draw_sprite_ext(sLightning, oPowerGenerator.lightning_index, x + vx * i, y  -51+ vy * i, _scale, _scale * min(1.0, max((16-i)/16, 0.25)), dir + irandom_range(-5, 5), make_color_rgb(0, 205, 249), 0.9);
		draw_sprite_ext(sLightning, oPowerGenerator.lightning_index, x + vx * i, y  -51+ vy * i, _scale, _scale * min(1.0, max((16-i)/16, 0.25)) - 0.1, dir + irandom_range(-5, 5), c_white, 1.0);
					
	}
}