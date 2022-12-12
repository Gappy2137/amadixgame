scale += 0.015;


if (scale >= 0.5){
	alpha -= 0.01;	
}

if (alpha <= 0){
	instance_destroy();	
}