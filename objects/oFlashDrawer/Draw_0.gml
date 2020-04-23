/// @description
shader_set(shFlash);

for (var i =0; i <ds_list_size(flash_list); i++) {
	var inst = flash_list[| i];
	
	if (!instance_exists(inst)) {
		ds_list_delete(flash_list, i);
		continue;
	}
	
	with inst {
		event_perform(ev_draw, 0);	
	}
}

shader_reset();