if (keyboard_check_pressed(ord("M"))) && (weatherchange == weatherChangeAmount) && (global.debugMode) && (!global.inConsole){
	wch = true;
	global.prevweather = global.weather;
	global.weather++;
	if global.weather > 1{
		global.weather = 0;	
	}
}
if (wch){
	weatherchange--;
	if (weatherchange <= 0){
		wch = false;
		weatherchange = weatherChangeAmount;
	}
}

global.windStr = clamp(global.windStr, 0, 100);

if (keyboard_check(ord("J"))) && (global.debugMode) && (!global.inConsole){
	global.windStr--;	
}
if (keyboard_check(ord("K"))) && (global.debugMode) && (!global.inConsole){
	global.windStr++;	
}