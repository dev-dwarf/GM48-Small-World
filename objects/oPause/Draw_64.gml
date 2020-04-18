draw_set_font(fTextB)

var w_half = global.ideal_width/2
var h_half = global.ideal_height/2



if paused = true 
{
	draw_sprite_ext(screenShot,0,0,0,1,1,0,c_white,1);
	draw_set_alpha(.6)
	draw_rectangle_color(1800,1800,-1800,-1800,c_black,c_black,c_black,c_white,false)
	draw_set_alpha(1)
    
	
	charcount += 0.8
	wav = "PAUSED"
	var stringleng = string_length(wav)
	
	textpart = string_copy(wav,1, charcount)
	
	
	draw_text(w_half-(stringleng*16),h_half,textpart)
	

}
