function scr_obj_add_depth(){
	with (obj_depthsort){
		if (!ds_exists(ds_depthgrid, ds_type_grid)){
			ds_depthgrid = ds_grid_create(2, 1);	
			
			ds_depthgrid[# 0, 0] = other;
			
			ds_depthgrid[# 0, 1] = other.y + other.zaxis + other.yorigin;
			
		}else{
			var heightgrid = ds_grid_height(ds_depthgrid);
			ds_grid_resize(ds_depthgrid, 2, heightgrid + 1);
			
			ds_depthgrid[# 0, heightgrid] = other;
			
			ds_depthgrid[# 1, heightgrid] = other.y + other.zaxis + other.yorigin;
		}
	}
}