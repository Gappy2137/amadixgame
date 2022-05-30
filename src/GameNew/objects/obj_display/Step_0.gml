if(keyboard_check_pressed(ord("Z"))) && (obj_inputmanager.inputPriority != 3)
{
	zoomtrigger = true;
	window_size++;
  
	if(window_size > max_window_size){
		window_size = 1;
		window_set_fullscreen(false);
	}
	
	if (window_size == 4){
		window_set_fullscreen(true);
		window_set_size(ideal_width*window_size,ideal_height*window_size);
		surface_resize(application_surface,ideal_width*window_size,ideal_height*window_size);
		window_center();
	}else{
		window_set_fullscreen(false);
		window_set_size(ideal_width*window_size,ideal_height*window_size);
		surface_resize(application_surface,ideal_width*window_size,ideal_height*window_size);
		window_center();
	}
}

zoomtrigger = false;
	
if instance_number(obj_camera) > 1{
	instance_destroy(obj_camera);
	if instance_exists(obj_amadix){
		instance_create_layer(obj_amadix.x,obj_amadix.y,"Important",obj_camera);
	}else{
		instance_create_layer(0,0,"Important",obj_camera);
	}
}