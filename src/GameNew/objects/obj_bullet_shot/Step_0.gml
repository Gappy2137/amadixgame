
x += lengthdir_x(spd, angle);
y += lengthdir_y(spd, angle);

var inst = (instance_place(x,y,par_collision));

if (inst){
	if (inst.cancollide){
		if (zaxis < inst.zfloor + inst.zheight){
			instance_destroy();
		}
	}
}



event_inherited();
