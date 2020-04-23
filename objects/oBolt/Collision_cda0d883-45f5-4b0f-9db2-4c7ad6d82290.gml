other.hp-=2;
other.flash = 4;
oCamera.screenshake = 0.2;
repeat(6)
{
	var xx = irandom_range(5,-5)
	var yy = irandom_range(5,-5)
	instance_create_layer(x+xx,y+yy,"Bullets",oSplat1)
}
instance_destroy()