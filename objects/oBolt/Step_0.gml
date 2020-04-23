instance_create_layer(x,y,"Bullets",oSmoke2)
//instance_create_layer(x,y,"Bullets",oSplat)

x += lengthdir_x(spd,dir)
y += lengthdir_y(spd,dir)
image_alpha = dir

if (instance_place(x,y,oPlayerHitbox)) instance_destroy();