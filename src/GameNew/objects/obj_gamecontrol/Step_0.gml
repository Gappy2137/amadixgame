//global.daycycletime += 0.00001;
if global.daycycletime < 0{global.daycycletime = 1;}
if global.daycycletime > 1{global.daycycletime = 0;}
global.daycycletime = clamp(global.daycycletime, 0, 1);

var time = global.daycycletime;
var hour		= string_format(floor(time * 24), 0, 0);
hour			= (string_length(hour) == 1) ? "0" + hour : hour;
var minute		= string_format(time * 24 * 59.5 mod 59.5, 0, 0);
minute			= (string_length(minute) == 1) ? "0" + minute : minute;

hours = hour;
minutes = minute;



if (global.alcoholPoisoning > global.maxAlcoholPoisoning){
	global.alcoholPoisoning = global.maxAlcoholPoisoning;
}

global.alcoholPoisoning = lerp(global.alcoholPoisoning, 0, 0.0001);
