/// @description
var boom = instance_create_layer(x,y,layer,oBoom);
play_sound(choose(sndBoom,sndBoom2), 10, false, 1.0, .1)
boom.parent = pTurret;