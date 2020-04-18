key_swing = mouse_check_button(mb_left)

x = oPlayer.x
y = oPlayer.y

if key_swing and offset = goal and delay <= 0
{
	
	swung = true
	delay = 15

	if offset = 20
	{
		image_xscale = -1
		goal = 90
		xscale = -1
	}
	else
	{
		image_xscale = 1
		goal = 20
		xscale = 1
	}
	with instance_create_layer(x,y,"instances",oPlayerHitbox)
	{
		damage = .25
		image_yscale = other.xscale
		image_angle = point_direction(x,y,mouse_x,mouse_y)
		
	}


}
offset = approach(offset,goal,60)

image_angle = offset + point_direction(x,y,mouse_x,mouse_y)
delay --;