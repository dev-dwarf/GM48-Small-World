/// @description
image_xscale = lerp(image_xscale, 0.8, 0.4);
image_yscale = lerp(image_yscale, 0.8, 0.4);

if (floor(image_index) == image_number-1) instance_destroy();