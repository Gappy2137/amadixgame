if !(obj_weather.weatherchange < obj_weather.weatherChangeAmount){
	rot += (rotval * timescale);
}

if rot < 0{rot = 360;}
if rot > 360{rot = 0;}

global.daycycletime = abs(rot)/360;