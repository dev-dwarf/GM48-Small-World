/// @description
var boom = instance_create_layer(x,y,layer,oBoom);
play_sound(sndGrenadeTurretExplode, 5, false, 1.0, 0.02);
boom.parent = pTurret;