/// @description
if (audio_is_playing(sndGameOver)) {
	draw_set_alpha(fade_out_alpha);
	draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
	
	draw_set_alpha(1);
}

draw_set_font(fTextB)

var w_half = global.ideal_width/2
var h_half = global.ideal_height/2



if played_game_over = true 
{
	
	charcount += 0.1

	
	textpart = string_copy(global.points,1, charcount)
	
	
	draw_text(w_half-100,h_half,textpart)
	

}