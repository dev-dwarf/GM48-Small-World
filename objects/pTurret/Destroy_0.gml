/// @description
for (var i = 0; i < 2; i++) {
	var inst = instance_create_layer(x, y, layer, oGibs) 
	with inst {
		sprite_index = sTurretGibs;
		image_index  = irandom(8);
		image_blend = c_gray;
		move_speed = irandom_range(3, 4);
		z = irandom_range(14, 16);
		move_direction = irandom(360);
	}
}

var boom = instance_create_layer(x,y,layer,oBoom);
play_sound(choose(sndBoom,sndBoom2), 10, false, 1.0, .1)
boom.parent = pTurret;