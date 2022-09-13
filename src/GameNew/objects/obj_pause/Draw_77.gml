
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
		instance_activate_object(locales);
		instance_activate_object(obj_camera);
		instance_activate_object(obj_crafting);
		instance_activate_object(obj_daycycle);
		instance_activate_object(obj_daynightclock);
		instance_activate_object(obj_depthsort);
		instance_activate_object(obj_daynightfade);
		instance_activate_object(obj_display);
		instance_activate_object(obj_firstsettings);
		instance_activate_object(obj_hud);
		instance_activate_object(obj_inputmanager);
		instance_activate_object(obj_inventory);
		instance_activate_object(obj_levelcontrol);
		instance_activate_object(obj_shadows);
		instance_activate_object(obj_shell);
		instance_activate_object(obj_weather);
		instance_activate_object(obj_drunkscreen);
		instance_activate_object(obj_wateroverlay);
		instance_activate_object(obj_gun_logic);
		instance_activate_object(obj_chatterbox);
		instance_activate_object(obj_cursor);
		instance_activate_object(obj_cutscene_controller);
		instance_activate_object(obj_gamecontrol);
		instance_activate_object(obj_rain_emitter);
		instance_activate_object(obj_audiomanager);
		instance_activate_object(par_collectible);
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