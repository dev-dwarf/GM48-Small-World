if other.state != enemyStates.dead and object_index != oFlyingEnemy and object_index != oWisp
{
	move(other.knockback,point_direction(x,y,other.x,other.y));
}