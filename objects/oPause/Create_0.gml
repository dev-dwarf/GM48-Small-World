// Pause
paused = false;
screenShot = -1;
textpart = ""
charcount = 0

fTextB = font_add_sprite_ext(sTextB,"ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",false,0)

options = ds_map_secure_load(program_directory + "configuration.json")
global.music_volume = options[? "1.1.value"];
global.sfx_volume = options[? "1.2.value"];
global.screenshake_volume = options[? "1.3.value"];
global.auto_click = options[? "1.4.value"];
global.fullscreen = options[? "1.5.value"];

state = startScreenMenus.options;
selected = 0;
gamepad_cooldown = 0;
max_selected[startScreenMenus.main] = 3;
max_selected[startScreenMenus.options] = 5;
fTextB = font_add_sprite_ext(sTextB,"ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",false,0)
scale = 1;
robot_orange = make_color_rgb(240,181,65);
slider_step = 0.05;
text_surface = noone;