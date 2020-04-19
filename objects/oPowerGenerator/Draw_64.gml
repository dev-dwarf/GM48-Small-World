/// @description
if (audio_is_playing(sndGameOver)) {
	draw_set_alpha(fade_out_alpha);
	draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
	
	draw_set_alpha(1);
}