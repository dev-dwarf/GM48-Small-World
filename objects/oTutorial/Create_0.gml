/// @description
tutorial_event = 0;
var gamepad = gamepad_is_connected(0)
if gamepad {
	tutorial_event_text[0, 0] = "USE LEFT JOYSTICK TO MOVE,";
	tutorial_event_text[0, 1] = "AND RIGHT TRIGGER OR X TO ATTACK";
	prompt_text = "ATTACK TO CONTINUE";
	second_prompt = "LEFT TRIGGER OR B"
} else {
	tutorial_event_text[0, 0] = "USE WASD TO MOVE,";
	tutorial_event_text[0, 1] = "AND LEFT MOUSE TO ATTACK";
	prompt_text = "ATTACK TO CONTINUE";
	second_prompt = "RIGHT MOUSE"

}
	tutorial_event_text[1, 0] = "ATTACK A TURRET TO GIVE IT POWER"
	tutorial_event_text[1, 1] = ""
	
	tutorial_event_text[2, 0] = "PRESS " + second_prompt
	tutorial_event_text[2, 1] = "TO DISCONNECT POWER"
	
	tutorial_event_text[3, 0] = "ATTACK THE GENERATOR TO CONNECT TO";
	tutorial_event_text[3, 1] = "GATES THAT STOP ENEMIES SPAWNING";
						
	tutorial_event_text[4, 0] = "DEFEAT ENEMIES TO GAIN POWER."
	tutorial_event_text[4, 1] = "BREAK CORPSES FOR A BONUS"
						
	tutorial_event_text[5, 0] = "SPEND POWER TO GET TURRETS FROM ,"
	tutorial_event_text[5, 1] = "THE MACHINE ON THE RIGHT"
						
	tutorial_event_text[6, 0] = "SPEND POWER TO GET UPGRADES FROM ,"
	tutorial_event_text[6, 1] = "THE MACHINE ON THE LEFT"
						
	tutorial_event_text[7, 0] = "GETTING UPGRADES OR TURRETS";
	tutorial_event_text[7, 1] = "DISCONNECTS YOUR TURRETS";
	
	tutorial_event_text[8, 0] = "READY TO PLAY?";
	tutorial_event_text[8, 1] = prompt_text;
	
fTextS = font_add_sprite_ext(sTextS,"ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890?",false,0)

add_prompt_alarm = 80;
scale = 0.0;

if (global.skip_tutorial) room_goto_next();