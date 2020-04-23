draw_set_font(fTextB)

if paused = true 
{
	draw_sprite_ext(screenShot,0,0,0,1,1,0,c_white,1);
	draw_set_alpha(.6)
	draw_rectangle_color(1800,1800,-1800,-1800,c_black,c_black,c_black,c_white,false)
	draw_set_alpha(1)
    	
	#region draw menu
	var width = display_get_gui_width();
	var height = display_get_gui_height();

	if (!surface_exists(text_surface)) {
		text_surface = surface_create(width, height);
	}

	if (surface_get_width(text_surface) != width) {
		surface_resize(text_surface, width, height);	
	}

	surface_set_target(text_surface); // set draw target
	draw_clear_alpha(c_white, 0.0); // scurb the surface clean

	var center_x = width/2;
	var center_y = height/2;

	draw_set_font(fTextB);
	draw_set_halign(fa_center);

	var height = 72;
	var xx = center_x;
	var yy = center_y - height * (max_selected[state]/2) // make sure everthings centered

	for (var i = 0; i <= max_selected[state]; i++) {
		var _selected = (i == selected);
		var _scale = scale + 0.1*_selected;
	
		if (state == startScreenMenus.main) {
			var _color = c_white;
			if (_selected) _color = robot_orange;
			draw_text_transformed_color(xx, yy + height * i, options[? string(state) + "." + string(i) + ".text"], 
									_scale, _scale, _selected * sin(current_time * 2 * pi * 0.001) * 5,
									_color, _color, _color, _color, 1.0);
		} else {
			var _color = c_white;
		
			switch options[? "1." + string(i) + ".type"] {
				case guiTypes.button:	var _color_percent = _selected; break;
				case guiTypes.slider:
				case guiTypes.checkbox: var _color_percent = options[? "1."+string(i)+".value"]; _color = robot_orange; break;						  
			}
		
			draw_text_partial_color(xx, yy + height * i, options[? string(state) + "." + string(i) + ".text"], 
									_scale, _scale, _selected * sin(current_time * 2 * pi * 0.001) * 5,
									_color_percent, _color);
		}
		//draw_text_transformed_color(xx, yy + height * i, options[? string(state) + "." + string(i) + ".text"], 
		//							_scale, _scale, _selected * sin(current_time * 2 * pi * 0.001) * 5,
		//							_colour, _colour, _colour, _colour, 1.0);
	}

	surface_reset_target();

	draw_surface(text_surface, 0, 0);
	
	#endregion
}
