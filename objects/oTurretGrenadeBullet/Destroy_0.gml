/// @description
var boom = instance_create_layer(x,y,layer,oBoom);
play_sound(sndBoom, 5, false, 1.0, 0.02);
oCamera.screenshake += 0.02
boom.parent = pTurret;
boom.damage = 3.0;