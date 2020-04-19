/// @description
tutorial_events = 0;
var gamepad = gamepad_is_connected(0)
if gamepad {
	tutorial_event_text[0] = "Use left joystick to move, and right trigger or X to attack";
	tutorial_event_text[1] = 
} else {
	tutorial_event_text[0] = "Use wasd to move, and left_mouse to attack";
}