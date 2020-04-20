/// @description x, y -51
x = lerp(x, oPowerGenerator.x + irandom_range(-2,2), lerp_speed);
y = lerp(y, oPowerGenerator.y-51 + irandom_range(-2,2), lerp_speed);

image_xscale = lerp(image_xscale, 0.9, .2);
image_yscale = image_xscale;

lerp_speed = approach(lerp_speed, 0.2, 0.75);

image_angle += image_dir;