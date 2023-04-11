
depth = -(bbox_bottom - (sprite_height - yorigin) + zaxis);

x += lengthdir_x(spd, angle);
y += lengthdir_y(spd, angle);

var inst = (instance_place(x,y,par_collision));

if (inst){
	if (inst.cancollide){
		if (inst != noone){
			if (variable_instance_exists(inst, "zaxis"))
			&& (variable_instance_exists(inst, "zheight")){
				if (zaxis < inst.zaxis + inst.zheight){
					instance_destroy();
				}
			}
		}
	}
}