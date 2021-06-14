function ami_clicked(){
	if (instance_exists(obj_amadix)){
		if (collision_rectangle(bbox_left - 4, bbox_top - 6, bbox_right + 4, bbox_bottom + 4, obj_amadix, true, false)){
			if (mouse_x == clamp(mouse_x, bbox_left, bbox_right) && mouse_y == clamp(mouse_y, bbox_top, bbox_bottom)){
				if (mouse_check_button_pressed(mb_right)){
					return true;
				}
			}
		}
	}
}