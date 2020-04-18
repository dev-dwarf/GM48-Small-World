x = oPlayer.x
y = oPlayer.y

var target_direction;
if (gamepad_is_connected(0)) {
    target_direction = oPlayer.move_direction;    
} else {
    target_direction = point_direction(x,y,mouse_x, mouse_y);    
}

if (alarm[1] <= 0) {
    image_angle = angle_lerp(image_angle, target_direction + 30 * oWrench.lever_state * -1 * sign(oPlayer.movement_vector[0]), 0.1);
    if ( oPlayer.movement_vector[0] != 0)
        image_yscale = -1 * sign(oPlayer.movement_vector[0]);
} else {
    image_angle = angle_lerp(image_angle, target_angle, 0.7);
}