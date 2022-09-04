if !(obj_weather.weatherchange < obj_weather.weatherChangeAmount){
	rot += (rotval * timescale);
}


if keyboard_check(vk_left) && (global.debugMode) && (!global.inConsole){
	rot -= 0.5;	
}
if keyboard_check(vk_right) && (global.debugMode) && (!global.inConsole){
	rot += 0.5;
}


if rot < 0{rot = 360;}
if rot > 360{rot = 0;}

global.daycycletime = abs(rot)/360;