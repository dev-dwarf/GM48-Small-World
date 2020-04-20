/// @description sleep(ms);
/// @param ms
var t = current_time + argument0;

if (!instance_exists(oCamera)) instance_destroy();

if (oCamera.frames_slept <= 120) {
	while (current_time < t) { /* loop */ }
	oCamera.frames_slept += t;
}