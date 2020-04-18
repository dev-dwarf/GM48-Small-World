x = oPlayer.x
y = oPlayer.y

//key_swing = mouse_check_button(mb_left)

//if key_swing and offset = goal and delay <= 0
//{
//	swung = true
//	delay = 15

//	if offset = 20
//	{
//		image_xscale = -1
//		goal = 90
//		xscale = -1
//	}
//	else
//	{
//		image_xscale = 1
//		goal = 20
//		xscale = 1
//	}
//	with instance_create_layer(x,y,"instances",oPlayerHitbox)
//	{
//		damage = .25
//		image_yscale = other.xscale
//		image_angle = point_direction(x,y,mouse_x,mouse_y)
		
//	}


//}

if (alarm[2] <= 0) {
	image_angle = angle_lerp(image_angle, oPlayer.move_direction - 60 * image_yscale, 0.2);
}