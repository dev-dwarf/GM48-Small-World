/// @description
if (other.state != enemyStates.dead) {
	other.hp--;	
	instance_create_layer(x,y,layer,oBDeath);
	instance_destroy();
}

