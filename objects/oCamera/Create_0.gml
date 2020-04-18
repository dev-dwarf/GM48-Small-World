/// @description
x = 0; y = 0;
view_enabled = true;
view_visible[0] = true;
cam = camera_create_view(0, 0, DEFAULT_WIDTH, DEFAULT_HEIGHT, 0, -1, -1, -1, DEFAULT_WIDTH, DEFAULT_HEIGHT);
view_camera[0] = cam;

#region screenshake
screenshake = 0.0;
screenshake_intensity = 7.50;
screenshake_decrease_per_step = 0.07;
#endregion

global.fx_layer = layer_create(-3000);
global.fullscreen = true;

randomize();

resize_window();