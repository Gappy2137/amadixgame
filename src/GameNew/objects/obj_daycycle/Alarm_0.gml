if obj_weather.weatherchange == 200{
switch global.weather{
	case weather.sun:
		var i = 0;
		repeat(24){
			scr_daycycle_smooth_transition(i, weather.sun, 1);
			i++;
		}
	break;
	case weather.few_clouds:
		var i = 0;
		repeat(24){
			scr_set_daycycle(i, weather.few_clouds);
			i++;
		}
	break;
}
}