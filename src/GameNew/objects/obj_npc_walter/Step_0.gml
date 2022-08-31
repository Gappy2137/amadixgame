// Inherit the parent event
event_inherited();

if (keyboard_check(vk_right)) && (global.debugMode) && (!global.inConsole){
	x++;	
}