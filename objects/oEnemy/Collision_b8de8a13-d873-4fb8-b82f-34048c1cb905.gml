/// @description
log("collided");
//var collision_direction = point_direction(x,y, oPlayer.x, oPlayer.y);

//var player_knockback_vector;
//player_knockback_vector[0] = lengthdir_x(oPlayer.knockback, oPlayer.knockback_direction);
//player_knockback_vector[1] = lengthdir_y(oPlayer.knockback, oPlayer.knockback_direction);

//var knockback_vector;
//knockback_vector[0] = lengthdir_x(knockback, collision_direction);
//knockback_vector[1] = lengthdir_y(knockback, collision_direction);


//oPlayer.knockback = point_distance(0,0, 
//								(player_knockback_vector[0] * knockback_vector[0])/2,
//								(player_knockback_vector[1] * knockback_vector[1])/2);
								
//oPlayer.knockback_direction = point_direction(0,0, 
//								(player_knockback_vector[0] * knockback_vector[0])/2,
//								(player_knockback_vector[1] * knockback_vector[1])/2);			

other.x += lengthdir_x(knockback, point_direction(x,y,oPlayer.x,oPlayer.y));
other.y += lengthdir_y(knockback, point_direction(x,y,oPlayer.x,oPlayer.y));
