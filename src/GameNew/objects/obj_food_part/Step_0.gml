event_inherited();

image_alpha -= 0.04;

if (!bounce)
	image_angle += rot;

if (image_alpha <= 0){
	instance_destroy();	
}

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
}

frict = .005;
if (z == 0){
	frict = .07;
}

x += lengthdir_x(spd, direction);
y += lengthdir_y(spd, direction);

if (place_meeting(x, y - z, par_collision)){
	frict = 0.02;
	if (bounceCount == 0){
		image_alpha -= 0.1;
		unstuck_me();
	}
}

spd = max(spd - frict, 0);

if (bounceCount < 3){
	yorigin = 3;	
}else{
	yorigin = 10000;
}

zaxis = z;

