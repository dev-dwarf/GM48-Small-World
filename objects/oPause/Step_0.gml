keypause = keyboard_check_pressed(vk_escape) or gamepad_button_check_pressed(0, gp_start)
keyresume = keyboard_check_pressed(vk_escape) or keyboard_check_pressed(vk_space) or mouse_check_button_pressed(mb_left) or mouse_check_button_pressed(mb_right) or keyboard_check(ord("A")) or gamepad_button_check_pressed(0, gp_start)

keyresume = keyresume and !keypause; // added so that same key can be pause and unpause

if !window_has_focus()
{
	paused = true
    if(!sprite_exists(screenShot))
	{
        screenShot = sprite_create_from_surface(application_surface,0,0,view_wport,view_hport,0,0,0,0);    
    }
}

if(keypause)
{

    paused = !paused;
    if(!sprite_exists(screenShot))
	{
        screenShot = sprite_create_from_surface(application_surface,0,0,view_wport,view_hport,0,0,0,0);    
    }
}

if keyresume
{
    paused = false;
}

if(paused)
{
	audio_pause_all()
    instance_deactivate_all(1);
}
else
{
	audio_resume_all()
    if(sprite_exists(screenShot))
	{
        sprite_delete(screenShot);
    }
	charcount = 0
    instance_activate_all();
	
	
}
