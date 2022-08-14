if (keyboard_check_pressed(ord("M"))) && (weatherchange == weatherChangeAmount){
	wch = true;
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

if (keyboard_check(ord("J"))){
	global.windStr--;	
}
if (keyboard_check(ord("K"))){
	global.windStr++;	
}