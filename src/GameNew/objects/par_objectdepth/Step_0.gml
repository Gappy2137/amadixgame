depth = -(bbox_bottom - (sprite_height - yorigin) + zfloor);


//Z axis
if (object_get_parent(object_index) != (par_grass))
|| (object_get_parent(object_index) != (par_collectible)){
	var zf = instance_place(x, y, par_zfloor);
	if (zf){
		zfloor = zf.zflr;	
	}else{
		zfloor = 0;	
	}
}

