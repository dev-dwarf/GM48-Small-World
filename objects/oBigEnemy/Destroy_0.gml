/// @description

for (var i = 0; i < 2; i++) {
	var inst = instance_create_layer(x, y, layer, oGibs) 
	with inst {
		sprite_index = other.gibs_sprite;
		image_index  = irandom(8);
		image_blend = other.image_blend;
		move_speed = irandom_range(2, 4);
		z = irandom_range(14, 16);
		move_direction = irandom(360);
	}
}


var snd = play_sound(sndGetVolts, 2, false, 2.0, 0.15);
audio_sound_gain(snd, 0.7 * audio_sound_get_gain(snd) * global.sfx_volume, 0);
	
repeat(3) {
	instance_create_layer(x +irandom(10)-5,y +irandom(10)-5,global.fx_layer, oPowerParticle);
}