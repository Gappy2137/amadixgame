

if (ami_clicked()) && (!obj_inventory.show_inventory){
	show_container = true;	
	alarm[0] = 2;
}
if (show_container){
	if (keyboard_check_pressed(ord("E"))){
		if (inhand == -1){
			show_container = false;	
			canUseContainter = false;
			obj_inventory.show_slots = true;
		}
	}
}

event_inherited();