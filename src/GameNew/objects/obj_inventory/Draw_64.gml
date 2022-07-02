if (show_inventory) && (!show_slots){


	
	draw_set_font(font_item);

	
	////////////////
	//draw_text(16, 64, "page " + string(page));
	//draw_text(16, 64 + 12*1, "sel " + string(selected_slot));
	//draw_text(16, 64 + 12*2, "pckd " + string(picked_slot));
	//draw_text(16, 64 + 12*3, "onep " + string(onepicked_slot));
	//draw_text(16, 64 + 12*4, "mltp " + string(multipick));
	//draw_text(16, 64 + 12*5, "inh " + string(inhand));
	//draw_text(16, 64 + 12*6, "cap " + string(cap));
	////////////////
	

	depth = -2;
	draw_sprite_ext(spr_eq_slotback, 0, backslotUI_x, backslotUI_y + y_rel, scale, scale, 0, c_white, 1);

	var amx = 148;
	var amy = 175;
	//draw_sprite(obj_amadix.head_index, 0, amx, amy);
	//draw_sprite(obj_amadix.hands_index, 0, amx, amy);
	//draw_sprite(obj_amadix.torso_index, 0, amx, amy);
	//draw_sprite(obj_amadix.legs_index, 0, amx, amy);
	//draw_sprite(obj_amadix.boots_index, 0, amx, amy);


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
				iitem = inv_grid[# INVITEM, ii];
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
					var level = inv_grid[# INVLEVEL, ii];
					if (amount != 0){
						if (inv_grid[# INVTYPE, ii] == itemtype.drink) || (inv_grid[# INVTYPE, ii] == itemtype.alcohol){
							draw_rectangle_color(xx + 4, yy + 20, xx + 20, yy + 22, bl, bl, bl, bl, false);
							draw_rectangle_color(xx + 4.5, yy + 20.5, xx + 3 + (amount*3.28) , yy + 21.5, wh, wh, wh, wh, false);
						}else if (inv_grid[# INVITEM, ii] == item.m1911mag){
								draw_set_font(global.font_itemnum);
								draw_set_halign(fa_right);
								draw_text_transformed_color(xx + 22, yy + 16, string(level), .5, .5, 0, wh, wh, wh, wh, 1);
								draw_set_halign(fa_left);
								draw_set_font(font_item);
						}else{
							if (amount > 1){
								draw_set_font(global.font_itemnum);
								draw_set_halign(fa_right);
								draw_text_transformed_color(xx + 22, yy + 16, string(amount), .5, .5, 0, wh, wh, wh, wh, 1);
								draw_set_halign(fa_left);
								draw_set_font(font_item);
							}
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
	if (selected_slot >= 0) && (selected_slot < inv_slots){
		iitem = inv_grid[# 0, selected_slot];
	}else{
		iitem = 0;	
	}

	

	var hflag = false;

	if (iitem > 0) && (multipick == 0){
		//GUI opisu
		//var ibox_x = xUI + (mouse_slotx * cell_size) + (cell_size)/2;//- 20 - 8;
		//var ibox_y = yUI + (mouse_sloty * cell_size) + 24;
	
		//Infobox
		var infobox_x, infobox_y, infobox_width,
		name_x, name_y, type_x, type_y, desc_x, desc_y,
		hp_x = 0, hp_y = 0, hp_h = 0, stamina_x = 0, stamina_y = 0, stamina_h = 0,
		defence_x = 0, defence_y = 0, defence_h = 0, damage_x = 0, damage_y = 0, damage_h = 0,
		level_x = 0, level_y = 0, level_h = 0,
	
		infobox_x = mousex + 8;
		infobox_y = mousey + 8;
		infobox_width = cell_size * 4;
	
		//Nazwa przedmiotu
		name = (iinfo_grid[# INVITEM, iitem]);
		var namestr = scribble(name);
		var name_scale = 0.5;
		
		//Rodzaj przedmiotu
		type = iinfo_grid[# 2, inv_grid[# INVTYPE, selected_slot]];
		var typestr = scribble(type);
		var type_scale = 0.25;
		
		//Opis przedmiotu
		description = iinfo_grid[# 1, iitem];
		var descstr = scribble(description);
		var desc_scale = 0.5;
	
	
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
		
		//Effects
		var effect1 = -1, effect2 = -1, effect3 = -1;
		var effect1_x = 0, effect1_y = 0;
		var effect2_x = 0, effect2_y = 0;
		var effect3_x = 0, effect3_y = 0;
		var effect_height = 0;
		
		var efx_num = ds_grid_height(inv_grid[# INVEFFECTS, selected_slot]);
		
		switch(efx_num){
			case 0:
				
			break;
			case 1:
				effect1 = inv_grid[# INVEFFECTS, selected_slot][# EF_EFFECT, 0];
			break;
			case 2:
				effect1 = inv_grid[# INVEFFECTS, selected_slot][# EF_EFFECT, 0];
				effect2 = inv_grid[# INVEFFECTS, selected_slot][# EF_EFFECT, 1];
			break;
			case 3:
				effect1 = inv_grid[# INVEFFECTS, selected_slot][# EF_EFFECT, 0];
				effect2 = inv_grid[# INVEFFECTS, selected_slot][# EF_EFFECT, 1];
				effect3 = inv_grid[# INVEFFECTS, selected_slot][# EF_EFFECT, 2];
			break;
		}
		/*
		if (inv_grid[# INVEFFECTS, selected_slot] != 0){
			effect1 = inv_grid[# INVEFFECTS, selected_slot][# EF_EFFECT, 0];
			if (inv_grid[# INVEFFECTS, selected_slot][# EF_EFFECT, 1] != 0){
				effect2 = inv_grid[# INVEFFECTS, selected_slot][# EF_EFFECT, 1];
				if (inv_grid[# INVEFFECTS, selected_slot][# EF_EFFECT, 2] != 0){
					effect3 = inv_grid[# INVEFFECTS, selected_slot][# EF_EFFECT, 2];
				}
			}
		}
		*/
		
		if (infobox_x + infobox_width > GAMEWIDTH){
			infobox_x = mousex - 8 - infobox_width;
		}
		var infobox_half = (infobox_x + infobox_width/2);
		
		infobox_height = namestr.get_height()*name_scale + typestr.get_height()*type_scale + descstr.get_height()*desc_scale + 12;
		
		if (infobox_y + infobox_height > GAMEHEIGHT){
			infobox_y = mousey - 8 - infobox_height;
		}
		
		if (inv_grid[# INVTYPE, selected_slot] == itemtype.food)
		|| (inv_grid[# INVTYPE, selected_slot] == itemtype.fruit)
		|| (inv_grid[# INVTYPE, selected_slot] == itemtype.vegetable)
		|| (inv_grid[# INVTYPE, selected_slot] == itemtype.dish)
		|| (inv_grid[# INVTYPE, selected_slot] == itemtype.drink)
		|| (inv_grid[# INVTYPE, selected_slot] == itemtype.alcohol){
			if (hp != 0) && (stamina == 0){
				hp_x = infobox_half - 8;
				infobox_height = namestr.get_height()*name_scale + typestr.get_height()*type_scale + descstr.get_height()*desc_scale + 12 + 20;
				hp_y = infobox_y + infobox_height - 12;
			}
			if (hp == 0) && (stamina != 0){
				stamina_x = infobox_half - 8;
				infobox_height = namestr.get_height()*name_scale + typestr.get_height()*type_scale + descstr.get_height()*desc_scale + 12 + 20;
				stamina_y = infobox_y + infobox_height - 12;
			}
			if (hp != 0) && (stamina != 0){
				hp_x = infobox_half - 22;
				stamina_x = hp_x + 34;
				if (inv_grid[# INVEFFECTS, selected_slot] != 0){
					effect1_x = infobox_half - 8;
					effect1_y = infobox_y + infobox_height + 10;
					effect_height = 20;
					if (inv_grid[# INVEFFECTS, selected_slot][# EF_EFFECT, 1] != 0){
						effect1_x = infobox_half - 28;
						effect2_x = infobox_half + 16;
						effect2_y = infobox_y + infobox_height + 10;
					}
				}
				
				infobox_height = namestr.get_height()*name_scale + typestr.get_height()*type_scale + descstr.get_height()*desc_scale + 12 + 20 + effect_height;
				
				hp_y = infobox_y + infobox_height - 12;
				stamina_y = infobox_y + infobox_height - 12;
			}
		}else
		if (inv_grid[# INVTYPE, selected_slot] == itemtype.resource)
		{
			infobox_height = namestr.get_height()*name_scale + typestr.get_height()*type_scale + descstr.get_height()*desc_scale + 12;
		}else
		if (inv_grid[# INVTYPE, selected_slot] == itemtype.hat)
		|| (inv_grid[# INVTYPE, selected_slot] == itemtype.clothing)
		|| (inv_grid[# INVTYPE, selected_slot] == itemtype.pants)
		|| (inv_grid[# INVTYPE, selected_slot] == itemtype.boots)
		{
			infobox_height = namestr.get_height()*name_scale + typestr.get_height()*type_scale + descstr.get_height()*desc_scale + 12;
		}else
		if (inv_grid[# INVTYPE, selected_slot] == itemtype.melee)
		|| (inv_grid[# INVTYPE, selected_slot] == itemtype.tool)
		{
			infobox_height = namestr.get_height()*name_scale + typestr.get_height()*type_scale + descstr.get_height()*desc_scale + 12;
		}
		
		//Rysuj tlo
		draw_sprite_ext(spr_inventory_desc, 0, infobox_x, infobox_y, infobox_width/cell_size, infobox_height/cell_size, 0, c_white, 1);
		
		//Rysuj nazwe
		namestr.starting_format("font_item", bl);
		namestr.align(fa_center, fa_top);
		namestr.transform(name_scale, name_scale, 0);
		namestr.fit_to_box( ((infobox_width - 6) * 1/name_scale), 48, false);
		namestr.draw(infobox_half, infobox_y + 4);
	
		
		//Rysuj typ
		typestr.starting_format("font_item", bl);
		typestr.align(fa_center, fa_top);
		typestr.transform(type_scale, type_scale, 0);
		typestr.wrap( ((infobox_width - 6) * 1/type_scale), 12, false);
		typestr.draw(infobox_half, infobox_y + namestr.get_height()*name_scale + 4);
		
		
		//Rysuj opis
		descstr.starting_format("font_dialogue", bl);
		descstr.align(fa_center, fa_top);
		descstr.transform(desc_scale, desc_scale, 0);
		descstr.wrap( ((infobox_width - 6) * 1/desc_scale), 128, false);
		descstr.draw(infobox_half, infobox_y + namestr.get_height()*name_scale + typestr.get_height()*type_scale + 8);
		
		
		//Rysuj HP
		if (hp != 0){
			draw_sprite(spr_inventory_item_stat, 0, hp_x, hp_y);
			var hpstr = scribble(hp);
			hpstr.starting_format("font_dialogue", bl);
			hpstr.align(fa_left, fa_center);
			hpstr.transform(1, 1, 0);
			hpstr.draw(hp_x + 10, hp_y + 2);
		}
		//Rysuj energie
		if (stamina != 0){
			draw_sprite(spr_inventory_item_stat, 1, stamina_x, stamina_y);
			var ststr = scribble(stamina);
			ststr.starting_format("font_dialogue", bl);
			ststr.align(fa_left, fa_center);
			ststr.transform(1, 1, 0);
			ststr.draw(stamina_x + 10, stamina_y + 2);
		}
		
		//Rysuj efekty
		if (inv_grid[# INVEFFECTS, selected_slot] != 0){
			draw_sprite(spr_inventory_item_effects, (inv_grid[# INVEFFECTS, selected_slot][# EF_EFFECT, 0]) - 1, effect1_x, effect1_y);
			var ef1 = inv_grid[# INVEFFECTS, selected_slot][# EF_DURATION, 0];
			var ef1a = (string_length(string(ef1 % 60)) == 1) ? "0" + string(ef1 % 60) : string(ef1 % 60);
			var ef1_t = string(floor(ef1/60)) + ":" + ef1a;
			var ef1str = scribble(ef1_t);
			ef1str.starting_format("font_dialogue", bl);
			ef1str.align(fa_left, fa_center);
			ef1str.transform(.5, .5, 0);
			ef1str.draw(effect1_x+ 10, effect1_y + 2);
			draw_sprite(spr_inventory_item_effects_amp, (inv_grid[# INVEFFECTS, selected_slot][# EF_AMPLIFIER, 0]) - 1, effect1_x + 8, effect1_y + 8);
			
			if (inv_grid[# INVEFFECTS, selected_slot][# EF_EFFECT, 1] != 0){
				draw_sprite(spr_inventory_item_effects, (inv_grid[# INVEFFECTS, selected_slot][# EF_EFFECT, 1]) - 1, effect2_x, effect2_y);
				var ef2 = inv_grid[# INVEFFECTS, selected_slot][# EF_DURATION, 1];
				var ef2a = (string_length(string(ef2 % 60)) == 1) ? "0" + string(ef2 % 60) : string(ef2 % 60);
				var ef2_t = string(floor(ef2/60)) + ":" + ef2a;
				var ef2str = scribble(ef2_t);
				ef2str.starting_format("font_dialogue", bl);
				ef2str.align(fa_left, fa_center);
				ef2str.transform(.5, .5, 0);
				ef2str.draw(effect2_x+ 10, effect2_y + 2);
				draw_sprite(spr_inventory_item_effects_amp, (inv_grid[# INVEFFECTS, selected_slot][# EF_AMPLIFIER, 1]) - 1, effect2_x + 8, effect2_y + 8);
			}
		}
		
		hflag = true;
		
		/*
		//Rysuj ()
		if (hp > 0) || (stamina > 0){
			var ibox_height = name_height + type_height + desc_height + 8;
		}else{
			var ibox_height = name_height + type_height + desc_height - 8;
		}
		
		if (ibox_y + ibox_height > GAMEHEIGHT){
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
	if (multipick != 0){
	
			//Przedmiot
			iitem = inhand;
			sx = (iitem mod spr_inv_items_columns) * cell_size;
			sy = (iitem div spr_inv_items_columns) * cell_size;
			scr_draw_item(sx, sy, mousex, mousey, 1);
			var inuma = multipick;
			var _level = cap;
			
			if (ds_item_all[# INVTYPE, iitem] == itemtype.drink) || (ds_item_all[# INVTYPE, iitem] == itemtype.alcohol){
				draw_rectangle_color(mousex + 4, mousey + 20, mousex + 20, mousey + 22, bl, bl, bl, bl, false);
				draw_rectangle_color(mousex + 4.5, mousey + 20.5, mousex + 3 + (inuma*3.28) , mousey + 21.5, wh, wh, wh, wh, false);
			}else if (ds_item_all[# INVTYPE, iitem] == itemtype.magazine){
					draw_set_font(global.font_itemnum);
					draw_text_transformed_color(mousex + 16, mousey + 16, string(_level), .5, .5, 0, wh, wh, wh, wh, 1);
					draw_set_font(font_item);
			}else{
				if (inuma > 1){
					draw_set_font(global.font_itemnum);
					draw_text_transformed_color(mousex + 16, mousey + 16, string(inuma), .5, .5, 0, wh, wh, wh, wh, 1);
					draw_set_font(font_item);
				}
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
	
	if (selected_slot >= 0) && (selected_slot < inv_slots){
		iitem = inv_grid[# 0, selected_slot];
	}else{
		iitem = 0;	
	}

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
						var level = inv_grid[# INVLEVEL, ii];
						if (amount != 0){
							if (inv_grid[# INVTYPE, ii] == itemtype.drink) || (inv_grid[# INVTYPE, ii] == itemtype.drink){
								draw_rectangle_color(xx + 4, yy + 20, xx + 20, yy + 22, bl, bl, bl, bl, false);
								draw_rectangle_color(xx + 4.5, yy + 20.5, xx + 3 + (amount*3.28) , yy + 21.5, wh, wh, wh, wh, false);
							}else if (inv_grid[# INVITEM, ii] == item.m1911mag){
									draw_set_font(global.font_itemnum);
									draw_set_halign(fa_right);
									draw_text_transformed_color(xx + 22, yy + 16, string(level), .5, .5, 0, wh, wh, wh, wh, 1);
									draw_set_halign(fa_left);
									draw_set_font(font_item);
							}else{
								if (amount > 1){
									draw_set_font(global.font_itemnum);
									draw_set_halign(fa_right);
									draw_text_transformed_color(xx + 22, yy + 16, string(amount), .5, .5, 0, wh, wh, wh, wh, 1);
									draw_set_halign(fa_left);
									draw_set_font(font_item);
								}
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