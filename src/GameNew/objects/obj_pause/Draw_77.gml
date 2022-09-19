
gpu_set_blendenable(false);



if (pause){
		surface_set_target(application_surface);
		if (surface_exists(pauseSurf)){
			draw_surface(pauseSurf, 0, 0);	
		}else{
			pauseSurf = surface_create(width, height);
			buffer_set_surface(pauseSurfBuffer, pauseSurf, 0);
		}
		surface_reset_target();
}

if (global.pause){
	if (!pause){
		pause = true;

			
			instance_deactivate_all(true);

			instance_activate_object(obj_amadix);
			instance_activate_object(par_alwaysactive);
			instance_activate_object(par_collectible);
			instance_activate_object(par_light);
			instance_activate_object(par_lightcover);
			instance_activate_object(par_container);
		
			pauseSurf = surface_create(width, height);
			surface_set_target(pauseSurf);
			draw_surface(application_surface, 0, 0);
			surface_reset_target();
		
			if (buffer_exists(pauseSurfBuffer)){
				buffer_delete(pauseSurfBuffer);	
			}else{
				pauseSurfBuffer = buffer_create(width * height * 4, buffer_fixed, 1);
				buffer_get_surface(pauseSurfBuffer, pauseSurf, 0);
			}
	}
}else{
	pause = false;
	instance_activate_region(
	camera_get_view_x(view_camera[0]) - INSTANCE_LOAD_DISTANCE,
	camera_get_view_y(view_camera[0]) - INSTANCE_LOAD_DISTANCE/32,
	camera_get_view_width(view_camera[0]) + INSTANCE_LOAD_DISTANCE*2,
	camera_get_view_height(view_camera[0]) + INSTANCE_LOAD_DISTANCE*3,
	true
	);
	if (surface_exists(pauseSurf)) surface_free(pauseSurf);
	if (buffer_exists(pauseSurfBuffer)) buffer_delete(pauseSurfBuffer);
}

gpu_set_blendenable(true);