/// @description
if (other.state != enemyStates.dead) {
	other.hp--;	
	instance_create_layer(x,y,"Bullets",oBDeath);
	instance_destroy();
}

