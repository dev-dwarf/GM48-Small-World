if other.state != enemyStates.dead
{
x += lengthdir_x(other.knockback,point_direction(x,y,other.x,other.y))
y += lengthdir_y(other.knockback,point_direction(x,y,other.x,other.y))
}