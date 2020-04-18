
if (update_pathing <= 0) {
	update_pathing = irandom_range(6, 20);
	target_inst = oPowerGenerator;

	//if (distance_to_object(instance_nearest(x,y,oTurret)) < distance_to_object(target_inst)) {
	//	target_inst = instance_nearest(x,y,oTurret);
	//}

	target_direction = point_direction(x,y,target_inst.x, target_inst.y);

	var look_ahead_range = 54; //path around solid objects
	for (var i = 0; i < 4; i++) {
		if (collision_line(x, y, x + lengthdir_x(look_ahead_range, target_direction), y + lengthdir_y(look_ahead_range, target_direction), pSolid, false, false) == noone) {
		
			break;
		}
	
		target_direction += power(-1, i) * 45 * i;
	}
} else {
	update_pathing--;	
}

if (distance_to_object(target_inst) > attack_range) {
	move_speed = approach(move_speed, move_speed_max, 0.4);
	move_direction = angle_lerp(move_direction, target_direction, 0.2);
	
	move(move_speed, move_direction);
}