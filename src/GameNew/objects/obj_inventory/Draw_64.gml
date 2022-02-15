if (show_inventory) && (!show_slots){


	
	draw_set_font(font_item);

	
	////////////////
	draw_text(16, 64, "page " + string(page));
	draw_text(16, 64 + 12*1, "sel " + string(selected_slot));
	draw_text(16, 64 + 12*2, "pckd " + string(picked_slot));
	draw_text(16, 64 + 12*3, "onep " + string(onepicked_slot));
	draw_text(16, 64 + 12*4, "mltp " + string(multipick));
	draw_text(16, 64 + 12*5, "inh " + string(inhand));
	////////////////
	

	depth = -2;
	draw_sprite_ext(spr_eq_slotback, 0, backslotUI_x, backslotUI_y, scale, scale, 0, c_white, 1);

	

	//Inventory
	var ii, ix, iy, xx, yy, sx, sy, iitem, inv_grid;
	ii = 0; ix = 0; iy = 0; inv_grid = ds_inventory;
	var jj = 0;
	var wh = c_white;
	var bl = c_black;
	ii = page * slots_onpage;
	
	#region Strona
		repeat (slots_onpage){
			
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
	
	#region Armor
		draw_sprite_ext(spr_eq_slotback_armor, 0, armorUI_x, armorUI_y, scale, scale, 0, c_white, 1);
		var kk = 1;
		repeat(4){
			if (inv_grid[# INVITEM, (inv_slots - 4 + (kk - 1))] == item.none){
				draw_sprite_ext(spr_eq_slotback_armor, kk, armorUI_x, armorUI_y, scale, scale, 0, c_white, 1);
			}
			kk++;
		}
		
		
		ii = inv_slots - 4;
		jj = 0;
		ix = 0;
		iy = 0;
		
		repeat (4){
			
				//x,y slotow
				xx = armor_x[jj];
				yy = armor_y[jj];
		
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
	
	#region Rysowanie nazwy i opisu przedmiotow oraz GUI opisu

	var iinfo_grid = ds_item_info;
	var name = "";
	var description = "";
	var type = "";
	var hp = 0;
	var stamina = 0;
	var defence = 0;
	var damage = 0;
	var level = 0;
	var effect1 = 0;
	var effect2 = 0;
	var effect3 = 0;
	iitem = inv_grid[# INVITEM, selected_slot];


	if (iitem > 0) && (multipick == 0){
		//GUI opisu
		//var ibox_x = xUI + (mouse_slotx * cell_size) + (cell_size)/2;//- 20 - 8;
		//var ibox_y = yUI + (mouse_sloty * cell_size) + 24;
	
		//Infobox
		var infobox_x, infobox_y, infobox_width, infobox_height,
		name_x, name_y, type_x, type_y, desc_x, desc_y,
		hp_x, hp_y, hp_h = 0, stamina_x, stamina_y, stamina_h = 0,
		defence_x, defence_y, defence_h = 0, damage_x, damage_y, damage_h = 0,
		level_x, level_y, level_h = 0,
		effect1_x, effect1_y, effect1_h = 0,
		effect2_x, effect2_y, effect2_h = 0,
		effect3_x, effect3_y, effect3_h = 0;
	
		infobox_x = mousex + 8;
		infobox_y = mousey + 8;
		infobox_width = cell_size * 4;
		var infobox_half = (infobox_x + infobox_width/2);
	
		//Nazwa przedmiotu
		name = (iinfo_grid[# INVITEM, iitem]);
		var namestr = scribble(name);
		var name_scale = 0.75;
		var name_sep = 12;
		var name_width = infobox_width - 8;
		var name_height = string_height_ext(name, name_sep, name_width);
		
		//Rodzaj przedmiotu
		type = iinfo_grid[# 2, inv_grid[# INVTYPE, selected_slot]];
		var typestr = scribble(type);
		var type_scale = 0.6;
		var type_sep = 6;
		var type_width = 72 * 4;
		var type_height = 6;
		
		//Opis przedmiotu
		description = iinfo_grid[# 1, iitem];
		var descstr = scribble(description);
		var desc_scale = 0.4;
		var desc_sep = 12;
		var desc_width = string_width(description);
		var desc_height = string_height_ext(description, desc_sep, desc_width * desc_scale);
		
	
	
		//Leczone HP
		hp = ds_inventory[# INVHP, selected_slot];
	
		//Leczona energia
		stamina = ds_inventory[# INVSTAMINA, selected_slot];
		
		//Armor
		defence = ds_inventory[# INVDEFENCE, selected_slot];
		
		//Damage
		damage = ds_inventory[# INVDAMAGE, selected_slot];
		
		//Level
		level = ds_inventory[# INVLEVEL, selected_slot];
		
		//Effect1
		effect1 = ds_inventory[# INVEFFECT1, selected_slot];
		
		//Effect2
		effect2 = ds_inventory[# INVEFFECT2, selected_slot];
		
		//Effect3
		effect3 = ds_inventory[# INVEFFECT3, selected_slot];

		
		if (infobox_x + infobox_width > obj_display.ideal_width){
			infobox_x = mousex - 8 - infobox_width;
		}
		
		
		if (hp != 0) && (stamina == 0){hp_x = infobox_half + 8; hp_y = 0; hp_h = 32;}
		if (hp == 0) && (stamina != 0){hp_x = infobox_half + 8; hp_y = 0; hp_h = 32;}
		if (hp != 0) && (stamina != 0){hp_x = infobox_x + 8; hp_y = 0; hp_h = 32; stamina_x = infobox_x + infobox_width - 8; stamina_y = 0; stamina_h = 32;}
		
		infobox_height = name_height + type_height + desc_height + hp_h + stamina_h + defence_h + damage_h + level_h + effect1_h + effect2_h + effect3_h;
		
		if (infobox_y + infobox_height > obj_display.ideal_height){
			infobox_y = mousey - 8 - infobox_height;	
		}
		
		//Rysuj tlo
		draw_sprite_ext(spr_inventory_desc, 0, infobox_x, infobox_y, infobox_width/24, infobox_height/24, 0, c_white, 1);
		
		//Rysuj nazwe
		namestr.starting_format("font_item", bl);
		namestr.align(fa_center, fa_top);
		namestr.transform(name_scale, name_scale, 0);
		namestr.wrap(infobox_width - 8, 48, false);
		namestr.scale_to_box(infobox_width - 8, 48);
		namestr.draw(infobox_half, infobox_y + 4);
		
		//Rysuj typ
		typestr.starting_format("font_item", bl);
		typestr.align(fa_center, fa_top);
		typestr.transform(type_scale, type_scale, 0);
		typestr.wrap(infobox_width - 8, 8, false);
		typestr.scale_to_box(infobox_width - 8, 8);
		typestr.draw(infobox_half, infobox_y + namestr.get_height()*name_scale + 4);
		
		//Rysuj opis
		descstr.starting_format("font_dialogue", bl);
		descstr.align(fa_center, fa_top);
		descstr.transform(desc_scale, desc_scale, 0);
		descstr.wrap(infobox_width - 8, 96, false);
		descstr.scale_to_box(infobox_width - 8, 96);
		descstr.draw(infobox_half, infobox_y + namestr.get_height()*name_scale + typestr.get_height()*type_scale + 4);
		
		
		infobox_height = namestr.get_height()*name_scale + typestr.get_height()*type_scale + descstr.get_height()*desc_scale + 12;
		
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
		*/
	}

	#endregion

	#region Rysowanie przedmiotow przenoszonych
	if (picked_slot != -1) && (multipick == 0){
			//Przedmiot
			iitem = inhand;
			sx = (iitem mod spr_inv_items_columns) * cell_size;
			sy = (iitem div spr_inv_items_columns) * cell_size;
			scr_draw_item(sx, sy, mousex, mousey, 1);
		
			var inum = inv_grid[# 1, picked_slot];
			if (inum < 0) || (inum > 1){
				draw_set_font(global.font_itemnum);
				draw_text_transformed_color(mousex + 16, mousey + 16, string(inum), .5, .5, 0, wh, wh, wh, wh, 1);
				draw_set_font(font_item);
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
				draw_set_font(global.font_itemnum);
				draw_text_transformed_color(mousex + 16, mousey + 16, string(inuma), .5, .5, 0, wh, wh, wh, wh, 1);
				draw_set_font(font_item);
			}
		
	}
	#endregion
	
	
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