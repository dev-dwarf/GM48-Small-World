/// @description
for (var i = 0; i < 2; i++) {
	var inst = instance_create_layer(x, y, layer, oGibs) 
	with inst {
		sprite_index = other.gibs_sprite;
		image_index  = irandom(8);
		image_blend = other.image_blend;
		move_speed = irandom_range(2, 4);
		z = irandom_range(14, 16);
		move_direction = irandom(360);
	}
}