
part_emitter_burst(rain, emitter_rain, part_rain, round(abs(intensity)) );

alarm[0] = 1;
if (global.weather != weather.drizzle){
	alarm[1] = irandom_range(1, 5);
}