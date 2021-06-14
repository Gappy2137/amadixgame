event_inherited();

if (bounceCount != 0){
	bounce += (pi * bounceSpeed);
	if (bounce > pi){
		bounce -= pi;
		bounceHeight *= 0.6;
		bounceCount--;
	}
	z = sin(bounce) * bounceHeight;
}else{
	z = 0;	
}

pathChange++;
if (pathChange > pathAfter){
	image_alpha -= 1/pathTime;
	if (image_alpha <= 0){
		instance_destroy();	
	}
}

frict = 0.05;
if (z == 0){
	frict = .1;
}

x += lengthdir_x(spd, direction);
y += lengthdir_y(spd, direction);
if (instance_place(x, y, par_collision)){
	spd = 0;
}
spd = max(spd - frict, 0);