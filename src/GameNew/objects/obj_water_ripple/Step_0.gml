scale += 0.05;

var water = instance_place(x, y, obj_shallowwater16);

if (scale >= 1) || (!water){
	alpha -= 0.01;	
}

if (alpha <= 0){
	instance_destroy();	
}