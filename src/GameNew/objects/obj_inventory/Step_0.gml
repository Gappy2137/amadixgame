//if (keyboard_check_pressed(ord("E"))) {show_inventory = !show_inventory;}
//if (keyboard_check_pressed(ord("R"))) {show_slots = !show_slots;}

if (!canUseInventory){exit;}

#region Operacje na przedmiotach
if (show_inventory) && (!show_slots){

	#region Pozycja myszki
	mousex = device_mouse_x_to_gui(0);
	mousey = device_mouse_y_to_gui(0);

	var cell_xoffset = (cell_size + x_offset)*scale;
	var cell_yoffset = (cell_size + y_offset)*scale;

	var i_mousex = mousex - slots_x;
	var i_mousey = mousey - slots_y;

	var numx = i_mousex div cell_xoffset;
	var numy = i_mousey div cell_yoffset;

	var endx = (gui_width - invUI_width)/2;
	var endUIx = xUI + invUI_width;

	var endy = (gui_height - invUI_height)/2;
	var endUIy = yUI + invUI_height;

	if isbounded(mousex, xUI, endUIx) && isbounded(mousey, yUI, endUIy){
		var sx = i_mousex - (numx * cell_xoffset);
		var sy = i_mousey - (numy * cell_yoffset);
	
		if ((sx < cell_size*scale) && (sy < cell_size*scale)){
			mouse_slotx = numx;
			mouse_sloty = numy;
		}
		selected_slot = min(inv_slots - 1 + (page * slots_onpage), mouse_slotx + (mouse_sloty * inv_slots_width) + (page * slots_onpage));
	
	}else{
		selected_slot = -1;
	}
	
	//////////////////////////////////////////////////////////////////////////
	//Zmiana strony
	if (mousex >= (xUI - 16)) && (mousex < (xUI - 16 + 14)) && (mousey >= (yUI + 70)) && (mousey <= (yUI + 70 + 25)){
		if (page > 0){
			if (mouse_check_button_pressed(mb_left)){
				page--;
			}
			if (picked_slot != -1){
				page--;	
			}
		}
	}
	if (mousex >= ((xUI + invUI_width))) && (mousex < ((xUI + invUI_width) + 16)) && (mousey >= (yUI + 70)) && (mousey <= (yUI + 70 + 25)){
		if (page < pages){
			if (mouse_check_button_pressed(mb_left)){
				page++;
			}
			if (picked_slot != -1){
				page++;	
			}
		}
	}
	
	if (mouse_wheel_up()){
		if (page > 0){
			page--;
		}
	}
	if (mouse_wheel_down()){
		if (page < pages){
			page++;
		}
	}
	//////////////////////////////////////////////////////////////////////////
	
	#endregion

	#region Armor
	var ar = 0;
	repeat(4){
		if isbounded(mousex, armor_x[ar], armor_x[ar] + 24) && isbounded(mousey, armor_y[ar], armor_y[ar] + 24){
			selected_slot = (inv_slots - 4) + ar;
		}
		ar++;
	}
	if ((selected_slot == (inv_slots - 4) + 0) && (ds_item_all[# TYPE, inhand] == itemtype.hat)) ||
	   ((selected_slot == (inv_slots - 4) + 1) && (ds_item_all[# TYPE, inhand] == itemtype.clothing)) ||
	   ((selected_slot == (inv_slots - 4) + 2) && (ds_item_all[# TYPE, inhand] == itemtype.pants)) ||
	   ((selected_slot == (inv_slots - 4) + 3) && (ds_item_all[# TYPE, inhand] == itemtype.boots)) 
	{
		
	}
	#endregion


	#region Operacje na przedmiotach
	var inv_grid = ds_inventory;

	if ((mousex >= xUI) && (mousex < endUIx) && (mousey >= yUI) && (mousey < endUIy))
	|| (isbounded(mousex, armor_x[0], armor_x[0] + 24) && (isbounded(mousey, armor_y[0], armor_y[1] + 24)))
	|| (isbounded(mousex, armor_x[2], armor_x[2] + 24) && (isbounded(mousey, armor_y[2], armor_y[3] + 24))){
		
		//Branie przedmiotow lewym
		if (mouse_check_button_pressed(mb_left)){
			//Jezeli nie mamy nic w rece i klikamy na slot z przedmiotem
			if (inhand == -1) && (inv_grid[# ITEM, selected_slot] != item.none){
				//Od teraz trzymamy w rece przedmiot ze slotu
				inhand = inv_grid[# ITEM, selected_slot];
				multipick = inv_grid[# AMOUNT, selected_slot];
				
				slot_remove(selected_slot);
			}else
			//Jezeli mamy przedmiot w rece i klikamy na pusty slot
			if (inhand != -1) && (inv_grid[# ITEM, selected_slot] == item.none){
				//Kladziemy przedmiot na slot
				inv_grid[# ITEM, selected_slot] = inhand;
				inv_grid[# AMOUNT, selected_slot] = multipick;
				inv_grid[# TYPE, selected_slot] = ds_item_all[# TYPE, inhand];
				inv_grid[# MAXSTACK, selected_slot] = ds_item_all[# MAXSTACK, inhand];
				inv_grid[# HP, selected_slot] = ds_item_all[# HP, inhand];
				inv_grid[# STAMINA, selected_slot] = ds_item_all[# STAMINA, inhand];
				inv_grid[# LEVEL, selected_slot] = ds_item_all[# LEVEL, inhand];
				inv_grid[# DAMAGE, selected_slot] = ds_item_all[# DAMAGE, inhand];
				inv_grid[# DEFENCE, selected_slot] = ds_item_all[# DEFENCE, inhand];
				inv_grid[# EFFECT1, selected_slot] = ds_item_all[# EFFECT1, inhand];
				inv_grid[# EFFECT2, selected_slot] = ds_item_all[# EFFECT2, inhand];
				inv_grid[# EFFECT3, selected_slot] = ds_item_all[# EFFECT3, inhand];
				
				inhand = -1;
				multipick = 0;
			}else
			//Jezeli mamy przedmiot w rece i klikamy na slot z tym samym przedmiotem
			if (inhand != -1) && (inv_grid[# ITEM, selected_slot] == inhand){
				//Jezeli ilosc przedmiotu ktory trzymamy jest taka ze gdy go polozymy to przekroczymy maxstack
				if (inv_grid[# AMOUNT, selected_slot] + multipick >= inv_grid[# MAXSTACK, selected_slot]){
					//Na slocie maxstack, w rece reszta
					var am = inv_grid[# AMOUNT, selected_slot];
					var am2 = multipick;
					inv_grid[# AMOUNT, selected_slot] = inv_grid[# MAXSTACK, selected_slot];
					inv_grid[# MAXSTACK, selected_slot] = ds_item_all[# MAXSTACK, inhand];
					inv_grid[# HP, selected_slot] = ds_item_all[# HP, inhand];
					inv_grid[# STAMINA, selected_slot] = ds_item_all[# STAMINA, inhand];
					inv_grid[# LEVEL, selected_slot] = ds_item_all[# LEVEL, inhand];
					inv_grid[# DAMAGE, selected_slot] = ds_item_all[# DAMAGE, inhand];
					inv_grid[# DEFENCE, selected_slot] = ds_item_all[# DEFENCE, inhand];
					inv_grid[# EFFECT1, selected_slot] = ds_item_all[# EFFECT1, inhand];
					inv_grid[# EFFECT2, selected_slot] = ds_item_all[# EFFECT2, inhand];
					inv_grid[# EFFECT3, selected_slot] = ds_item_all[# EFFECT3, inhand];
					multipick = am + am2 - inv_grid[# MAXSTACK, selected_slot];
				}else{
					//Jezeli ilosc przedmiotu jest mniejsza kladziemy normalnie
					inv_grid[# AMOUNT, selected_slot] += multipick;
					inv_grid[# TYPE, selected_slot] = ds_item_all[# TYPE, inhand];
					inv_grid[# MAXSTACK, selected_slot] = ds_item_all[# MAXSTACK, inhand];
					inv_grid[# HP, selected_slot] = ds_item_all[# HP, inhand];
					inv_grid[# STAMINA, selected_slot] = ds_item_all[# STAMINA, inhand];
					inv_grid[# LEVEL, selected_slot] = ds_item_all[# LEVEL, inhand];
					inv_grid[# DAMAGE, selected_slot] = ds_item_all[# DAMAGE, inhand];
					inv_grid[# DEFENCE, selected_slot] = ds_item_all[# DEFENCE, inhand];
					inv_grid[# EFFECT1, selected_slot] = ds_item_all[# EFFECT1, inhand];
					inv_grid[# EFFECT2, selected_slot] = ds_item_all[# EFFECT2, inhand];
					inv_grid[# EFFECT3, selected_slot] = ds_item_all[# EFFECT3, inhand];
					multipick = 0;
				}
			}else
			//Jezeli mamy przedmiot w rece i klikamy na slot z innym przedmiotem
			if (inhand != -1) && (inv_grid[# ITEM, selected_slot] != inhand) && (inv_grid[# ITEM, selected_slot] != item.none){
				//Zamieniamy przedmioty w rece i slocie
				var temp0 = inv_grid[# ITEM, selected_slot];
				var temp1 = inv_grid[# AMOUNT, selected_slot];
				
				inv_grid[# ITEM, selected_slot] = inhand;
				inv_grid[# AMOUNT, selected_slot] = multipick;
				inv_grid[# TYPE, selected_slot] = ds_item_all[# TYPE, inhand];
				inv_grid[# MAXSTACK, selected_slot] = ds_item_all[# MAXSTACK, inhand];
				inv_grid[# HP, selected_slot] = ds_item_all[# HP, inhand];
				inv_grid[# STAMINA, selected_slot] = ds_item_all[# STAMINA, inhand];
				inv_grid[# LEVEL, selected_slot] = ds_item_all[# LEVEL, inhand];
				inv_grid[# DAMAGE, selected_slot] = ds_item_all[# DAMAGE, inhand];
				inv_grid[# DEFENCE, selected_slot] = ds_item_all[# DEFENCE, inhand];
				inv_grid[# EFFECT1, selected_slot] = ds_item_all[# EFFECT1, inhand];
				inv_grid[# EFFECT2, selected_slot] = ds_item_all[# EFFECT2, inhand];
				inv_grid[# EFFECT3, selected_slot] = ds_item_all[# EFFECT3, inhand];
				
				inhand = temp0;
				multipick = temp1;
			}
		}
		//Branie przedmiotow prawym
		if (mouse_check_button_pressed(mb_right)){
			//Jezeli klikamy prawym na przedmiot nie majac nic w rece
			if (inhand == -1) && (inv_grid[# ITEM, selected_slot] != item.none) && (inv_grid[# AMOUNT, selected_slot] > 0) && (multipick < inv_grid[# MAXSTACK, selected_slot]){
				//Od teraz trzymamy w rece przedmiot ze slotu
				inhand = inv_grid[# ITEM, selected_slot];
				multipick++;
				inv_grid[# AMOUNT, selected_slot]--;
			}else
			//Jezeli klikamy prawym na przedmiot majac w rece ten sam przedmiot
			if (inhand != -1) && (inv_grid[# ITEM, selected_slot] == inhand) && (inv_grid[# AMOUNT, selected_slot] > 0) && (multipick < inv_grid[# MAXSTACK, selected_slot]){
				inhand = inv_grid[# ITEM, selected_slot];
				multipick++;
				inv_grid[# AMOUNT, selected_slot]--;
			}
		}
		
	}else{
		if (selected_slot == -1){
			if (mouse_check_button_pressed(mb_left)){
				//Jezeli trzymasz cos w rece wyrzuc to
					if (inhand != -1){
							var inst = instance_create_layer(obj_amadix.x, obj_amadix.y, "Instances", obj_item);
							with (inst){
								item_num = other.inhand;
								item_num_amount = other.multipick;
								x_frame = item_num mod (spr_width/cell_size);
								y_frame = item_num div (spr_width/cell_size);
							}
							inhand = -1;
							multipick = 0;
					}
			}
		}
	}
	#endregion

	
	//Jezeli istnieje w siatce przedmiot o ilosci zerowej usun go
	for (var i = 0; i < inv_slots; ++i){
	    if ((inv_grid[# AMOUNT, i] == 0) && (inv_grid[# ITEM, i] != item.none)){
				slot_remove(i);
		}
	}
	
	
	if (inhand == -1){
		multipick = 0;	
	}
	if (multipick == 0){
		inhand = -1;	
	}
}
else if (!show_inventory) && (show_slots){
	

	if (instance_exists(obj_amadix)){
		if (obj_amadix.y > (room_height - 132)){
			slots_position_up = true;
		}else{
			slots_position_up = false;	
		}
	}
	
	#region Pozycja myszki
	
	if (slots_position_up){
		var pos = 12;
	}else{
		var pos = 237;
	}
	
	mousex = device_mouse_x_to_gui(0);
	mousey = device_mouse_y_to_gui(0);

	var cell_xoffset = (cell_size + x_offset)*scale;
	var cell_yoffset = (cell_size + y_offset)*scale;

	var i_mousex = mousex - slots_x;
	var i_mousey = mousey - pos;

	var numx = i_mousex div cell_xoffset;
	var numy = i_mousey div cell_yoffset;

	var endx = (gui_width - invUI_width)/2;
	var endUIx = invUI_width + endx;

	var endy = pos;
	var endUIy = cell_size + endy;

	if (mousex >= xUI) && (mousex < endUIx) && (mousey >= pos) && (mousey < endUIy){
		var sx = i_mousex - (numx * cell_xoffset);
		var sy = i_mousey - (numy * cell_yoffset);
		inslots = true;
	
		if ((sx < cell_size*scale) && (sy < cell_size*scale)){
			mouse_slotx = numx;
			mouse_sloty = numy;
		}
		
		if (mouse_check_button_pressed(mb_left)) && (obj_amadix.actionstate == player_state_action.none){
			show_slots_mouse = true;
			mouse_slotx_fix = false;
			text_timer = 300;
			text_alpha = 1;
			mouse_slotx_second = mouse_slotx;
			selected_slot = mouse_slotx_second;
		}
	
	}else{
		selected_slot = -1;
		inslots = false;
	}
	
	if instance_exists(obj_amadix){
		if (obj_amadix.actionstate == player_state_action.none){
			if (mouse_wheel_down()){
				mouse_slotx_second ++;	
				if (mouse_slotx_second > 11){
					mouse_slotx_second = 0;	
				}
				show_slots_mouse = true;
				mouse_slotx_fix = false;
				text_timer = 300;
				text_alpha = 1;
			}
			if (mouse_wheel_up()){
				mouse_slotx_second --;	
				if (mouse_slotx_second < 0){
					mouse_slotx_second = 11;	
				}
				show_slots_mouse = true;
				mouse_slotx_fix = false;
				text_timer = 300;
				text_alpha = 1;
			}
		}
	}
	if (show_slots_mouse) && (!mouse_slotx_fix){
		selected_slot = mouse_slotx_second;
	}
	#region Klawisze
	if instance_exists(obj_amadix){
		if (obj_amadix.actionstate == player_state_action.none){
			if (keyboard_check_pressed(ord("1"))){mouse_slotx_second = 0;selected_slot = mouse_slotx_second;show_slots_mouse = true;mouse_slotx_fix = false;text_timer = 300;text_alpha = 1;}
			if (keyboard_check_pressed(ord("2"))){mouse_slotx_second = 1;selected_slot = mouse_slotx_second;show_slots_mouse = true;mouse_slotx_fix = false;text_timer = 300;text_alpha = 1;}
			if (keyboard_check_pressed(ord("3"))){mouse_slotx_second = 2;selected_slot = mouse_slotx_second;show_slots_mouse = true;mouse_slotx_fix = false;text_timer = 300;text_alpha = 1;}
			if (keyboard_check_pressed(ord("4"))){mouse_slotx_second = 3;selected_slot = mouse_slotx_second;show_slots_mouse = true;mouse_slotx_fix = false;text_timer = 300;text_alpha = 1;}
			if (keyboard_check_pressed(ord("5"))){mouse_slotx_second = 4;selected_slot = mouse_slotx_second;show_slots_mouse = true;mouse_slotx_fix = false;text_timer = 300;text_alpha = 1;}
			if (keyboard_check_pressed(ord("6"))){mouse_slotx_second = 5;selected_slot = mouse_slotx_second;show_slots_mouse = true;mouse_slotx_fix = false;text_timer = 300;text_alpha = 1;}
			if (keyboard_check_pressed(ord("7"))){mouse_slotx_second = 6;selected_slot = mouse_slotx_second;show_slots_mouse = true;mouse_slotx_fix = false;text_timer = 300;text_alpha = 1;}
			if (keyboard_check_pressed(ord("8"))){mouse_slotx_second = 7;selected_slot = mouse_slotx_second;show_slots_mouse = true;mouse_slotx_fix = false;text_timer = 300;text_alpha = 1;}
			if (keyboard_check_pressed(ord("9"))){mouse_slotx_second = 8;selected_slot = mouse_slotx_second;show_slots_mouse = true;mouse_slotx_fix = false;text_timer = 300;text_alpha = 1;}
			if (keyboard_check_pressed(ord("0"))){mouse_slotx_second = 9;selected_slot = mouse_slotx_second;show_slots_mouse = true;mouse_slotx_fix = false;text_timer = 300;text_alpha = 1;}
			if (keyboard_check_pressed(189)){mouse_slotx_second = 10;selected_slot = mouse_slotx_second;show_slots_mouse = true;mouse_slotx_fix = false;text_timer = 300;text_alpha = 1;}
			if (keyboard_check_pressed(187)){mouse_slotx_second = 11;selected_slot = mouse_slotx_second;show_slots_mouse = true;mouse_slotx_fix = false;text_timer = 300;text_alpha = 1;}
		}
	}
	#endregion
	
	//Operacje na przedmiotach w slocie (jedzenie, atak)
	item_action();
	
	//Jezeli istnieje w siatce przedmiot o ilosci zerowej usun go
	for (var i = 0; i < inv_slots_width; ++i) {
	    if (ds_inventory[# 1, i] == 0) && (multipick == 0){
				slot_remove(i);
		}
	}
	
	#endregion	
}
else if (!show_inventory) && (!show_slots){
	exit;
}
#endregion

//item_attrib_grid();