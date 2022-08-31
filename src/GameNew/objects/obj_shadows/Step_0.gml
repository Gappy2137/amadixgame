if (keyboard_check(ord("B"))) && (global.debugMode) && (!global.inConsole){
	alpha-=0.01;	
}
if (keyboard_check(ord("N"))) && (global.debugMode) && (!global.inConsole){
	alpha+=0.01;	
}
