if (keyboard_check_pressed(ord("M"))) && (weatherchange == weatherChangeAmount){
	wch = true;
	global.weather++;
	if global.weather > 11{
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