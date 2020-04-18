//randomize()
//surface_resize(application_surface,DEFAULT_WIDTH,DEFAULT_HEIGHT);
//display_set_gui_size(DEFAULT_WIDTH,DEFAULT_HEIGHT);
//
//if (global.fullscreen) {
//	var scale = display_get_width()/DEFAULT_WIDTH;
//	display_set_gui_size(display_get_width(),display_get_height());
//	window_set_rectangle(0, 0, display_get_width(),display_get_height());
//} else {
//	var scale = 3;
//	
//	var xx = (display_get_width()  - DEFAULT_WIDTH  * scale) / 2; //get centered coords
//	var yy = (display_get_height() - DEFAULT_HEIGHT * scale) / 2;
//	
//	display_set_gui_size(DEFAULT_WIDTH*scale,DEFAULT_HEIGHT*scale);
//	window_set_rectangle(xx, yy, DEFAULT_WIDTH*scale,DEFAULT_HEIGHT*scale);
//}
//
//global.gui_scale = scale;