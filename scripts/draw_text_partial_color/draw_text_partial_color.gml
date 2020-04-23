///@desc draw_text_partial_color
///@param x
///@param y
///@param string
///@param x_scale
///@param y_scale
///@param angle
///@param colored_percent
///@param color

/// NOTE: THIS SCRIPT BREAKS THE DRAW BATCH
// also it should only be used to draw to transparent surface

// this scripts colors a percent of text, by drawing a colored rectangle mask over it using blendmodes

var xx				  = argument[0];
var yy				  = argument[1];
var str				  = argument[2];
var x_scale			  = argument[3];
var y_scale			  = argument[4];
var angle			  = argument[5];
var colored_percent	  = argument[6];
var color			  = argument[7];

draw_text_transformed(xx, yy, str, x_scale, y_scale, angle);

if (colored_percent == 0) exit;

// some quick maffs to make sure the mask always encapsulates the text, even as it rotates
var angle = abs(angle);
var width = string_width(str) * x_scale;
var height = string_height(str) * y_scale;

var new_width  = width  * dcos(angle) + height * dsin(angle) + string_width("M") * x_scale;
var new_height = height * dcos(angle) + width  * dsin(angle);


draw_set_color(color);
gpu_set_blendmode_ext(bm_dest_color, bm_zero); //comment out to view shape of masking rectangle

switch draw_get_halign() {
	case fa_center: draw_rectangle(xx - new_width/2, yy - new_height/2, xx - new_width/2 + new_width * colored_percent, yy + new_height/2, false);
}

draw_set_color(c_white);
gpu_set_blendmode(bm_normal);