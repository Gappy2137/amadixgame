
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
	blizzard = 11,
}

enum biome{
	plains = 0,
	forest = 1,
	bog = 2,
}

enum humidity{
	low = 0,
	medium = 1,
	high = 2,
}

enum wind{
	none = 0,
	light = 1,
	moderate = 2,
	strong = 3,
	gale = 4,
}
enum wind_dir{
	right = 0,
	left = 180,
}

global.fog = false;
global.weather = weather.sun;
global.biome = biome.plains;
global.humidity = humidity.medium;
global.wind = wind.none;
global.temperature = 23;
global.inside = false;
global.cave = false;
weatherchange = 200;
wch = false;
alarm[0] = 1;