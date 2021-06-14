event_inherited();
if instance_exists(obj_amadix){
	switch(ninepart){
		case 0:
			draw_sprite_general(spr_inventory_items, 0, sx + 4, sy + 4, 4, 4, x, y - z, scale, scale, 0, c_white, c_white, c_white, c_white, image_alpha);
		break;
		case 1:
			draw_sprite_general(spr_inventory_items, 0, sx + 10, sy + 10, 4, 4, x, y - z, scale, scale, 0, c_white, c_white, c_white, c_white, image_alpha);
		break;
		case 2:
			draw_sprite_general(spr_inventory_items, 0, sx + 2, sy + 8, 4, 4, x, y - z, scale, scale, 0, c_white, c_white, c_white, c_white, image_alpha);
		break;
		case 3:
			draw_sprite_general(spr_inventory_items, 0, sx + 6, sy + 4, 4, 4, x, y - z, scale, scale, 0, c_white, c_white, c_white, c_white, image_alpha);
		break;
		case 4:
			draw_sprite_general(spr_inventory_items, 0, sx + 16, sy + 6, 4, 4, x, y - z, scale, scale, 0, c_white, c_white, c_white, c_white, image_alpha);
		break;
		case 5:
			draw_sprite_general(spr_inventory_items, 0, sx + 12, sy + 8, 4, 4, x, y - z, scale, scale, 0, c_white, c_white, c_white, c_white, image_alpha);
		break;
	}
}