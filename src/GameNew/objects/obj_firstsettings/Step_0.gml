if instance_number(obj_camera) > 1{
	instance_destroy(obj_camera);
	if instance_exists(obj_amadix){
		instance_create_layer(obj_amadix.x,obj_amadix.y,"Important",obj_camera);
	}else{
		instance_create_layer(0,0,"Important",obj_camera);
	}
}