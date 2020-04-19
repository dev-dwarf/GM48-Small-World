/// @description
x = 0; y = 0;
view_enabled = true;
view_visible[0] = true;
cam = camera_create_view(0, 0, DEFAULT_WIDTH, DEFAULT_HEIGHT, 0, -1, -1, -1, DEFAULT_WIDTH, DEFAULT_HEIGHT);
view_camera[0] = cam;

show_debug_overlay(true)

#region screenshake
screenshake = 0.0;
screenshake_intensity = 6.50;
screenshake_decrease_per_step = 0.08;
#endregion

global.fx_layer = layer_create(-3000);

global.part_system_above = part_system_create()
global.part_system_below = part_system_create()
global.part_system_permanent = part_system_create()

part_system_depth(global.part_system_above, -2000);
part_system_depth(global.part_system_below, -900 );
part_system_depth(global.part_system_permanent, -770);

part_system_automatic_update(global.part_system_permanent, false);

global.fullscreen = true;

randomize();

resize_window();


global.dust_up_particle = part_type_create();

part_type_sprite(global.dust_up_particle, sCircleParticle, true, true, true);
part_type_size(global.dust_up_particle, 0.2, 0.225, -0.01, 0.06);
part_type_direction(global.dust_up_particle , 45, 125, 0, 3);
part_type_speed(global.dust_up_particle, 2.5, 2.8, -0.17, 0.05);
part_type_life(global.dust_up_particle, 20, 26);
part_type_gravity(global.dust_up_particle, 0.1, 270);

global.blood_particle = part_type_create();
part_type_sprite(global.blood_particle, sBlood, false, false, true);
part_type_orientation(global.blood_particle, 0, 359, 0, 0, 0);
part_type_size(global.blood_particle, 0.95, 1.15, 0, 0);
part_type_color1(global.blood_particle, c_gray);
//part_type_life(global.blood_particle, 500, 520);
part_type_alpha1(global.blood_particle, 1);

fullscr = true