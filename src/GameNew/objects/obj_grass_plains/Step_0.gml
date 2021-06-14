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


/*
if instance_exists(obj_amadix){
	var p_collision = 0;
	switch (obj_amadix.facing){
		case dirc.down:
			p_collision = collision_rectangle(bbox_left, bbox_top - 12, bbox_right, bbox_bottom - 12, obj_amadix, true, true);	
		break;
		case dirc.left:
			p_collision = collision_rectangle(bbox_left + 12, bbox_top, bbox_right + 12, bbox_bottom, obj_amadix, true, true);	
		break;
		case dirc.right:
			p_collision = collision_rectangle(bbox_left - 12, bbox_top, bbox_right - 12, bbox_bottom, obj_amadix, true, true);	
		break;
		case dirc.up:
			p_collision = collision_rectangle(bbox_left, bbox_top + 12, bbox_right, bbox_bottom + 12, obj_amadix, true, true);	
		break;
	}
		var i = random(1);
		if (obj_amadix.actionstate == player_state_action.attacking_melee){
			if (p_collision){
				if (i == 0){
					angle = approach(angle, -25, acc*.7);
				}else if (i == 1){
					angle = approach(angle, 25, acc*.7);
				}
			}else{
				angle = approach(angle, 0, acc*.7);
			}
		}
}*/