function mouse_over_me(radius){
	if (instance_exists(obj_amadix)){
		if (collision_rectangle(bbox_left - radius, bbox_top - radius - 2, bbox_right + radius, bbox_bottom + radius, obj_amadix, false, false)){
			if (mouse_x == clamp(mouse_x, bbox_left - radius, bbox_right + radius) && mouse_y == clamp(mouse_y, bbox_top - radius - 2, bbox_bottom + radius)){
				return true;
			}
		}
	}
}