draw_self();

if flash > 0{

	flash --;
	shader_set(shFlash);
	draw_self();
	shader_reset();
}
