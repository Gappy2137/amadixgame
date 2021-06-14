event_inherited();
if (instance_exists(obj_amadix)){
	var sx = (obj_amadix.itemeaten mod obj_inventory.spr_inv_items_columns) * 24;
	var sy = (obj_amadix.itemeaten div obj_inventory.spr_inv_items_columns) * 24;
	switch (face){
		case -1:
		break;
		case dirc.down:
			draw_sprite_general(spr_inventory_items, 0, sx, sy + obj_amadix.eatingSx, 24, 24 - obj_amadix.eatingSx, obj_amadix.x - 7 + (obj_amadix.eatingX), obj_amadix.y + 13 + (obj_amadix.eatingY), 1, (obj_amadix.eatingYscale), obj_amadix.eatingAngle, c_white, c_white, c_white, c_white, 1);
			draw_sprite_ext(obj_amadix.hands_index,obj_amadix.anim_frame_action,obj_amadix.x,obj_amadix.y,obj_amadix.image_xscale,obj_amadix.image_yscale,obj_amadix.image_angle,c_white,obj_amadix.image_alpha);
		break;
	}
}