dir = parent.aim

image_angle = dir
image_xscale = parent.length

x = parent.x+lengthdir_x(9,dir)
y = parent.y+lengthdir_y(9,dir)


instance_create_layer(parent.x,parent.y,"Instances",oSparks)

