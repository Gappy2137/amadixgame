
i += 0.1;
if (i >= degtorad(360)){i = 0;}

if (global.alcoholPoisoning >= 10){
	alpha = (global.alcoholPoisoning / 100) - 0.1;
	xx += sin(i);
	yy += cos(i);
}else{
	alpha = 0;
	xx = 0;
	yy = 0;
}

if (keyboard_check(ord("J"))){
	global.alcoholPoisoning--;
}
if (keyboard_check(ord("K"))){
	global.alcoholPoisoning++;
}
