event_inherited();

rot += rotVal;

if (bounceCount != 0){
	bounce += (pi * bounceSpeed);
	if (bounce > pi){
		bounce -= pi;
		bounceHeight *= 0.6;
		bounceCount--;
		rotVal = choose(-16, 16, -6, 6);
	}
	z = sin(bounce) * bounceHeight;
}else{
	rotVal = 0;
	z = 0;	
}

if (height <= 0){
	height = 0;
	acceleration = 0;
}else{
	acceleration += 0.1;
	height -= acceleration;
}
if (acceleration > 9){
	acceleration = 9;
}
if (height == 0){
	grounded = true;	
}else{
	grounded = false;
}

pathChange++;
if (pathChange > pathAfter){
	alpha -= 1/pathTime;
	if (alpha <= 0){
		instance_destroy();	
	}
}

frict = 0.05;
if (z == 0){
	frict = .1;
}



x += lengthdir_x(spd, direction);
y += lengthdir_y(spd, direction);
if (instance_place(x, y - z, par_collision)){
	frict = 0.02;
	if (bounceCount == 0){
		alpha -= 0.1;
		unstuck_me();
	}
}
spd = max(spd - frict, 0);


