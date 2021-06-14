function scr_camera_get_scale(){
	if (instance_exists(obj_camera))
		return obj_display.window_size;
	else {
		show_debug_message("Error from scr_camera_get_scale: obj_camera not found");
		return 1;
	}
}