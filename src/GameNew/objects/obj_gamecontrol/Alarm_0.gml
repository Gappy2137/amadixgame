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

instance_activate_region(
camera_get_view_x(view_camera[0]) - INSTANCE_LOAD_DISTANCE,
camera_get_view_y(view_camera[0]) - INSTANCE_LOAD_DISTANCE/32,
camera_get_view_width(view_camera[0]) + INSTANCE_LOAD_DISTANCE*2,
camera_get_view_height(view_camera[0]) + INSTANCE_LOAD_DISTANCE*3,
true
);


alarm[0] = 5;