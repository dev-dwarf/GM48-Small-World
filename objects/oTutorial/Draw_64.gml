/// @description
if (tutorial_event <= 8) {
	draw_set_font(fTextS);
	draw_set_halign(fa_center);
	
	draw_text_transformed(display_get_gui_width()/2, display_get_gui_height()/3, tutorial_event_text[tutorial_event, 0], scale, scale, 0);
	draw_text_transformed(display_get_gui_width()/2, display_get_gui_height()/3 + 35, tutorial_event_text[tutorial_event, 1], scale, scale, 0);
	
	if (add_prompt_alarm <= 0 and (tutorial_event == 0 or tutorial_event == 4 or tutorial_event == 6)) {
		
		draw_text_transformed(display_get_gui_width()/2, display_get_gui_height()/3 + 80, prompt_text, scale, scale, 0);
	}
	
	
	
	draw_set_halign(fa_left);
}

