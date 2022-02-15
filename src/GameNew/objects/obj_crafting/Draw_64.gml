if (!show_crafting){exit;}

draw_sprite_ext(spr_inventory_hud_back, 0, craft_slot_x, craft_slot_y - 4, 1, 1, 0, c_white, 1);
draw_sprite_ext(spr_inventory_hud, 0, craft_slot_x, craft_slot_y, 1, 1, 0, c_white, 1);

draw_set_font(font_item);
	var ii, ix, iy, xx, yy, sx, sy, iitem;
	ii = 0;
	ix = 0;
	iy = 0;
	var wh = c_white;
	var bl = c_black;

	repeat(craft_slots){
		
	    //x,y slotow
	    xx = slots_x + ((cell_size) * ix);
	    yy = slots_y + ((cell_size) * iy);

	    //Przedmiot
		if (ii < ds_grid_height(global.recipes)){
			iitem = global.recipes[# 0, ii][? "result"];
		}else{
			iitem = 0;	
		}
		var sx = (iitem mod obj_inventory.spr_inv_items_columns) * 24;
		var sy = (iitem div obj_inventory.spr_inv_items_columns) * 24;
	    //Rysuj slot i przedmiot

	    if (iitem > 0) && (global.recipes[# 0, ii][? "result"] > 0) {
	        switch (ii) {
	            case selected_slot:

	                draw_sprite_ext(obj_inventory.spr_inv_slot_selected, 0, xx, yy, 1, 1, 0, c_white, 1);
	                draw_sprite_part_ext(obj_inventory.spr_inv_items, 0, sx, sy, cell_size, cell_size, xx, yy, 1, 1, c_white, 1);
					gpu_set_blendmode(bm_add);
	                draw_sprite_ext(obj_inventory.spr_inv_slot_nonexistent, 0, xx, yy, 1, 1, 0, c_white, 0.3);
					gpu_set_blendmode(bm_normal);

	                break;
	            default:
	                if (global.recipes[# 0, ii][? "result"] > 0) {
	                    draw_sprite_ext(obj_inventory.spr_inv_slot_none, 0, xx, yy, 1, 1, 0, c_white, 1);
	                    draw_sprite_part_ext(obj_inventory.spr_inv_items, 0, sx, sy, cell_size, cell_size, xx, yy, 1, 1, c_white, 1);
	                }
	                break;
	        }
	    }

	    //Rysuj liczbe przedmiotow
	    if (iitem > 0) {
			var amount = global.recipes[# 0, ii][? "amount"];
	        if (amount < 0) || (amount > 1) {
	            switch (ii) {
	                case selected_slot:
	                    draw_text_transformed_color(xx + 16, yy + 12, string(amount), .75, .75, 0, bl, bl, bl, bl, 1);
	                    break;
	                default:
	                    draw_text_transformed_color(xx + 16, yy + 12, string(amount), .75, .75, 0, bl, bl, bl, bl, 1);
	                    break;
	            }
	        }

	    }

	    //Przelec przez cala siatke przedmiotow
	    ii += 1;
	    ix = ii mod craft_slots_width;
	    iy = ii div craft_slots_width;
	}
	
	//Rysowanie GUI
	
	var iinfo_grid = obj_inventory.ds_item_info;
	var name = "";
	var description = "";
	var type = "";
	var hp = 0;
	var stamina = 0;
	if (selected_slot >= 0) && (selected_slot < ds_grid_height(global.recipes)){
		var iitem_2 = global.recipes[# 0, selected_slot][? "result"];
		var amount_2 = global.recipes[# 0, selected_slot][? "amount"];
	}else{
		var iitem_2 = 0;	
		var amount_2 = 0;
	}
	
	draw_text(8, 100, selected_slot);
	draw_text(8, 120, ds_grid_height(global.recipes));
	
	if (selected_slot != -1) && (iitem_2 > 0){
		
		var it = 0;
		craft_info(iitem_2, it);
		it++;
		
		var ing_1, ing_2, ing_3, ing_4, ing_5, ing_6, ing_7, ing_8, ing_9;
		
		//GUI opisu
		var ibox_x = craft_slot_x + (mouse_slotx * cell_size) + (cell_size)/2;//- 20 - 8;
		var ibox_y = craft_slot_y + (mouse_sloty * cell_size) + 24;
	
		//Nazwa przedmiotu
		draw_set_font(font_item_desc);
		name = iinfo_grid[# 0, iitem_2];
		var name_scale = 0.75;
		var name_sep = 12;
		var name_width = 72 * (4/3);
		var name_height = string_height_ext(name, name_sep, name_width);
		
		//Rodzaj przedmiotu
		draw_set_font(font_item_desc);
		type = obj_inventory.ds_item_all[# INVTYPE, iitem_2];
		var type_scale = 0.25;
		var type_sep = 6;
		var type_width = 72 * 4;
		var type_height = string_height(type);
		
		//Opis przedmiotu
		draw_set_font(font_item_desc);
		description = iinfo_grid[# 1, iitem_2];
		var desc_scale = 0.5;
		var desc_sep = 12;
		var desc_width = 72 * 2;
		var desc_height = string_height_ext(description, desc_sep, desc_width * (1/desc_scale));
		
	
	
		//Leczone HP
		draw_set_font(font_item_desc);
		hp = obj_inventory.ds_item_all[# INVHP, iitem_2];
	
		//Leczona energia
		draw_set_font(font_item_desc);
		stamina = obj_inventory.ds_item_all[# INVSTAMINA, iitem_2];
		
		
		//Pobierz informacje o wyniku i ilosci przedmiotow z craftingu
		//Mapa zagniezdzona w siatce
		var sx = (iitem_2 mod obj_inventory.spr_inv_items_columns) * 24;
		var sy = (iitem_2 div obj_inventory.spr_inv_items_columns) * 24;
		
		#region Pobierz informacje o przedmiotach potrzebnych do wytworzenia
	
		var height_var = 0;
		
		//1
		if (ds_grid_height(global.recipes[# 0, selected_slot][? "ingredients"]) >= 1){
			var citem_1 = global.recipes[# 0, selected_slot][? "ingredients"][# INVITEM, 0];
			var camount_1 = global.recipes[# 0, selected_slot][? "ingredients"][# INVAMOUNT, 0];
			var sx_1 = (citem_1 mod obj_inventory.spr_inv_items_columns) * 24;
			var sy_1 = (citem_1 div obj_inventory.spr_inv_items_columns) * 24;
			ing_1 = global.recipes[# 0, selected_slot][? "ingredients"][# INVITEM, 0];
			height_var = 24;
		}
	
		//2
		if (ds_grid_height(global.recipes[# 0, selected_slot][? "ingredients"]) >= 2){
			var citem_2 = global.recipes[# 0, selected_slot][? "ingredients"][# INVITEM, 1];
			var camount_2 = global.recipes[# 0, selected_slot][? "ingredients"][# INVAMOUNT, 1];
			var sx_2 = (citem_2 mod obj_inventory.spr_inv_items_columns) * 24;
			var sy_2 = (citem_2 div obj_inventory.spr_inv_items_columns) * 24;
			ing_2 = global.recipes[# 0, selected_slot][? "ingredients"][# INVITEM, 1];
			height_var = 21 * 2;
		}
	
		//3
		if (ds_grid_height(global.recipes[# 0, selected_slot][? "ingredients"]) >= 3){
			var citem_3 = global.recipes[# 0, selected_slot][? "ingredients"][# INVITEM, 2];
			var camount_3 = global.recipes[# 0, selected_slot][? "ingredients"][# INVAMOUNT, 2];
			var sx_3 = (citem_3 mod obj_inventory.spr_inv_items_columns) * 24;
			var sy_3 = (citem_3 div obj_inventory.spr_inv_items_columns) * 24;
			ing_3 = global.recipes[# 0, selected_slot][? "ingredients"][# INVITEM, 2];
			height_var = 21 * 3;
		}
	
		//4
		if (ds_grid_height(global.recipes[# 0, selected_slot][? "ingredients"]) >= 4){
			var citem_4 = global.recipes[# 0, selected_slot][? "ingredients"][# INVITEM, 3];
			var camount_4 = global.recipes[# 0, selected_slot][? "ingredients"][# INVAMOUNT, 3];
			var sx_4 = (citem_4 mod obj_inventory.spr_inv_items_columns) * 24;
			var sy_4 = (citem_4 div obj_inventory.spr_inv_items_columns) * 24;
			ing_4 = global.recipes[# 0, selected_slot][? "ingredients"][# INVITEM, 3];
			height_var = 21 * 4;
		}
		#endregion
		
		
		
		//Rysuj ()
		if (hp > 0) || (stamina > 0){
			var ibox_height = name_height + type_height + desc_height + 16;
		}else{
			var ibox_height = name_height + type_height + desc_height - 8;
		}
		
		if (ibox_y + ibox_height > obj_display.ideal_height){
			ibox_y = craft_slot_y + (mouse_sloty * cell_size) - ibox_height;
		}
		
		var text_height = name_height + type_height + desc_height + 8;
		
		if string_width_ext(name, name_sep, name_width) > 700{
			var ibox_width = string_width_ext(name, name_sep, name_width)/2;
			var new_desc_width = 72 * 2;
			scr_draw_gui_box_stretch(spr_inventory_desc, ibox_x - ibox_width + 16, ibox_y, ibox_x + ibox_width - 16, ibox_y + ibox_height);
			scr_draw_gui_box_stretch(spr_inventory_desc, ibox_x - ibox_width + 16, ibox_y + ibox_height, ibox_x + ibox_width - 16, ibox_y + ibox_height + height_var);
			
			draw_set_halign(fa_center);
			draw_text_ext_transformed_color(ibox_x + 1, ibox_y + type_height + name_height + 1, description, desc_sep, new_desc_width, desc_scale, desc_scale, 0, c_gray, c_gray, c_gray, c_gray, .35);
			draw_text_ext_transformed_color(ibox_x, ibox_y + type_height + name_height, description, desc_sep, new_desc_width, desc_scale, desc_scale, 0, wh, wh, wh, wh, 1);
			draw_set_halign(fa_left);
			if (hp > 0) && (stamina > 0){
				draw_sprite(spr_inventory_item_stat, 0, ibox_x - 30, ibox_y + text_height - 24);
				draw_text_transformed_color(ibox_x - 30 + 18, ibox_y + text_height + 3 - 24, hp, .75, .75, 0, wh, wh, wh, wh, 1);
				
				draw_sprite(spr_inventory_item_stat, 1, ibox_x, ibox_y + text_height - 24);
				draw_text_transformed_color(ibox_x + 18, ibox_y + text_height + 3 - 24, stamina, .75, .75, 0, wh, wh, wh, wh, 1);
			}else if (hp > 0) && (stamina == 0){
				draw_sprite(spr_inventory_item_stat, 0, ibox_x - 12, ibox_y + text_height - 24);
				draw_text_transformed_color(ibox_x - 12 + 18, ibox_y + text_height + 3 - 24, hp, .75, .75, 0, wh, wh, wh, wh, 1);
			}else if (hp == 0) && (stamina > 0){
				draw_sprite(spr_inventory_item_stat, 1, ibox_x - 12, ibox_y + text_height - 24);
				draw_text_transformed_color(ibox_x - 12 + 18, ibox_y + text_height + 3 - 24, stamina, .75, .75, 0, wh, wh, wh, wh, 1);
			}
		}else{
			var ibox_width = 0;
			scr_draw_gui_box_stretch(spr_inventory_desc, ibox_x - 40, ibox_y, ibox_x + 40, ibox_y + ibox_height);
			scr_draw_gui_box_stretch(spr_inventory_desc, ibox_x - 40, ibox_y + ibox_height, ibox_x + 40, ibox_y + ibox_height + height_var);
			draw_set_halign(fa_center);
			draw_text_ext_transformed_color(ibox_x + 1, ibox_y + name_height + type_height + 1 - 6, description, desc_sep, desc_width, desc_scale, desc_scale, 0, c_gray, c_gray, c_gray, c_gray, .35);
			draw_text_ext_transformed_color(ibox_x, ibox_y + type_height + name_height - 6, description, desc_sep, desc_width, desc_scale, desc_scale, 0, wh, wh, wh, wh, 1);
			draw_set_halign(fa_left);
			if (hp > 0) && (stamina > 0){
				draw_sprite(spr_inventory_item_stat, 0, ibox_x - 30, ibox_y + text_height - 20 + 8);
				draw_text_transformed_color(ibox_x - 30 + 18, ibox_y + text_height + 3 - 20 + 8, hp, .75, .75, 0, wh, wh, wh, wh, 1);
				
				draw_sprite(spr_inventory_item_stat, 1, ibox_x, ibox_y + text_height - 20 + 8);
				draw_text_transformed_color(ibox_x + 18, ibox_y + text_height + 3 - 20 + 8, stamina, .75, .75, 0, wh, wh, wh, wh, 1);
			}else if (hp > 0) && (stamina == 0){
				draw_sprite(spr_inventory_item_stat, 0, ibox_x - 12, ibox_y + text_height - 20);
				draw_text_transformed_color(ibox_x - 12 + 18, ibox_y + text_height + 3 - 20 + 8, hp, .75, .75, 0, wh, wh, wh, wh, 1);
			}else if (hp == 0) && (stamina > 0){
				draw_sprite(spr_inventory_item_stat, 1, ibox_x - 12, ibox_y + text_height - 20);
				draw_text_transformed_color(ibox_x - 12 + 18, ibox_y + text_height + 3 - 20 + 8, stamina, .75, .75, 0, wh, wh, wh, wh, 1);
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
		
		#region Rysuj przedmioty potrzebne do wytworzenia
		
		var ing_scale = 0.5;
		var max_width = 49;
		var height_fix = 0;
		
		//1 przedmiot
		if (ds_grid_height(global.recipes[# 0, selected_slot][? "ingredients"]) == 1){
			//Sprawdz czy istnieje przedmiot w ekwipunku
			var item_alpha = 1;
			if (item_exists_amount( (global.recipes[# 0, selected_slot][? "ingredients"][# INVITEM, 0]) , (global.recipes[# 0, selected_slot][? "ingredients"][# INVAMOUNT, 0]))){
				if (obj_inventory.ds_inventory[# 0, selected_slot] > 0) && (global.recipes[# 0, selected_slot][? "ingredients"][# INVAMOUNT, 0] < ds_grid_height(global.recipes[# 0, selected_slot][? "ingredients"])){
					item_alpha = 0.75;
				}else{
					item_alpha = 1;	
				}
			}else{
				item_alpha = 0.25;	
			}
			//1
			var ing_1_scale = ing_scale;
			
			if (string_width_ext(string(iinfo_grid[# 0, ing_1]), 12, max_width*ing_scale)) > (max_width){ing_1_scale = 0.25; height_fix = 0;}
			
			draw_sprite_part_ext(spr_inventory_items, 0, sx_1, sy_1, 24, 24, ibox_x + (ibox_width/2) - 12 - 24, ibox_y + ibox_height + 2 + 1, .75, .75, c_white, item_alpha);
			draw_text_transformed_color(ibox_x + (ibox_width/2) - 3 - 27, ibox_y + ibox_height + 12 + 1, string(camount_1), .75, .75, 0, c_black, c_black, c_black, c_black, item_alpha);
			draw_text_transformed_color(ibox_x + (ibox_width/2) - 3 - 12, ibox_y + ibox_height + 8 - height_fix + 1, iinfo_grid[# 0, ing_1], ing_scale, ing_scale, 0, c_black, c_black, c_black, c_black, item_alpha);
		}
		//2 przedmioty
		if (ds_grid_height(global.recipes[# 0, selected_slot][? "ingredients"]) == 2){
			//Sprawdz czy istnieje przedmiot w ekwipunku
			var item_alpha = 1;
			var item_alpha2 = 1;
			if (item_exists_amount( (global.recipes[# 0, selected_slot][? "ingredients"][# INVITEM, 0]) , (global.recipes[# 0, selected_slot][? "ingredients"][# INVAMOUNT, 0]))){item_alpha = 1;}else{item_alpha = 0.5;}
			if (item_exists_amount( (global.recipes[# 0, selected_slot][? "ingredients"][# INVITEM, 1]) , (global.recipes[# 0, selected_slot][? "ingredients"][# INVAMOUNT, 1]))){item_alpha2 = 1;}else{item_alpha2 = 0.5;}

			
			//1
			draw_sprite_part_ext(spr_inventory_items, 0, sx_1, sy_1, 24, 24, ibox_x + (ibox_width/2) - 12 - 24, ibox_y + ibox_height + 2 + 1, .75, .75, c_white, item_alpha);
			draw_text_transformed_color(ibox_x + (ibox_width/2) - 3 - 27, ibox_y + ibox_height + 12 + 1, string(camount_1), .75, .75, 0, c_black, c_black, c_black, c_black, item_alpha);
			draw_text_transformed_color(ibox_x + (ibox_width/2) - 3 - 12, ibox_y + ibox_height + 8 - height_fix + 1, iinfo_grid[# 0, ing_1], ing_scale, ing_scale, 0, c_black, c_black, c_black, c_black, item_alpha);
			//2
			draw_sprite_part_ext(spr_inventory_items, 0, sx_2, sy_2, 24, 24, ibox_x + (ibox_width/2) - 12 - 24, ibox_y + ibox_height + 2 + 1 + 18, .75, .75, c_white, item_alpha2);
			draw_text_transformed_color(ibox_x + (ibox_width/2) - 3 - 27, ibox_y + ibox_height + 12 + 1 + 18, string(camount_2), .75, .75, 0, c_black, c_black, c_black, c_black, item_alpha2);
			draw_text_transformed_color(ibox_x + (ibox_width/2) - 3 - 12, ibox_y + ibox_height + 8 - height_fix + 1 + 18, iinfo_grid[# 0, ing_2], ing_scale, ing_scale, 0, c_black, c_black, c_black, c_black, item_alpha2);
		}
		//3 przedmioty
		if (ds_grid_height(global.recipes[# 0, selected_slot][? "ingredients"]) == 3){
			//Sprawdz czy istnieje przedmiot w ekwipunku
			var item_alpha = 1;
			var item_alpha2 = 1;
			var item_alpha3 = 1;
			if (item_exists_amount( (global.recipes[# 0, selected_slot][? "ingredients"][# INVITEM, 0]) , (global.recipes[# 0, selected_slot][? "ingredients"][# INVAMOUNT, 0]))){item_alpha = 1;}else{item_alpha = 0.5;}
			if (item_exists_amount( (global.recipes[# 0, selected_slot][? "ingredients"][# INVITEM, 1]) , (global.recipes[# 0, selected_slot][? "ingredients"][# INVAMOUNT, 1]))){item_alpha2 = 1;}else{item_alpha2 = 0.5;}
			if (item_exists_amount( (global.recipes[# 0, selected_slot][? "ingredients"][# INVITEM, 2]) , (global.recipes[# 0, selected_slot][? "ingredients"][# INVAMOUNT, 2]))){item_alpha3 = 1;}else{item_alpha3 = 0.5;}
			//1
			draw_sprite_part_ext(spr_inventory_items, 0, sx_1, sy_1, 24, 24, ibox_x + (ibox_width/2) - 12 - 24, ibox_y + ibox_height + 2 + 1, .75, .75, c_white, item_alpha);
			draw_text_transformed_color(ibox_x + (ibox_width/2) - 3 - 27, ibox_y + ibox_height + 12 + 1, string(camount_1), .75, .75, 0, c_black, c_black, c_black, c_black, item_alpha);
			draw_text_transformed_color(ibox_x + (ibox_width/2) - 3 - 12, ibox_y + ibox_height + 8 - height_fix + 1, iinfo_grid[# 0, ing_1], ing_scale, ing_scale, 0, c_black, c_black, c_black, c_black, item_alpha);
			//2
			draw_sprite_part_ext(spr_inventory_items, 0, sx_2, sy_2, 24, 24, ibox_x + (ibox_width/2) - 12 - 24, ibox_y + ibox_height + 2 + 1 + 18, .75, .75, c_white, item_alpha2);
			draw_text_transformed_color(ibox_x + (ibox_width/2) - 3 - 27, ibox_y + ibox_height + 12 + 1 + 18, string(camount_2), .75, .75, 0, c_black, c_black, c_black, c_black, item_alpha2);
			draw_text_transformed_color(ibox_x + (ibox_width/2) - 3 - 12, ibox_y + ibox_height + 8 - height_fix + 1 + 18, iinfo_grid[# 0, ing_2], ing_scale, ing_scale, 0, c_black, c_black, c_black, c_black, item_alpha2);
			//3
			draw_sprite_part_ext(spr_inventory_items, 0, sx_3, sy_3, 24, 24, ibox_x + (ibox_width/2) - 12 - 24, ibox_y + ibox_height + 2 + 1 + 18 + 18, .75, .75, c_white, item_alpha3);
			draw_text_transformed_color(ibox_x + (ibox_width/2) - 3 - 27, ibox_y + ibox_height + 12 + 1 + 18 + 18, string(camount_3), .75, .75, 0, c_black, c_black, c_black, c_black, item_alpha3);
			draw_text_transformed_color(ibox_x + (ibox_width/2) - 3 - 12, ibox_y + ibox_height + 8 - height_fix + 1 + 18 + 18, iinfo_grid[# 0, ing_3], ing_scale, ing_scale, 0, c_black, c_black, c_black, c_black, item_alpha3);
		}
		//4 przedmioty
		if (ds_grid_height(global.recipes[# 0, selected_slot][? "ingredients"]) == 4){
			//Sprawdz czy istnieje przedmiot w ekwipunku
			var item_alpha = 1;
			var item_alpha2 = 1;
			var item_alpha3 = 1;
			var item_alpha4 = 1;
			if (item_exists_amount( (global.recipes[# 0, selected_slot][? "ingredients"][# INVITEM, 0]) , (global.recipes[# 0, selected_slot][? "ingredients"][# INVAMOUNT, 0]))){item_alpha = 1;}else{item_alpha = 0.5;}
			if (item_exists_amount( (global.recipes[# 0, selected_slot][? "ingredients"][# INVITEM, 1]) , (global.recipes[# 0, selected_slot][? "ingredients"][# INVAMOUNT, 1]))){item_alpha2 = 1;}else{item_alpha2 = 0.5;}
			if (item_exists_amount( (global.recipes[# 0, selected_slot][? "ingredients"][# INVITEM, 2]) , (global.recipes[# 0, selected_slot][? "ingredients"][# INVAMOUNT, 2]))){item_alpha3 = 1;}else{item_alpha3 = 0.5;}
			if (item_exists_amount( (global.recipes[# 0, selected_slot][? "ingredients"][# INVITEM, 3]) , (global.recipes[# 0, selected_slot][? "ingredients"][# INVAMOUNT, 3]))){item_alpha4 = 1;}else{item_alpha4 = 0.5;}
			//1
			draw_sprite_part_ext(spr_inventory_items, 0, sx_1, sy_1, 24, 24, ibox_x + (ibox_width/2) - 12 - 24, ibox_y + ibox_height + 2 + 1, .75, .75, c_white, item_alpha);
			draw_text_transformed_color(ibox_x + (ibox_width/2) - 3 - 27, ibox_y + ibox_height + 12 + 1, string(camount_1), .75, .75, 0, c_black, c_black, c_black, c_black, item_alpha);
			draw_text_transformed_color(ibox_x + (ibox_width/2) - 3 - 12, ibox_y + ibox_height + 8 - height_fix + 1, iinfo_grid[# 0, ing_1], ing_scale, ing_scale, 0, c_black, c_black, c_black, c_black, item_alpha);
			//2
			draw_sprite_part_ext(spr_inventory_items, 0, sx_2, sy_2, 24, 24, ibox_x + (ibox_width/2) - 12 - 24, ibox_y + ibox_height + 2 + 1 + 18, .75, .75, c_white, item_alpha2);
			draw_text_transformed_color(ibox_x + (ibox_width/2) - 3 - 27, ibox_y + ibox_height + 12 + 1 + 18, string(camount_2), .75, .75, 0, c_black, c_black, c_black, c_black, item_alpha2);
			draw_text_transformed_color(ibox_x + (ibox_width/2) - 3 - 12, ibox_y + ibox_height + 8 - height_fix + 1 + 18, iinfo_grid[# 0, ing_2], ing_scale, ing_scale, 0, c_black, c_black, c_black, c_black, item_alpha2);
			//3
			draw_sprite_part_ext(spr_inventory_items, 0, sx_3, sy_3, 24, 24, ibox_x + (ibox_width/2) - 12 - 24, ibox_y + ibox_height + 2 + 1 + 18 + 18, .75, .75, c_white, item_alpha3);
			draw_text_transformed_color(ibox_x + (ibox_width/2) - 3 - 27, ibox_y + ibox_height + 12 + 1 + 18 + 18, string(camount_3), .75, .75, 0, c_black, c_black, c_black, c_black, item_alpha3);
			draw_text_transformed_color(ibox_x + (ibox_width/2) - 3 - 12, ibox_y + ibox_height + 8 - height_fix + 1 + 18 + 18, iinfo_grid[# 0, ing_3], ing_scale, ing_scale, 0, c_black, c_black, c_black, c_black, item_alpha3);
			//4
			draw_sprite_part_ext(spr_inventory_items, 0, sx_4, sy_4, 24, 24, ibox_x + (ibox_width/2) - 12 - 24, ibox_y + ibox_height + 2 + 1 + 18 + 18 + 18, .75, .75, c_white, item_alpha4);
			draw_text_transformed_color(ibox_x + (ibox_width/2) - 3 - 27, ibox_y + ibox_height + 12 + 1 + 18 + 18 + 18, string(camount_4), .75, .75, 0, c_black, c_black, c_black, c_black, item_alpha4);
			draw_text_transformed_color(ibox_x + (ibox_width/2) - 3 - 12, ibox_y + ibox_height + 8 - height_fix + 1 + 18 + 18 + 18, iinfo_grid[# 0, ing_4], ing_scale, ing_scale, 0, c_black, c_black, c_black, c_black, item_alpha4);
		}
		#endregion
	}