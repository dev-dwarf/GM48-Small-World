/// @desc move()
/// @arg speed
/// @arg direction
 
var spd = argument0;
var dir = argument1;
 
var xtarg = x+lengthdir_x(spd,dir);
var ytarg = y+lengthdir_y(spd,dir);
 
if !place_meeting(xtarg, ytarg, pSolid) {
    x = xtarg;
    y = ytarg;
}
else {
	var xstep = lengthdir_x(1,dir);
	var ystep = lengthdir_y(1,dir);

    for (var i = 0; i < floor(spd); i++) {
		if (!place_meeting(x+xstep, y, pSolid)) {
			x += xstep;
		} else {
			break;	
		}
	}
	
	for (var i = 0; i < floor(spd); i++) {
		if (!place_meeting(x, y+ystep, pSolid)) {
			y += ystep;
		} else {
			break;	
		}
	}
}