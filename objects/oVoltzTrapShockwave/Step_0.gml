/// @description
image_xscale = lerp(image_xscale, 1, 0.2);
image_yscale = image_xscale;

if (image_xscale == 1 and alarm[0] <= 0) alarm[0] = 2;