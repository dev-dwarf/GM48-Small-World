// @description
if (hp < 0) {
	
	instance_destroy();	
}

hp = approach(hp, max_hp, 0.005);

mask_index = sTurretHitmask;

//if (instance_number(pTurret) > global.max_turrets) {
//	var lowest_health = hp/max_hp;
//	var lowest_instance = id;
	
//	with (pTurret) {
//		if hp/max_hp < lowest_health {
//			lowest_health = hp/max_hp;
//			lowest_instance = id;
//		}
//	}
	
//	instance_destroy(lowest_instance);
//}

offset = irandom_range(-4,4)

//if hp <= 3 {
//	if (active) {
//		instance_create_layer(x+offset,y+offset,"Top",oSmoke)
//	} else {
//		if (chance(35)) {
//			instance_create_layer(x+offset,y+offset,"Top",oSmoke);
//		}
//	}
//}

if hp < max_hp {
	var chnce = max(0, (abs(hp - max_hp) - active * 3)) * 30;
	if (chance(chnce)) {
		instance_create_layer(x+offset,y+offset,"Top",oSmoke)
	}
}

if (active) {
	spinoppo += -8
	image_blend = c_white;	
	image_angle += 15;
} else {
	image_blend = c_gray;
	spinoppo += -1
	image_angle += 2;
}

if (flash > 0 and !on_list) {
	if (!on_list) {
		on_list = true;
		ds_list_add(oFlashDrawer.flash_list, id);
	}
	flash--;
}