if (show_inventory) && (!show_slots){

	draw_set_font(font_item);

	/*
	////////////////
	draw_text(16, 64, "page " + string(page));
	draw_text(16, 64 + 12*1, "sel " + string(selected_slot));
	draw_text(16, 64 + 12*2, "pckd " + string(picked_slot));
	draw_text(16, 64 + 12*3, "onep " + string(onepicked_slot));
	draw_text(16, 64 + 12*4, "mltp " + string(multipick));
	draw_text(16, 64 + 12*5, "inh " + string(inhand));
	////////////////
	*/

	depth = -1;
	draw_sprite_ext(spr_eq_back, 0, backUI_x, backUI_y, scale, scale, 0, c_white, 1);
	draw_sprite_ext(spr_eq_back, 1, backUI_x, backUI_y, scale, scale, 0, c_white, 1);
	depth = -3;
	draw_sprite_ext(spr_eq_slotback, 0, backslotUI_x, backslotUI_y, scale, scale, 0, c_white, 1);

	

	//Inventory
	var ii, ix, iy, xx, yy, sx, sy, iitem, inv_grid;
	ii = 0; ix = 0; iy = 0; inv_grid = ds_inventory;
	var jj = 0;
	var wh = c_white;
	var bl = c_black;
	ii = page * 84;
	//Strony ekwipunku
	
	#region Strona
		repeat (84){
				//x,y slotow
				xx = slots_x + ((cell_size+x_offset) * ix * scale);
				yy = slots_y + ((cell_size+y_offset) * iy * scale);
		
				//Przedmiot
				iitem = inv_grid[# 0, ii];
				sx = (iitem mod spr_inv_items_columns) * cell_size;
				sy = (iitem div spr_inv_items_columns) * cell_size;
		
				//Rysuj slot i przedmiot
		
				if (iitem > 0) && (inv_grid[# 1, ii] > 0){
					switch(ii){
						case selected_slot:
										//draw selected slot
										draw_sprite_ext(spr_inv_slot_selected, 0, xx, yy, scale, scale, 0, c_white, 1);
										//draw item
										draw_sprite_part_ext(spr_inv_items, 0, sx, sy, cell_size, cell_size, xx, yy, scale, scale, c_white, 1);
										
										gpu_set_blendmode(bm_add);
										draw_sprite_part_ext(spr_inv_items, 0, sx, sy, cell_size, cell_size, xx, yy, scale, scale, c_white, .2);
										gpu_set_blendmode(bm_normal);
										
									if (selected_slot == picked_slot){
										if (multipick > 0){
										//draw selected slot
										draw_sprite_ext(spr_inv_slot_selected, 0, xx, yy, scale, scale, 0, c_white, 1);
										//draw item
										draw_sprite_part_ext(spr_inv_items, 0, sx, sy, cell_size, cell_size, xx, yy, scale, scale, c_white, 1);
										
										gpu_set_blendmode(bm_add);
										draw_sprite_part_ext(spr_inv_items, 0, sx, sy, cell_size, cell_size, xx, yy, scale, scale, c_white, .2);
										gpu_set_blendmode(bm_normal);
										}else{
											draw_sprite_ext(spr_inv_slot_none, 0, xx, yy, scale, scale, 0, c_white, 1);
										}
									
									}else if (selected_slot != picked_slot){
										if (multipick > 0){
										//draw selected slot
										draw_sprite_ext(spr_inv_slot_selected, 0, xx, yy, scale, scale, 0, c_white, 1);
										//draw item
										draw_sprite_part_ext(spr_inv_items, 0, sx, sy, cell_size, cell_size, xx, yy, scale, scale, c_white, 1);
										
										gpu_set_blendmode(bm_add);
										draw_sprite_part_ext(spr_inv_items, 0, sx, sy, cell_size, cell_size, xx, yy, scale, scale, c_white, .2);
										gpu_set_blendmode(bm_normal);
										}else{
											break;	
										}
									}
						break;
						case picked_slot:
									if (multipick > 0){
										draw_sprite_ext(spr_inv_slot_none, 0, xx, yy, scale, scale, 0, c_white, 1);
										draw_sprite_part_ext(spr_inv_items, 0, sx, sy, cell_size, cell_size, xx, yy, scale, scale, c_white, 1);
									}else{
										draw_sprite_ext(spr_inv_slot_none, 0, xx, yy, scale, scale, 0, c_white, .2);
									}
						break;
						default:
									if (inv_grid[# 1, ii] > 0){
										//draw_sprite_ext(spr_inv_slot_none, 0, xx, yy, scale, scale, 0, c_white, 1);
										draw_sprite_part_ext(spr_inv_items, 0, sx, sy, cell_size, cell_size, xx, yy, scale, scale, c_white, 1);
									}
						break;
					}
				}
		
				//Rysuj liczbe przedmiotow
				if (iitem > 0){
					var amount = inv_grid[# 1, ii];
					if (amount < 0) || (amount > 1){
							switch(ii){
								case selected_slot:
									if (selected_slot == picked_slot) && (multipick == 0){
										break;	
									}
									draw_set_font(global.font_itemnum);
									draw_set_halign(fa_right);
									draw_text_transformed_color(xx + 22, yy + 16, string(amount), .5, .5, 0, wh, wh, wh, wh, 1);
									draw_set_halign(fa_left);
									draw_set_font(font_item);
								break;
								case picked_slot:
									if (multipick > 0){
										draw_set_font(global.font_itemnum);
										draw_set_halign(fa_right);
										draw_text_transformed_color(xx + 22, yy + 16, string(amount), .5, .5, 0, wh, wh, wh, wh, 1);
										draw_set_halign(fa_left);
										draw_set_font(font_item);
									}else{
										break;
									}
								break;
								default:
									draw_set_font(global.font_itemnum);
									draw_set_halign(fa_right);
									draw_text_transformed_color(xx + 22, yy + 16, string(amount), .5, .5, 0, wh, wh, wh, wh, 1);
									draw_set_halign(fa_left);
									draw_set_font(font_item);
								break;
							}

					}
				}

		
		
				//Przelec przez cala siatke przedmiotow
						ii += 1;
						jj += 1;
						ix = ii mod inv_slots_width;
						iy = jj div inv_slots_width;
		}
	
	#endregion
	
	//Rysowanie nazwy i opisu przedmiotow oraz GUI opisu

	var iinfo_grid = ds_item_info;
	var name = "";
	var description = "";
	var type = "";
	var hp = 0;
	var stamina = 0;
	iitem = inv_grid[# 0, selected_slot];


	if (iitem > 0) && (multipick == 0) && (picked_slot == -1){
		//GUI opisu
		var ibox_x = xUI + (mouse_slotx * cell_size) + (cell_size)/2;//- 20 - 8;
		var ibox_y = yUI + (mouse_sloty * cell_size) + 24;
	
		//Nazwa przedmiotu
		draw_set_font(font_item_desc);
		name = iinfo_grid[# 0, iitem];
		var name_scale = 0.75;
		var name_sep = 12;
		var name_width = 72 * (4/3);
		var name_height = string_height_ext(name, name_sep, name_width);
		
		//Rodzaj przedmiotu
		draw_set_font(font_item_desc);
		type = iinfo_grid[# 2, inv_grid[# TYPE, selected_slot]];
		var type_scale = 0.25;
		var type_sep = 6;
		var type_width = 72 * 4;
		var type_height = string_height(type);
		
		//Opis przedmiotu
		draw_set_font(font_item_desc);
		description = iinfo_grid[# 1, iitem];
		var desc_scale = 0.5;
		var desc_sep = 12;
		var desc_width = 72 * 2;
		var desc_height = string_height_ext(description, desc_sep, desc_width);
		
	
	
		//Leczone HP
		draw_set_font(font_item_desc);
		hp = ds_inventory[# 4, selected_slot];
	
		//Leczona energia
		draw_set_font(font_item_desc);
		stamina = ds_inventory[# 5, selected_slot];
		
		//Efekt
	
	
	
		//Rysuj ()
		if (hp > 0) || (stamina > 0){
			var ibox_height = name_height + type_height + desc_height + 8;
		}else{
			var ibox_height = name_height + type_height + desc_height - 8;
		}
		
		if (ibox_y + ibox_height > obj_display.ideal_height){
			ibox_y = yUI + (mouse_sloty * cell_size) - ibox_height;
		}
		
		if string_width_ext(name, name_sep, name_width) > 700{
			var ibox_width = string_width_ext(name, name_sep, name_width)/2;
			var new_desc_width = 72 * 2;
			scr_draw_gui_box_stretch(spr_inventory_desc, ibox_x - ibox_width + 16, ibox_y, ibox_x + ibox_width - 16, ibox_y + ibox_height);
			draw_set_halign(fa_center);
			draw_text_ext_transformed_color(ibox_x + 1, ibox_y + type_height + name_height + 1, description, desc_sep, new_desc_width, desc_scale, desc_scale, 0, c_gray, c_gray, c_gray, c_gray, .35);
			draw_text_ext_transformed_color(ibox_x, ibox_y + type_height + name_height, description, desc_sep, new_desc_width, desc_scale, desc_scale, 0, wh, wh, wh, wh, 1);
			draw_set_halign(fa_left);
			if (hp > 0) && (stamina > 0){
				draw_sprite(spr_inventory_item_stat, 0, ibox_x - 30, ibox_y + ibox_height - 24);
				draw_text_transformed_color(ibox_x - 30 + 18, ibox_y + ibox_height + 3 - 24, hp, .75, .75, 0, wh, wh, wh, wh, 1);
				
				draw_sprite(spr_inventory_item_stat, 1, ibox_x, ibox_y + ibox_height - 24);
				draw_text_transformed_color(ibox_x + 18, ibox_y + ibox_height + 3 - 24, stamina, .75, .75, 0, wh, wh, wh, wh, 1);
			}else if (hp > 0) && (stamina == 0){
				draw_sprite(spr_inventory_item_stat, 0, ibox_x - 12, ibox_y + ibox_height - 24);
				draw_text_transformed_color(ibox_x - 12 + 18, ibox_y + ibox_height + 3 - 24, hp, .75, .75, 0, wh, wh, wh, wh, 1);
			}else if (hp == 0) && (stamina > 0){
				draw_sprite(spr_inventory_item_stat, 1, ibox_x - 12, ibox_y + ibox_height - 24);
				draw_text_transformed_color(ibox_x - 12 + 18, ibox_y + ibox_height + 3 - 24, stamina, .75, .75, 0, wh, wh, wh, wh, 1);
			}
		}else{
			var ibox_width = 0;
			scr_draw_gui_box_stretch(spr_inventory_desc, ibox_x - 40, ibox_y, ibox_x + 40, ibox_y + ibox_height);
			draw_set_halign(fa_center);
			draw_text_ext_transformed_color(ibox_x + 1, ibox_y + name_height + type_height + 1 - 6, description, desc_sep, desc_width, desc_scale, desc_scale, 0, c_gray, c_gray, c_gray, c_gray, .35);
			draw_text_ext_transformed_color(ibox_x, ibox_y + type_height + name_height - 6, description, desc_sep, desc_width, desc_scale, desc_scale, 0, wh, wh, wh, wh, 1);
			draw_set_halign(fa_left);
			if (hp > 0) && (stamina > 0){
				draw_sprite(spr_inventory_item_stat, 0, ibox_x - 30, ibox_y + ibox_height - 20);
				draw_text_transformed_color(ibox_x - 30 + 18, ibox_y + ibox_height + 3 - 20, hp, .75, .75, 0, wh, wh, wh, wh, 1);
				
				draw_sprite(spr_inventory_item_stat, 1, ibox_x, ibox_y + ibox_height - 20);
				draw_text_transformed_color(ibox_x + 18, ibox_y + ibox_height + 3 - 20, stamina, .75, .75, 0, wh, wh, wh, wh, 1);
			}else if (hp > 0) && (stamina == 0){
				draw_sprite(spr_inventory_item_stat, 0, ibox_x - 12, ibox_y + ibox_height - 20);
				draw_text_transformed_color(ibox_x - 12 + 18, ibox_y + ibox_height + 3 - 20, hp, .75, .75, 0, wh, wh, wh, wh, 1);
			}else if (hp == 0) && (stamina > 0){
				draw_sprite(spr_inventory_item_stat, 1, ibox_x - 12, ibox_y + ibox_height - 20);
				draw_text_transformed_color(ibox_x - 12 + 18, ibox_y + ibox_height + 3 - 20, stamina, .75, .75, 0, wh, wh, wh, wh, 1);
			}
		}
		draw_set_halign(fa_center);
		draw_text_ext_transformed_color(ibox_x + 1, ibox_y + 2 + 1, name, name_sep, name_width, name_scale, name_scale, 0, c_gray, c_gray, c_gray, c_gray, .35);
		draw_text_ext_transformed_color(ibox_x, ibox_y + 2, name, name_sep, name_width, name_scale, name_scale, 0, wh, wh, wh, wh, 1);
		draw_set_halign(fa_left);
		draw_set_halign(fa_center);
		draw_text_ext_transformed_color(ibox_x + .25, ibox_y + name_height + .75, type, type_sep, type_width, type_scale, type_scale, 0, c_gray, c_gray, c_gray, c_gray, .35);
		draw_text_ext_transformed_color(ibox_x, ibox_y + name_height, type, type_sep, type_width, type_scale, type_scale, 0, wh, wh, wh, wh, 1);
		draw_set_halign(fa_left);
		
	}





	//Rysowanie przedmiotow przenoszonych
	if (picked_slot != -1) && (multipick == 0){
			//Przedmiot
			iitem = inhand;
			sx = (iitem mod spr_inv_items_columns) * cell_size;
			sy = (iitem div spr_inv_items_columns) * cell_size;
			scr_draw_item(sx, sy, mousex, mousey, 1);
		
			var inum = inv_grid[# 1, picked_slot];
			if (inum < 0) || (inum > 1){
				draw_text_color(mousex + 16, mousey + 12, string(inum), c_black, c_black, c_black, c_black, 1);
			}
		
	}
	if (multipick != 0){
	
			//Przedmiot
			iitem = inhand;
			sx = (iitem mod spr_inv_items_columns) * cell_size;
			sy = (iitem div spr_inv_items_columns) * cell_size;
			scr_draw_item(sx, sy, mousex, mousey, 1);
		
			var inuma = multipick;
			if (inuma < 0) || (inuma > 1){
				draw_text_color(mousex + 16, mousey + 12, string(inuma), c_black, c_black, c_black, c_black, 1);
			}
		
	}
	depth = -1;
}
else if (!show_inventory) && (show_slots){
	
	if (slots_position_up){
		var pos = 12;
	}else{
		var pos = 237;
	}
	
	//Inventory
	var ii, ix, iy, xx, yy, sx, sy, iitem, inv_grid;
	ii = 0; ix = 0; iy = 0; inv_grid = ds_inventory;
	var wh = c_white;
	var bl = c_black;
	
	draw_sprite_ext(spr_eq_slotback_12slot, 0, xUI + 9, pos - 1, scale, scale, 0, c_white, 1);
	
	draw_set_font(font_item);
	
	//Rysowanie nazwy i opisu przedmiotow oraz GUI opisu

	var iinfo_grid = ds_item_info;
	var name = "";
	var description = "";
	iitem = inv_grid[# 0, selected_slot];

	text_timer--;
	
	if (iitem > 0) && (multipick == 0) && (picked_slot == -1){
		#region Test
		/*
		//GUI opisu
		var ibox_x = xUI + (mouse_slotx * cell_size) + (cell_size/2);
		var ibox_y = pos - 24;
	
		//Nazwa przedmiotu
		draw_set_font(font_item_desc);
		name = iinfo_grid[# 0, iitem];
		var name_scale = 0.75;
		var name_sep = 12;
		var name_width = 72 * (4/3);
		var name_height = string_height_ext(name, name_sep, name_width);
	
	
		//Leczone HP
	
		//Leczona energia
	
		//Efekt
	
	
	
		//Rysuj ()
		var ibox_height = name_height;
		ibox_y = pos - ibox_height - 8;
		if string_width_ext(name, name_sep, name_width) > 72{
			var ibox_width = string_width_ext(name, name_sep, name_width)/2;
			scr_draw_gui_box_stretch(spr_inventory_desc, ibox_x - ibox_width + 16, ibox_y, ibox_x + ibox_width - 16, pos - 4);
		}else{
			var ibox_width = 0;
			scr_draw_gui_box_stretch(spr_inventory_desc, ibox_x - 40, ibox_y, ibox_x + 58 + 16 + 6 - 40, pos - 4);
		}
		
		draw_set_halign(fa_center);
		draw_text_ext_transformed_color(ibox_x + 1, ibox_y + 2 + 1, name, name_sep, name_width, name_scale, name_scale, 0, c_gray, c_gray, c_gray, c_gray, .35);
		draw_text_ext_transformed_color(ibox_x, ibox_y + 2, name, name_sep, name_width, name_scale, name_scale, 0, wh, wh, wh, wh, 1);
		draw_set_halign(fa_left);
		*/
		#endregion
		
		
		
		var name_x = camera_get_view_width(view_camera[0])/2;
		name = iinfo_grid[# 0, iitem];
		var name_scale = 0.75;
		var name_height = string_height(name);
		
		if text_timer <= 100{
			text_alpha -= 0.01;
			if text_alpha <= 0{
				text_alpha = 0;
			}
		}
		
		draw_set_font(font_item_desc);
		draw_set_halign(fa_center);
		if (!slots_position_up){
			draw_text_transformed_color(name_x, (pos - name_height), name, name_scale, name_scale, 0, wh, wh, wh, wh, text_alpha);
		}else{
			draw_text_transformed_color(name_x, (pos - name_height) + 44, name, name_scale, name_scale, 0, wh, wh, wh, wh, text_alpha);
		}
		draw_set_halign(fa_left);
		
	}
	
	
	draw_set_font(font_item);
	repeat (12){
			//x,y slotow
			xx = slots_x + ((cell_size+x_offset) * ix * scale);
			yy = pos + ((cell_size+y_offset) * iy * scale);
		
			//Przedmiot
			iitem = inv_grid[# 0, ii];
			sx = (iitem mod spr_inv_items_columns) * cell_size;
			sy = (iitem div spr_inv_items_columns) * cell_size;
		
			//Rysuj slot i przedmiot
		
				if (iitem > 0) && (inv_grid[# 1, ii] > 0){
					switch(ii){
						case selected_slot:
										//draw selected slot
										draw_sprite_ext(spr_inv_slot_selected, 0, xx, yy, scale, scale, 0, c_white, 1);
										//draw item
										draw_sprite_part_ext(spr_inv_items, 0, sx, sy, cell_size, cell_size, xx, yy, scale, scale, c_white, 1);
										
										gpu_set_blendmode(bm_add);
										draw_sprite_part_ext(spr_inv_items, 0, sx, sy, cell_size, cell_size, xx, yy, scale, scale, c_white, .2);
										gpu_set_blendmode(bm_normal);
						break;
						default:
									if (inv_grid[# 1, ii] > 0){
										draw_sprite_ext(spr_inv_slot_none, 0, xx, yy, scale, scale, 0, c_white, 1);
										draw_sprite_part_ext(spr_inv_items, 0, sx, sy, cell_size, cell_size, xx, yy, scale, scale, c_white, 1);
									}
						break;
					}
				}

				//Rysuj liczbe przedmiotow
					if (iitem > 0){
						var amount = inv_grid[# 1, ii];
						if (amount < 0) || (amount > 1){
								switch(ii){
									case selected_slot:
										if (selected_slot == picked_slot) && (multipick == 0){
											break;	
										}
										draw_set_font(global.font_itemnum);
										draw_set_halign(fa_right);
										draw_text_transformed_color(xx + 22, yy + 16, string(amount), .5, .5, 0, wh, wh, wh, wh, 1);
										draw_set_halign(fa_left);
										draw_set_font(font_item);

									break;
									case picked_slot:
										if (multipick > 0){
											draw_set_font(global.font_itemnum);
											draw_set_halign(fa_right);
											draw_text_transformed_color(xx + 22, yy + 16, string(amount), .5, .5, 0, wh, wh, wh, wh, 1);
											draw_set_halign(fa_left);
											draw_set_font(font_item);
										}else{
											break;
										}
									break;
									default:
										draw_set_font(global.font_itemnum);
										draw_set_halign(fa_right);
										draw_text_transformed_color(xx + 22, yy + 16, string(amount), .5, .5, 0, wh, wh, wh, wh, 1);
										draw_set_halign(fa_left);
										draw_set_font(font_item);
									break;
								}
						}

					}
		
			//Przelec przez cala siatke przedmiotow
			ii += 1;
			ix = ii mod inv_slots_width;
			iy = ii div inv_slots_width;
	}
	
	draw_set_font(font_item_desc);
	var num = 0;
	repeat(inv_slots_width - 3){
		num++;
		draw_text_transformed_color(xUI + (cell_size * num) - cell_size + 4, pos + 4, num, 0.35, 0.35, 0, bl, bl, bl, bl, 1);
	}
	draw_text_transformed_color(xUI + (cell_size * 10) - cell_size + 4, pos + 4, "0", 0.35, 0.35, 0, bl, bl, bl, bl, 1);
	draw_text_transformed_color(xUI + (cell_size * 11) - cell_size + 4, pos + 4, "-", 0.35, 0.35, 0, bl, bl, bl, bl, 1);
	draw_text_transformed_color(xUI + (cell_size * 12) - cell_size + 4, pos + 4, "=", 0.35, 0.35, 0, bl, bl, bl, bl, 1);
	
	//Wybrany slot
	var selslot_x = xUI + (mouse_slotx_second * cell_size);
	draw_sprite(spr_inventory_selected, 0, selslot_x - 4, pos - 4);
}
else if (!show_inventory) && (!show_slots){
	exit;	
}