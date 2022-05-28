
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
global.windStr = 0;
global.windDir = -1;
global.temperature = 23;
global.inside = false;
global.cave = false;

weatherChangeAmount = 500;
weatherchange = weatherChangeAmount;
wch = false;
alarm[0] = 1;