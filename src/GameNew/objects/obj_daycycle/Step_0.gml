var time = global.daycycletime;

var wthr = global.weather;
var hour = floor(time * 24);

key_previous = min(floor(time * number_of_key_times), number_of_key_times - 1);
key_next = (key_previous + 1) mod number_of_key_times;

var lerp_ = (time - key_previous/number_of_key_times) * number_of_key_times;

color_mix = [	lerp(ds_daycycle_info[# wthr, key_previous][| 0], ds_daycycle_info[# wthr, key_next][| 0], lerp_),
				lerp(ds_daycycle_info[# wthr, key_previous][| 1], ds_daycycle_info[# wthr, key_next][| 1], lerp_),
				lerp(ds_daycycle_info[# wthr, key_previous][| 2], ds_daycycle_info[# wthr, key_next][| 2], lerp_)];
				
con_sat_brt_mix = [	lerp(ds_daycycle_info[# wthr, key_previous][| 3], ds_daycycle_info[# wthr, key_next][| 3], lerp_),
					lerp(ds_daycycle_info[# wthr, key_previous][| 4], ds_daycycle_info[# wthr, key_next][| 4], lerp_),
					lerp(ds_daycycle_info[# wthr, key_previous][| 5], ds_daycycle_info[# wthr, key_next][| 5], lerp_),
					lerp(ds_daycycle_info[# wthr, key_previous][| 6], ds_daycycle_info[# wthr, key_next][| 6], lerp_),
					lerp(ds_daycycle_info[# wthr, key_previous][| 7], ds_daycycle_info[# wthr, key_next][| 7], lerp_)];
			
alpha	= clamp(sin((2 * global.daycycletime + 0.5) * 3.14) * 1.6 - 0.1, 0, 1);


/*
color_mix = [ds_daycycle_info[# wthr, hour][| 0]
			,ds_daycycle_info[# wthr, hour][| 1]
			,ds_daycycle_info[# wthr, hour][| 2]
];

con_sat_brt_mix = [ds_daycycle_info[# wthr, hour][| 3]
			      ,ds_daycycle_info[# wthr, hour][| 4]
				  ,ds_daycycle_info[# wthr, hour][| 5]
				  ,ds_daycycle_info[# wthr, hour][| 6]
				  ,ds_daycycle_info[# wthr, hour][| 7]
];
*/
/*
color_mix = [color[0][0], color[0][1], color[0][2]];
con_sat_brt_mix = [con_sat_brt[0][0], con_sat_brt[0][1],
					con_sat_brt[0][2], con_sat_brt[0][3], con_sat_brt[0][4] ];
*/
/*
if (obj_weather.weatherchange < 200){
	//Gladkie przejscie miedzy pogodami
	var srate = 0.075;
	switch global.weather{
		case weather.sun:
			var i = 0;
			repeat(24){
				scr_daycycle_smooth_transition(i, weather.sun, srate);
				i++;
			}
		break;
		case weather.few_clouds:
			var i = 0;
			repeat(24){
				scr_daycycle_smooth_transition(i, weather.few_clouds, srate);
				i++;
			}
		break;
	}
}else{
	alarm[0] = 1;	
}

*/
