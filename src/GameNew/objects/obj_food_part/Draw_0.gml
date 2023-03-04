event_inherited();
if instance_exists(obj_amadix){
	switch(ninepart){
		case 0:
			draw_sprite_general(spr_inventory_items, 0, sx + 8, sy + 8, size, size, x, y - z, scale, scale, image_angle, c_white, c_white, c_white, c_white, image_alpha);
		break;
		case 1:
			draw_sprite_general(spr_inventory_items, 0, sx + 7, sy + 5, size, size, x, y - z, scale, scale, image_angle, c_white, c_white, c_white, c_white, image_alpha);
		break;
		case 2:
			draw_sprite_general(spr_inventory_items, 0, sx + 9, sy + 10, size, size, x, y - z, scale, scale, image_angle, c_white, c_white, c_white, c_white, image_alpha);
		break;
		case 3:
			draw_sprite_general(spr_inventory_items, 0, sx + 5, sy + 10, size, size, x, y - z, scale, scale, image_angle, c_white, c_white, c_white, c_white, image_alpha);
		break;
		case 4:
			draw_sprite_general(spr_inventory_items, 0, sx + 3, sy + 6, size, size, x, y - z, scale, scale, image_angle, c_white, c_white, c_white, c_white, image_alpha);
		break;
		case 5:
			draw_sprite_general(spr_inventory_items, 0, sx + 5, sy + 12, size, size, x, y - z, scale, scale, image_angle, c_white, c_white, c_white, c_white, image_alpha);
		break;
	}
}