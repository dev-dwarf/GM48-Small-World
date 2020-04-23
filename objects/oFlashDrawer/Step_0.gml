/// @description
for (var i =0; i <ds_list_size(flash_list); i++) {
	var inst = flash_list[| i];
	
	if (is_undefined(inst) or !instance_exists(inst)) {
		ds_list_delete(flash_list, i);
		continue
	}
	
	if (inst.flash <= 0) {
		ds_list_delete(flash_list, i);
		inst.visible = true;
		inst.on_list = false;
		log("removed element");
		continue;
	} else {
		inst.flash--;	
	}
	
	inst.visible = false;
}