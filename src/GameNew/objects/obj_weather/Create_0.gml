
enum weather{
	sun = 0,
	few_clouds = 1,
	cloudy = 2,
	drizzle = 3,
	rain = 4,
	heavy_rain = 5,
	storm_incoming = 6,
	storm = 7,
	heavy_storm = 8,
	lil_snow = 9,
	snow = 10,
	blizzard = 11
}

enum biome{
	plains = 0,
	forest = 1,
	swamp = 2
}

enum humidity{
	low = 0,
	medium = 1,
	high = 2
}


global.fog = false;
global.weather = weather.sun;
global.biome = biome.plains;
global.humidity = humidity.medium;
global.windStr = 16;
global.windDir = -1;
global.temperature = 23;
global.inside = false;
global.cave = false;

global.prevweather = weather.sun;

weatherChangeAmount = 200;
weatherchange = weatherChangeAmount;
wch = false;
weatherTrigger = false;
alarm[0] = 1;

//Wind effects

var i = 0;
repeat(10){
	timer[i] = 0;
	
	curveRotValue[i] = 0;
	curveRot2Value[i] = 0;
	i++;
}

curveSpdValue = 0;

randomWindSpeedArray = [.8, .9, 1.0, 1.1, 1.2, 1.3, 0.88, 1.11, 0.92, 1.06];



windShader = shader_displace;
windDistort_spr = spr_wind_distortion;
windDistort_tex = sprite_get_texture(windDistort_spr, 0);
wind_u_distort_tex = shader_get_sampler_index(windShader, "windDistort_tex");
wind_u_time = shader_get_uniform(windShader, "time");
wind_u_size = shader_get_uniform(windShader, "size");
wind_u_strength = shader_get_uniform(windShader, "strength");