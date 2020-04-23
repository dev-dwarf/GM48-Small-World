if (x < 0 or x > room_width or y > room_height) exit;

if other.state != enemyStates.dead and object_index != oFlyingEnemy and object_index != oWisp and object_index != oBigEnemy
{
	move(other.knockback,point_direction(x,y,other.x,other.y));
}