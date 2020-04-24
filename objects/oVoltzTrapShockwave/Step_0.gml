/// @description
image_xscale = lerp(image_xscale, 1, 0.15);
image_yscale = image_xscale;

if (image_xscale == 1) instance_destroy();