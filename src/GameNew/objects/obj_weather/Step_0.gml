
//Wind

var curveAsset = curve_wind_anim;
var curveSpdPos = (global.windStr/100);

var curveSpdStruct = animcurve_get(curveAsset);
var curveSpdChannel = animcurve_get_channel(curveSpdStruct, "spd");

var curveRotStruct = animcurve_get(curveAsset);
var curveRotChannel = animcurve_get_channel(curveRotStruct, "rot");


var curveRot2Struct = animcurve_get(curveAsset);
var curveRot2Channel = animcurve_get_channel(curveRot2Struct, "rot2");

var i = 0;
repeat(10){
	timer[i] += 0.01 * randomWindSpeedArray[i];
	if (timer[i] >= 1){
		timer[i] = 0;
	}
	
	curveRotValue[i] = animcurve_channel_evaluate(curveRotChannel, timer[i]);
	curveRot2Value[i] = animcurve_channel_evaluate(curveRot2Channel, timer[i]);

	i++;
}

curveSpdValue = animcurve_channel_evaluate(curveSpdChannel, (global.windStr/100));



//


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


//DEBUG
if (keyboard_check_pressed(ord("M"))) && (weatherchange == weatherChangeAmount) && (global.debugMode) && (!global.inConsole){
	wch = true;
	weatherTrigger = true;
	global.prevweather = global.weather;
	global.weather++;
	if global.weather > 4{
		global.weather = 0;	
	}
}
if (keyboard_check_pressed(ord("N"))) && (weatherchange == weatherChangeAmount) && (global.debugMode) && (!global.inConsole){
	wch = true;
	weatherTrigger = true;
	global.prevweather = global.weather;
	global.weather--;
	if global.weather < 0{
		global.weather = 4;	
	}
}
