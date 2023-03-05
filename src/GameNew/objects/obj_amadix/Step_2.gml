hsp_prev = hsp;
vsp_prev = vsp;



if (obj_levelcontrol.cave){
	
	lightSource.x = x;
	lightSource.y = y + 16;
	lightSource.image_xscale = 0.75;
	lightSource.image_yscale = 0.75;

}else{

	lightSource.x = -16;
	lightSource.y = -16;
	lightSource.image_xscale = 0.01;
	lightSource.image_yscale = 0.01;
	
}

scr_setPlayerFacing();