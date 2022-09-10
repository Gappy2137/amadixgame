
i += 0.1;
if (i >= degtorad(360)){i = 0;}

if (global.alcoholPoisoning >= 5){
	alpha = (global.alcoholPoisoning / 100) - 0.2;
	xx += sin(i) / (4/obj_display.window_size);
	yy += cos(i) / (4/obj_display.window_size);
}else{
	alpha = 0;
	xx = 0;
	yy = 0;
}