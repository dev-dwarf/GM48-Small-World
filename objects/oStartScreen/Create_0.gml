/// @description
state = startScreenMenus.main;
selected = 0;
gamepad_cooldown = 0;
max_selected[startScreenMenus.main] = 3;
max_selected[startScreenMenus.options] = 5;

//file_delete(program_directory + "configuration.json");
if (file_exists(program_directory + "configuration.json")) { //if config exists load it
	options = ds_map_secure_load(program_directory + "configuration.json")
	
} else { //else create it
	options = ds_map_create();
	
#region main
if (global.skip_tutorial) {
	options[? "0.0.text"] = "PLAY"
	options[? "0.1.text"] = "TUTORIAL"
			   
} else {	  
	options[? "0.0.text"] = "TUTORIAL"	
	options[? "0.1.text"] = "PLAY"
			   
}			   
	options[? "0.2.text"] = "OPTIONS"
	options[? "0.3.text"] = "EXIT"
	
	options[? "0.0.type"] = guiTypes.button;
	options[? "0.1.type"] = guiTypes.button;
	options[? "0.2.type"] = guiTypes.button;
	options[? "0.3.type"] = guiTypes.button;

	
#endregion

#region options
	options[? "1.0.text"] = "BACK"
	options[? "1.1.text"] = "MUSIC"
	options[? "1.2.text"] = "SFX"
	options[? "1.3.text"] = "SHAKE"
	options[? "1.4.text"] = "AUTO-CLICK"
	options[? "1.5.text"] = "FULLSCREEN"
	//options[? "1.5.text"] = "SHADERS"
	
	options[? "1.0.type"] = guiTypes.button;
	options[? "1.1.type"] = guiTypes.slider;
	options[? "1.2.type"] = guiTypes.slider;
	options[? "1.3.type"] = guiTypes.slider;
	options[? "1.4.type"] = guiTypes.checkbox;
	options[? "1.5.type"] = guiTypes.checkbox;
	
	options[? "1.0.value"] = 1.0;
	options[? "1.1.value"] = 0.7;
	options[? "1.2.value"] = 1.0;
	options[? "1.3.value"] = 0.6;
	options[? "1.4.value"] = false;
	options[? "1.5.value"] = true;
	//options[? "1.5.type"] = guiTypes.checkbox;
#endregion 

	ds_map_secure_save(options, program_directory+"configuration.json"); //and save for next time
}

global.music_volume = options[? "1.1.value"];
global.sfx_volume = options[? "1.2.value"];
global.screenshake_volume = options[? "1.3.value"];
global.auto_click = options[? "1.4.value"];
global.fullscreen = options[? "1.5.value"];

// create font
fTextB = font_add_sprite_ext(sTextB,"ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",false,0)
scale = 1;
robot_orange = make_color_rgb(240,181,65);

enum startScreenMenus {
	main,
	options,
}

enum guiTypes {
	button,
	slider,
	checkbox
}

text_surface = noone;