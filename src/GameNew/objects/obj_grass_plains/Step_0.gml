event_inherited();
en = instance_place(x, y, par_entity);
if (en){
	collision = true;
}else{
	collision = false;	
}

if (collision){
	var left_collision = collision_rectangle(bbox_left, bbox_top, bbox_right - 8, bbox_bottom, en, true, true);
	var right_collision = collision_rectangle(bbox_left + 8, bbox_top, bbox_right, bbox_bottom, en, true, true);
	
	if (left_collision){
		angle = approach(angle, -25, acc);	
	}else if (right_collision){
		angle = approach(angle, 25, acc);
	}else{
		angle = approach(angle, 0, acc);	
	}
	
	
}else{
	angle = approach(angle, 0, acc);
}

if (instance_place(x, y, obj_melee_attack)){
	if (chance(0.075)) && (other.image_index < 5){
		instance_destroy();	
	}else{
		angle = approach(angle, -25, acc);
	}
}
if (!done){
	event_user(0);
	done = true;
}
