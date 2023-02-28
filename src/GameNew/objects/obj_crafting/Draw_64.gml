if (!show_crafting){exit;}
depth = DEPTH_UI;


// Inventory back
draw_sprite_ext(spr_crafting_ui_inv_slotback, 0, invUISlotbackX, invUISlotbackY, 1, 1, 0, c_white, 1);

//Draw crafting type tabs
var i = 0;
repeat(5){
	if (craftingUItabActive[i]){
		draw_sprite(spr_crafting_ui_typetab, (i * 2) + 1, craftingUItabX, craftingUItabY[i]);
	}else{
		draw_sprite(spr_crafting_ui_typetab, (i * 2), craftingUItabX, craftingUItabY[i]);
	}
	i++;
}

i = 0;

// Crafting back
draw_sprite_ext(spr_crafting_ui_slotback, 0, craftingUISlotbackX, craftingUISlotbackY, 1, 1, 0, c_white, 1);

// Inventory row arrows

if (craftRow > 0) {
	draw_sprite(spr_crafting_ui_slotback_arrow, 0, craftingUIArrowX, craftingUIArrowY[0]);
}
if (craftRow < ( (craftSlots / craftSlotsWidth) - craftSlotsHeight)) {
	draw_sprite(spr_crafting_ui_slotback_arrow, 1, craftingUIArrowX, craftingUIArrowY[1]);
}

// Crafting row arrows

if (invRow > 0) {
	draw_sprite(spr_crafting_ui_inv_slotback_arrow, 0, invUIArrowX, craftingUIArrowY[0]);
}
if (invRow < ( (invSlots / invSlotsWidth) - invSlotsHeight)) {
	draw_sprite(spr_crafting_ui_inv_slotback_arrow, 1, invUIArrowX, craftingUIArrowY[1]);
}





// Trash slot
draw_sprite_ext(spr_eq_trashslot, 0, trashSlotX, trashSlotY + y_rel, 1, 1, 0, c_white, 1);
if (onTrashSlot){
	draw_sprite(spr_eq_trashslot, 2, trashSlotX, trashSlotY + y_rel);
}else{
	draw_sprite(spr_eq_trashslot, 1, trashSlotX, trashSlotY + y_rel);
}

//Inventory
var ii, ix, iy, xx, yy, sx, sy, iitem, inv_grid;
ii = 0; ix = 0; iy = 0; inv_grid = obj_inventory.ds_inventory;
var jj = 0;
var wh = c_white;
var bl = c_black;
ii = invRow * invSlotsWidth;
var craft_grid = global.recipes;
	
#region Strona eq
	repeat (invSlotsOnPage){
			
			//x,y slotow
			xx = invUIX + (cell_size * ix);
			yy = invUIY + (cell_size * iy);
		
			//Przedmiot
			iitem = inv_grid[# INVITEM, ii];
			sx = (iitem mod spr_inv_items_columns) * cell_size;
			sy = (iitem div spr_inv_items_columns) * cell_size;
		
			//Rysuj slot i przedmiot
		
			if (iitem > 0) && (inv_grid[# INVAMOUNT, ii] > 0){
				switch(ii){
					case selected_slot_eq:
								// Draw selected slot
								draw_sprite_ext(spr_item_slot_selected, 0, xx, yy - 1, 1, 1, 0, c_white, 1);
								// Draw item
								draw_sprite_part_ext(spr_inventory_items, 0, sx, sy, cell_size, cell_size, xx, yy, 1, 1, c_white, 1);
										
								gpu_set_blendmode(bm_add);
								draw_sprite_part_ext(spr_inventory_items, 0, sx, sy, cell_size, cell_size, xx, yy, 1, 1, c_white, .2);
								gpu_set_blendmode(bm_normal);
					break;
					default:
								if (inv_grid[# INVAMOUNT, ii] > 0){
									draw_sprite_part_ext(spr_inventory_items, 0, sx, sy, cell_size, cell_size, xx, yy, 1, 1, c_white, 1);
								}
					break;
				}
			}
		
			//Rysuj liczbe przedmiotow
			if (iitem > 0){
				var amount = inv_grid[# INVAMOUNT, ii];
				var _cap = inv_grid[# INVCAP, ii];
					
				if (_cap != -1){
					if (inv_grid[# INVTYPE, ii] == itemtype.magazine){
						draw_set_font(global.font_itemnum);
						draw_set_halign(fa_right);
						draw_text_transformed_color(xx + 22, yy + 16, string(_cap), .5, .5, 0, wh, wh, wh, wh, 1);
						draw_set_halign(fa_left);
					}else{
						draw_rectangle_color(xx + 4, yy + 20, xx + 20, yy + 22, bl, bl, bl, bl, false);
						draw_rectangle_color(xx + 4.5, yy + 20.5, xx + 3 + (_cap*3.28) , yy + 21.5, wh, wh, wh, wh, false);
					}
				}else{
					if (amount > 1){
						draw_set_font(global.font_itemnum);
						draw_set_halign(fa_right);
						draw_text_transformed_color(xx + 22, yy + 16, string(amount), .5, .5, 0, wh, wh, wh, wh, 1);
						draw_set_halign(fa_left);
					}
				}
			}

		
		
			//Przelec przez cala siatke przedmiotow
					ii += 1;
					jj += 1;
					ix = ii mod invSlotsWidth;
					iy = jj div invSlotsWidth;
		
	}
	
#endregion

ii = craftRow * craftSlotsWidth;
jj = 0;
ix = 0;
iy = 0;

recipeAmount = ds_grid_height(global.recipes);
var iinfo_grid = obj_inventory.ds_item_info;
var item_all = obj_inventory.ds_item_all;

var _ii = 0;
repeat(5){
	
	if (craftingUItabActive[_ii] == true){

		if (_ii != 0){
			
		
			var j = 0;
			var _am = 0;
			var _from = 0;
			
			
		
			repeat(ds_grid_height(global.recipes)){
				
				if (craft_grid[# C_TYPE, j] == _ii){
					_am++;
					
					
					_from = j;
				}
				
				from = _from - _am + 1;
			
				j++;
			
			}
		
			recipeAmount = _am;
			
		}else{
			from = 0;	
			recipeAmount = ds_grid_height(global.recipes);
		}

		
	}
	
	_ii++;
}

ii = (craftRow * craftSlotsWidth) + from;
//jj = from;
ix = (ii - from) mod craftSlotsWidth;
//iy = jj div craftSlotsWidth;



#region Strona craftingu
	repeat (recipeAmount){
			
			if (ii < 0){
				ii = 0;	
			}
			
			if (ii >= recipeAmount) || (jj >= craftSlotsOnPage){
				break;	
			}
			
			//x,y slotow
			xx = craftUIX + (cell_size * ix);
			yy = craftUIY + (cell_size * iy);
		
			//Przedmiot
			iitem = craft_grid[# C_RES, ii][@ C_ITEM];
			sx = (iitem mod spr_inv_items_columns) * cell_size;
			sy = (iitem div spr_inv_items_columns) * cell_size;
		
			
			
			var ing_amount = array_length(craft_grid[# C_ING, ii]);
			var alpha = 0;
			
			var _i = 0;
			
			var _cancraft = [];
			
			repeat(ing_amount){
				var _item = craft_grid[# C_ING, ii][@ _i][@ C_ITEM];
				var _amount = craft_grid[# C_ING, ii][@ _i][@ C_AMOUNT];
				
				
				var amountInInv = (_item >= CRAFTITEMTYPE) ? itemtype_find_amount(_item - CRAFTITEMTYPE) : item_find_amount(_item);
			
				if (amountInInv >= _amount){
			
					var _type = item_all[# INVTYPE, _item];
			
					if (item_isinsep(_type)){
				
						if (item_find_capacity(_iitem) >= _amount){
					
							_cancraft[_i] = true;
					
						}else{
				
							_cancraft[_i] = false;
				
						}
				
					}else{
				
						_cancraft[_i] = true;
				
					}
			
				}else{
			
					_cancraft[_i] = false;
			
				}
				
				_i++;
			}
			
			_i = 0;
			
			
			
			repeat(ing_amount){
				
				var stationReq = craft_grid[# C_STATION, ii];

				if (currentStation == stationReq){
					alpha = 1;
				}else{
					if (stationReq == craftingStation.craft_basic_1)
					&& ( (currentStation == craftingStation.craft_basic_2) || (currentStation == craftingStation.craft_basic_3) ){
						alpha = 1;
					}else
					if (stationReq == craftingStation.craft_basic_2)
					&& (currentStation == craftingStation.craft_basic_3){
						alpha = 1;
					}else
					if (stationReq == craftingStation.cooking_1)
					&& ( (currentStation == craftingStation.cooking_2) || (currentStation == craftingStation.cooking_3) ){
						alpha = 1;
					}else
					if (stationReq == craftingStation.cooking_2)
					&& (currentStation == craftingStation.cooking_3){
						alpha = 1;
					}else{
						alpha = 0.5;
					}
				}
		
				if (_cancraft[_i] == false){
					alpha = 0.5;
					break;
				}
				_i++;
			}
			
			_i = 0;
			
			//Rysuj slot i przedmiot
		
			if (iitem > 0) && (craft_grid[# C_RES, ii][@ C_AMOUNT] > 0){
				switch(ii){
					case selected_slot_craft:
								// Draw selected slot
								draw_sprite_ext(spr_crafting_ui_slot_selected, 0, xx, yy, 1, 1, 0, c_white, 1);
								// Draw item
								draw_sprite_part_ext(spr_inventory_items, 0, sx, sy, cell_size, cell_size, xx, yy, 1, 1, c_white, alpha);
										
								gpu_set_blendmode(bm_add);
								draw_sprite_part_ext(spr_inventory_items, 0, sx, sy, cell_size, cell_size, xx, yy, 1, 1, c_white, .2);
								gpu_set_blendmode(bm_normal);
					break;
					default:
								if (craft_grid[# C_RES, ii][@ C_AMOUNT] > 0){
									draw_sprite_part_ext(spr_inventory_items, 0, sx, sy, cell_size, cell_size, xx, yy, 1, 1, c_white, alpha);
								}
					break;
				}
			}
			
			
		
			//Rysuj liczbe przedmiotow
			if (iitem > 0){
				var amount = craft_grid[# C_RES, ii][@ C_AMOUNT];
				var _cap = craft_grid[# C_RES, ii][@ C_CAP];
					
				if (_cap != -1){
					if (item_all[# INVTYPE, craft_grid[# C_RES, ii][@ C_ITEM]] == itemtype.magazine){
						draw_set_font(global.font_itemnum);
						draw_set_halign(fa_right);
						draw_text_transformed_color(xx + 22, yy + 16, string(_cap), .5, .5, 0, wh, wh, wh, wh, alpha);
						draw_set_halign(fa_left);
					}else{
						draw_set_alpha(alpha);
						draw_rectangle_color(xx + 4, yy + 20, xx + 20, yy + 22, bl, bl, bl, bl, false);
						draw_rectangle_color(xx + 4.5, yy + 20.5, xx + 3 + (_cap*3.28) , yy + 21.5, wh, wh, wh, wh, false);
						draw_set_alpha(1);
					}
				}else{
					if (amount > 1){
						draw_set_font(global.font_itemnum);
						draw_set_halign(fa_right);
						draw_text_transformed_color(xx + 22, yy + 16, string(amount), .5, .5, 0, wh, wh, wh, wh, alpha);
						draw_set_halign(fa_left);
					}
				}
			}
		
		
			//Przelec przez cala siatke przedmiotow
					ii += 1;
					jj += 1;
					ix = (ii - from) mod craftSlotsWidth;
					iy = jj div craftSlotsWidth;
		
	}
	
#endregion


var selslot_x = craftUIX + (craftSlotSelectedX * cell_size);
var selslot_y = craftUIY + (craftSlotSelectedY * cell_size);
if (craftSlotSelected != -1){
	draw_sprite(spr_crafting_ui_selected, 0, selslot_x, selslot_y);
}

#region Crafting info

	if (craftSlotSelected != -1){
		
		var name = "";
		var description = "";
		var type = "";
		var hp = 0;
		var stamina = 0;
		var defence = 0;
		var damage = 0;
		var level = 0;
		if (craftSlotSelected >= 0) && (craftSlotSelected < craftSlots){
			iitem = craft_grid[# C_RES, craftSlotSelected][@ C_ITEM];
		}else{
			iitem = 0;	
		}

		
		// Crafting station requirements
		
		var stationReq = craft_grid[# C_STATION, craftSlotSelected];
		
		switch(stationReq){
			case craftingStation.none:
				stationIm = 3;
			break;
			case craftingStation.craft_basic_1:
				stationIm = 0;
			break;
			case craftingStation.craft_basic_2:
				stationIm = 1;
			break;
			case craftingStation.craft_basic_3:
				stationIm = 2;
			break;
			case craftingStation.cooking_1:
				stationIm = 0;
			break;
			case craftingStation.cooking_2:
				stationIm = 1;
			break;
			case craftingStation.cooking_3:
				stationIm = 2;
			break;
		}
		
		draw_sprite(spr_crafting_ui_station_req, stationIm, stationX, stationY);
		
		//Infobox
		var infobox_x, infobox_width, infobox_y, infobox_height,
		name_x, name_y, type_x, type_y, desc_x, desc_y,
		hp_x = 0, hp_y = 0, hp_h = 0, stamina_x = 0, stamina_y = 0, stamina_h = 0,
		defence_x = 0, defence_y = 0, defence_h = 0, damage_x = 0, damage_y = 0, damage_h = 0,
		level_x = 0, level_y = 0, level_h = 0,
	
		infobox_x = 248;
		infobox_y = 64;
		
		infobox_width = 130;
		infobox_height = 144;
		
		var infobox_half = (infobox_x + (infobox_width)/2);
	
		//Nazwa przedmiotu
		name = (iinfo_grid[# 0, iitem]);
		var namestr = scribble(name);
		var name_scale = 0.5;
		
		//Rodzaj przedmiotu
		type = iinfo_grid[# 2, item_all[# INVTYPE, iitem]];
		var typestr = scribble(type);
		var type_scale = 0.25;
		
		//Opis przedmiotu
		description = iinfo_grid[# 1, iitem];
		var descstr = scribble(description);
		var desc_scale = 0.5;
	
	
		//Leczone HP
		hp = item_all[# INVHP, iitem];
	
		//Leczona energia
		stamina = item_all[# INVSTAMINA, iitem];
		
		//Armor
		defence = item_all[# INVDEFENCE, iitem];
		
		//Damage
		damage = item_all[# INVDAMAGE, iitem];
		
		//Level
		level = craft_grid[# C_RES, craftSlotSelected][@ C_LVL];
		
		//Effects
		var effect1 = -1, effect2 = -1, effect3 = -1;
		var effect1_x = 0, effect1_y = 0;
		var effect2_x = 0, effect2_y = 0;
		var effect3_x = 0, effect3_y = 0;
		var effect_height = 0;
		
		var efx_num = ds_grid_height(item_all[# INVEFFECTS, iitem]);
		
		switch(efx_num){
			case 1:
				effect1 = item_all[# INVEFFECTS, iitem][# EF_EFFECT, 0];
			break;
			case 2:
				effect1 = item_all[# INVEFFECTS, iitem][# EF_EFFECT, 0];
				effect2 = item_all[# INVEFFECTS, iitem][# EF_EFFECT, 1];
			break;
			case 3:
				effect1 = item_all[# INVEFFECTS, iitem][# EF_EFFECT, 0];
				effect2 = item_all[# INVEFFECTS, iitem][# EF_EFFECT, 1];
				effect3 = item_all[# INVEFFECTS, iitem][# EF_EFFECT, 2];
			break;
			default:
				effect1 = -1;
				effect2 = -1;
				effect3 = -1;
			break;
		}
		
		
		
		//Rysuj nazwe
		namestr.starting_format("font_item", bl);
		namestr.align(fa_center, fa_top);
		namestr.transform(name_scale, name_scale, 0);
		namestr.fit_to_box( ((infobox_width - 6) * 1/name_scale), 48, false);
		namestr.blend(c_white, 1);
		namestr.draw(infobox_half, infobox_y);
		
		
		//Rysuj typ
		typestr.starting_format("font_item", bl);
		typestr.align(fa_center, fa_top);
		typestr.transform(type_scale, type_scale, 0);
		typestr.wrap( ((infobox_width - 6) * 1/type_scale), 12, false);
		typestr.blend(c_white, 1);
		typestr.draw(infobox_half, infobox_y + namestr.get_height()*name_scale + 4);
		
		
		//Rysuj opis
		descstr.starting_format("font_dialogue", bl);
		descstr.align(fa_center, fa_top);
		descstr.transform(desc_scale, desc_scale, 0);
		descstr.fit_to_box( ((infobox_width - 6) * 1/desc_scale), 96, false);
		descstr.blend(c_white, 1);
		descstr.draw(infobox_half, infobox_y + namestr.get_height()*name_scale + + typestr.get_height()*type_scale + 8);
		
		hp_x = infobox_half - 32;
		stamina_x = infobox_half - 32;
		
		var _h = infobox_y + namestr.get_height()*name_scale + typestr.get_height()*type_scale + descstr.get_height()*desc_scale + 16;
		var _h2 = 0;
		
		if (hp != 0) && (stamina != 0){
			hp_y = _h;
			stamina_y = _h + 8;
			_h2 = 16;
		}else{
			stamina_y = _h;
			hp_y = _h;
			_h2 = 0;
		}
		switch(efx_num){
			case 1:
				effect1_x = infobox_half + 18;
				effect1_y = _h;
			break;
			case 2:
				effect1_x = infobox_half + 18;
				effect1_y = _h;
				effect2_x = infobox_half + 18;
				effect2_y = _h + 8;
			break;
			case 3:
				effect1_x = infobox_half + 18;
				effect1_y = _h;
				effect2_x = infobox_half + 18;
				effect2_y = _h + 8;
				effect3_x = infobox_half + 18;
				effect3_y = _h + 16;
				_h2 = 24;
			break;
			default:
					
			break;
		}
		
		//Rysuj HP
		if (hp != 0) 
		&& (item_all[# INVTYPE, craft_grid[# C_RES, craftSlotSelected][@ C_ITEM]] != itemtype.handgun)
		&& (item_all[# INVTYPE, craft_grid[# C_RES, craftSlotSelected][@ C_ITEM]] != itemtype.shotgun){
			draw_sprite_ext(spr_inventory_item_stat, 0, hp_x, hp_y, .5, .5, 0, c_white, 1);
			var hpstr = scribble(hp);
			hpstr.starting_format("font_dialogue", bl);
			hpstr.align(fa_left, fa_center);
			hpstr.transform(.5, .5, 0);
			hpstr.draw(hp_x + 5, hp_y + 1);
		}
		//Rysuj energie
		if (stamina != 0){
			draw_sprite_ext(spr_inventory_item_stat, 1, stamina_x, stamina_y, .5, .5, 0, c_white, 1);
			var ststr = scribble(stamina);
			ststr.starting_format("font_dialogue", bl);
			ststr.align(fa_left, fa_center);
			ststr.transform(.5, .5, 0);
			ststr.draw(stamina_x + 5, stamina_y + 1);
		}
		
		//Rysuj efekty
		
		switch(efx_num){
			case 1:
				draw_sprite_ext(spr_inventory_item_effects, (item_all[# INVEFFECTS, iitem][# EF_EFFECT, 0]) - 1, effect1_x, effect1_y, .5, .5, 0, c_white, 1);
				var ef1 = item_all[# INVEFFECTS, iitem][# EF_DURATION, 0];
				var ef1a = (string_length(string(ef1 % 60)) == 1) ? "0" + string(ef1 % 60) : string(ef1 % 60);
				var ef1_t = string(floor(ef1/60)) + ":" + ef1a;
				var ef1str = scribble(ef1_t);
				ef1str.starting_format("font_dialogue", bl);
				ef1str.align(fa_left, fa_center);
				ef1str.transform(.5, .5, 0);
				ef1str.draw(effect1_x+ 10, effect1_y + 2);
				draw_sprite_ext(spr_inventory_item_effects_amp, (item_all[# INVEFFECTS, iitem][# EF_AMPLIFIER, 0]) - 1, effect1_x - 8, effect1_y, .5, .5, 0, c_white, 1);
			break;
			case 2:
				draw_sprite_ext(spr_inventory_item_effects, (item_all[# INVEFFECTS, iitem][# EF_EFFECT, 0]) - 1, effect1_x, effect1_y, .5, .5, 0, c_white, 1);
				var ef1 = item_all[# INVEFFECTS, iitem][# EF_DURATION, 0];
				var ef1a = (string_length(string(ef1 % 60)) == 1) ? "0" + string(ef1 % 60) : string(ef1 % 60);
				var ef1_t = string(floor(ef1/60)) + ":" + ef1a;
				var ef1str = scribble(ef1_t);
				ef1str.starting_format("font_dialogue", bl);
				ef1str.align(fa_left, fa_center);
				ef1str.transform(.5, .5, 0);
				ef1str.draw(effect1_x+ 10, effect1_y + 2);
				draw_sprite_ext(spr_inventory_item_effects_amp, (item_all[# INVEFFECTS, iitem][# EF_AMPLIFIER, 0]) - 1, effect1_x - 8, effect1_y, .5, .5, 0, c_white, 1);
				
				draw_sprite_ext(spr_inventory_item_effects, (item_all[# INVEFFECTS, iitem][# EF_EFFECT, 1]) - 1, effect2_x, effect2_y, .5, .5, 0, c_white, 1);
				var ef2 = item_all[# INVEFFECTS, iitem][# EF_DURATION, 1];
				var ef2a = (string_length(string(ef2 % 60)) == 1) ? "0" + string(ef2 % 60) : string(ef2 % 60);
				var ef2_t = string(floor(ef2/60)) + ":" + ef2a;
				var ef2str = scribble(ef2_t);
				ef2str.starting_format("font_dialogue", bl);
				ef2str.align(fa_left, fa_center);
				ef2str.transform(.5, .5, 0);
				ef2str.draw(effect2_x+ 10, effect2_y + 2);
				draw_sprite_ext(spr_inventory_item_effects_amp, (item_all[# INVEFFECTS, iitem][# EF_AMPLIFIER, 1]) - 1, effect2_x - 8, effect2_y, .5, .5, 0, c_white, 1);
			break;
			case 3:
				draw_sprite_ext(spr_inventory_item_effects, (item_all[# INVEFFECTS, iitem][# EF_EFFECT, 0]) - 1, effect1_x, effect1_y, .5, .5, 0, c_white, 1);
				var ef1 = item_all[# INVEFFECTS, iitem][# EF_DURATION, 0];
				var ef1a = (string_length(string(ef1 % 60)) == 1) ? "0" + string(ef1 % 60) : string(ef1 % 60);
				var ef1_t = string(floor(ef1/60)) + ":" + ef1a;
				var ef1str = scribble(ef1_t);
				ef1str.starting_format("font_dialogue", bl);
				ef1str.align(fa_left, fa_center);
				ef1str.transform(.5, .5, 0);
				ef1str.draw(effect1_x+ 10, effect1_y + 2);
				draw_sprite_ext(spr_inventory_item_effects_amp, (item_all[# INVEFFECTS, iitem][# EF_AMPLIFIER, 0]) - 1, effect1_x - 8, effect1_y, .5, .5, 0, c_white, 1);
				
				draw_sprite_ext(spr_inventory_item_effects, (item_all[# INVEFFECTS, iitem][# EF_EFFECT, 1]) - 1, effect2_x, effect2_y, .5, .5, 0, c_white, 1);
				var ef2 = item_all[# INVEFFECTS, iitem][# EF_DURATION, 1];
				var ef2a = (string_length(string(ef2 % 60)) == 1) ? "0" + string(ef2 % 60) : string(ef2 % 60);
				var ef2_t = string(floor(ef2/60)) + ":" + ef2a;
				var ef2str = scribble(ef2_t);
				ef2str.starting_format("font_dialogue", bl);
				ef2str.align(fa_left, fa_center);
				ef2str.transform(.5, .5, 0);
				ef2str.draw(effect2_x+ 10, effect2_y + 2);
				draw_sprite_ext(spr_inventory_item_effects_amp, (item_all[# INVEFFECTS, iitem][# EF_AMPLIFIER, 1]) - 1, effect2_x - 8, effect2_y, .5, .5, 0, c_white, 1);
				
				draw_sprite_ext(spr_inventory_item_effects, (item_all[# INVEFFECTS, iitem][# EF_EFFECT, 2]) - 1, effect3_x, effect3_y, .5, .5, 0, c_white, 1);
				var ef3 = item_all[# INVEFFECTS, iitem][# EF_DURATION, 1];
				var ef3a = (string_length(string(ef3 % 60)) == 1) ? "0" + string(ef2 % 60) : string(ef3 % 60);
				var ef3_t = string(floor(ef3/60)) + ":" + ef3a;
				var ef3str = scribble(ef3_t);
				ef3str.starting_format("font_dialogue", bl);
				ef3str.align(fa_left, fa_center);
				ef3str.transform(.5, .5, 0);
				ef3str.draw(effect3_x+ 10, effect3_y + 2);
				draw_sprite_ext(spr_inventory_item_effects_amp, (item_all[# INVEFFECTS, iitem][# EF_AMPLIFIER, 1]) - 1, effect3_x - 8, effect3_y, .5, .5, 0, c_white, 1);
			break;
			default:
			
			break;
		}
		
		
		// Ingredients
		
		var _i = 0;
		
		var ing_amount = array_length(craft_grid[# C_ING, craftSlotSelected]);
		
		//craft_grid[# C_ING, craftSlotSelected][@ _i][@ C_ITEM]
		//craft_grid[# C_ING, craftSlotSelected][@ _i][@ C_AMOUNT]
		
		var ing_w = 252;
		var ing_h = _h + _h2;
		
		var ing_x = [];
		var ing_y = [];
		var ing_alpha = [];
		
		ing_x[0] = ing_w;
		ing_y[0] = ing_h;
		
		ing_x[1] = ing_w + 40;
		ing_y[1] = ing_h;
		
		ing_x[2] = ing_w + 40 + 40;
		ing_y[2] = ing_h;
		
		ing_x[3] = ing_w;
		ing_y[3] = ing_h + 12;
		
		ing_x[4] = ing_w + 40;
		ing_y[4] = ing_h + 12;
		
		ing_x[5] = ing_w + 40 + 40;
		ing_y[5] = ing_h + 12;
		
		ing_x[6] = ing_w;
		ing_y[6] = ing_h + 12 + 12;
		
		ing_x[7] = ing_w + 40;
		ing_y[7] = ing_h + 12 + 12;
		
		ing_x[8] = ing_w + 40 + 40;
		ing_y[8] = ing_h + 12 + 12;
		
		repeat(ing_amount){
			
			var _iitem = craft_grid[# C_ING, craftSlotSelected][@ _i][@ C_ITEM];
			var _amount = craft_grid[# C_ING, craftSlotSelected][@ _i][@ C_AMOUNT];
			var _sx = (_iitem mod spr_inv_items_columns) * cell_size;
			var _sy = (_iitem div spr_inv_items_columns) * cell_size;
			var _sx_type = ((_iitem - CRAFTITEMTYPE) mod (sprite_get_width(spr_inventory_items_types)/cell_size)) * cell_size;
			var _sy_type = ((_iitem - CRAFTITEMTYPE) div (sprite_get_width(spr_inventory_items_types)/cell_size)) * cell_size;
			var _name = 0;
			
			if (_iitem >= CRAFTITEMTYPE){
				
				_name = iinfo_grid[# 2, _iitem - CRAFTITEMTYPE];
				
			}else{
			
				_name = (iinfo_grid[# 0, _iitem]);
			
			}
			
			var amountInInv = (_iitem >= CRAFTITEMTYPE) ? itemtype_find_amount(_iitem - CRAFTITEMTYPE) : item_find_amount(_iitem);
			
			if (amountInInv >= _amount){
				ing_alpha[_i] = 1;
			}else{
				ing_alpha[_i] = .5;
			}
			
			// Draw ingredient sprite
			if (_iitem >= CRAFTITEMTYPE){
				
				draw_sprite_part_ext(spr_inventory_items_types, 0, _sx_type, _sy_type, 24, 24, ing_x[_i], ing_y[_i], .5, .5, c_white, ing_alpha[_i]);
				
			}else{
				
				draw_sprite_part_ext(spr_inventory_items, 0, _sx, _sy, 24, 24, ing_x[_i], ing_y[_i], .5, .5, c_white, ing_alpha[_i]);
				
			}
			
			
			
			// Draw needed amount
			var _amstr = scribble(_amount);
			_amstr.starting_format("font_dialogue", bl);
			_amstr.align(fa_left, fa_middle);
			_amstr.transform(.5, .5, 0);
			_amstr.blend(c_white, ing_alpha[_i]);
			_amstr.draw(ing_x[_i] + 12, ing_y[_i] + 7);
			
			// Draw name
			var _namestr = scribble(_name);
			_namestr.starting_format("font_dialogue", bl);
			_namestr.align(fa_left, fa_middle);
			_namestr.transform(.5, .5, 0);
			_namestr.scale_to_box(46, 24, false);
			_namestr.blend(c_white, ing_alpha[_i]);
			_namestr.draw(ing_x[_i] + 20, ing_y[_i] + 7);
			draw_set_alpha(1);
			
			_i++;
		}
		
		// Draw crafting button
		if (craftButtonActive){
			if (isbounded(mousex, craftButtonX, craftButtonX + 32))
			&& (isbounded(mousey, craftButtonY, craftButtonY + 16)){
				draw_sprite(spr_crafting_ui_craftbutton, 2, craftButtonX, craftButtonY);
			}else{
				draw_sprite(spr_crafting_ui_craftbutton, 1, craftButtonX, craftButtonY);
			}
		}else{
			draw_sprite(spr_crafting_ui_craftbutton, 0, craftButtonX, craftButtonY);
		}
		
	}
	
	

#endregion

#region Rysowanie opisu przedmiotow w ekwipunku
	var name = "";
	var type = "";
	if (selected_slot_eq >= 0) && (selected_slot_eq < invSlots){
		iitem = inv_grid[# INVITEM, selected_slot_eq];
	}else{
		iitem = 0;	
	}


	if (iitem > 0) && (multipick == 0){
	
		//Infobox
		var infobox_x, infobox_width,
		name_x, name_y, type_x, type_y;
	
		infobox_x = mousex + 8;
		infobox_y = mousey + 8;
		
		infobox_width = cell_size * 4;
	
		var hfix = 0;
	
		//Nazwa przedmiotu
		name = (iinfo_grid[# 0, iitem]);
		var namestr = scribble(name);
		var name_scale = 0.5;
		
		//Rodzaj przedmiotu
		type = iinfo_grid[# 2, inv_grid[# INVTYPE, selected_slot_eq]];
		var typestr = scribble(type);
		var type_scale = 0.25;
		
		if (infobox_x + infobox_width > GAMEWIDTH){
			infobox_x = mousex - 8 - infobox_width;
		}
		
		var infobox_half = (infobox_x + infobox_width/2);
		
		infobox_height = ( namestr.get_height() * name_scale ) + ( typestr.get_height() * type_scale ) + 12;
		
		var infobox_descheight = ( namestr.get_height() * name_scale ) + ( typestr.get_height() * type_scale ) + 24;

		if (infobox_y + infobox_height >= GAMEHEIGHT){
			infobox_y = (GAMEHEIGHT - infobox_height);
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
	
	}
#endregion

#region Rysowanie przedmiotow przenoszonych
if (multipick != 0) && (inhand != -1){
	
	
		var itemall = obj_inventory.ds_item_all;
		
		//Przedmiot
		iitem = inhand;
		
		sx = (iitem mod spr_inv_items_columns) * cell_size;
		sy = (iitem div spr_inv_items_columns) * cell_size;
		
		draw_sprite_part_ext(spr_inventory_items, 0, sx, sy, cell_size, cell_size, mousex, mousey, 1, 1, c_white, 1);
		var inuma = multipick;
		var _cap = cap;
			
		if (itemall[# INVTYPE, iitem] == itemtype.drink) || (itemall[# INVTYPE, iitem] == itemtype.alcohol){
				draw_rectangle_color(mousex + 4, mousey + 20, mousex + 20, mousey + 22, bl, bl, bl, bl, false);
				draw_rectangle_color(mousex + 4.5, mousey + 20.5, mousex + 3 + (_cap*3.28) , mousey + 21.5, wh, wh, wh, wh, false);
		}else if (itemall[# INVTYPE, iitem] == itemtype.magazine){
				draw_set_font(global.font_itemnum);
				draw_text_transformed_color(mousex + 16, mousey + 16, string(_cap), .5, .5, 0, wh, wh, wh, wh, 1);
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