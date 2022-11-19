if (keyboard_check_pressed(ord("M"))) && (weatherchange == weatherChangeAmount) && (global.debugMode) && (!global.inConsole){
	wch = true;
	weatherTrigger = true;
	global.prevweather = global.weather;
	global.weather++;
	if global.weather > 4{
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

if (weatherTrigger){
	weather_update();
}