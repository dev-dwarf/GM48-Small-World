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

global.part_system_above = part_system_create()
global.part_system_below = part_system_create()

part_system_depth(global.part_system_above, -2000 );
part_system_depth(global.part_system_below, -900 );

global.fullscreen = true;

randomize();

resize_window();


global.dust_up_particle = part_type_create();

part_type_sprite(global.dust_up_particle, sCircleParticle, true, true, true);
part_type_size(global.dust_up_particle, 0.2, 0.225, -0.01, 0.06);
part_type_direction(global.dust_up_particle , 45, 125, 0, 3);
part_type_speed(global.dust_up_particle, 1.5, 1.8, -0.1, 0.05);
part_type_life(global.dust_up_particle, 8, 12);
part_type_gravity(global.dust_up_particle, 0.002, 270);