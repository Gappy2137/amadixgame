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
	var endUIy = yUI + invUI_height + y_rel;

	if isbounded(mousex, xUI, endUIx) && isbounded(mousey, yUI + y_rel, endUIy){
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
	#endregion


	#region Operacje na przedmiotach
	var inv_grid = ds_inventory;

	function putitem(){
		var inv_grid = ds_inventory;
		inv_grid[# INVITEM, selected_slot] = inhand;
		inv_grid[# INVAMOUNT, selected_slot] = multipick;
		inv_grid[# INVLEVEL, selected_slot] = cap;
		inv_grid[# INVTYPE, selected_slot] = ds_item_all[# INVTYPE, inhand];
		inv_grid[# MAXSTACK, selected_slot] = ds_item_all[# MAXSTACK, inhand];
		inv_grid[# INVHP, selected_slot] = ds_item_all[# INVHP, inhand];
		inv_grid[# INVSTAMINA, selected_slot] = ds_item_all[# INVSTAMINA, inhand];
		inv_grid[# INVDAMAGE, selected_slot] = ds_item_all[# INVDAMAGE, inhand];
		inv_grid[# INVDEFENCE, selected_slot] = ds_item_all[# INVDEFENCE, inhand];
		inv_grid[# INVEFFECTS, selected_slot] = ds_item_all[# INVEFFECTS, inhand];
		inv_grid[# INVTEMPERATURE, selected_slot] = ds_item_all[# INVTEMPERATURE, inhand];	
		
				
		inhand = -1;
		multipick = 0;
		cap = 0;
	}
	function changeitem(){
		var inv_grid = ds_inventory;
		//Zamieniamy przedmioty w rece i slocie
		var temp0 = inv_grid[# INVITEM, selected_slot];
		var temp1 = inv_grid[# INVAMOUNT, selected_slot];
		var temp2 = inv_grid[# INVLEVEL, selected_slot];
				
		inv_grid[# INVITEM, selected_slot] = inhand;
		inv_grid[# INVAMOUNT, selected_slot] = multipick;
		inv_grid[# INVLEVEL, selected_slot] = cap;	
		inv_grid[# INVTYPE, selected_slot] = ds_item_all[# INVTYPE, inhand];
		inv_grid[# MAXSTACK, selected_slot] = ds_item_all[# MAXSTACK, inhand];
		inv_grid[# INVHP, selected_slot] = ds_item_all[# INVHP, inhand];
		inv_grid[# INVSTAMINA, selected_slot] = ds_item_all[# INVSTAMINA, inhand];
		inv_grid[# INVDAMAGE, selected_slot] = ds_item_all[# INVDAMAGE, inhand];
		inv_grid[# INVDEFENCE, selected_slot] = ds_item_all[# INVDEFENCE, inhand];
		inv_grid[# INVEFFECTS, selected_slot] = ds_item_all[# INVEFFECTS, inhand];
		inv_grid[# INVTEMPERATURE, selected_slot] = ds_item_all[# INVTEMPERATURE, inhand];
				
		inhand = temp0;
		multipick = temp1;	
		cap = temp2;
	}
	

	if ((mousex >= xUI) && (mousex < endUIx) && (mousey >= yUI + y_rel) && (mousey < endUIy))
	|| (isbounded(mousex, armor_x[0], armor_x[0] + 24) && (isbounded(mousey, armor_y[0], armor_y[1] + 24)))
	|| (isbounded(mousex, armor_x[2], armor_x[2] + 24) && (isbounded(mousey, armor_y[2], armor_y[3] + 24))){
		
		
		//Uzywanie shifta
		if (mouse_check_button_pressed(mb_left)) && (keyboard_check(vk_shift)){
				//Jezeli klikamy lewym na przedmiot typu czapka
				if (inhand == -1) && (inv_grid[# INVTYPE, selected_slot] == itemtype.hat) && (inv_grid[# INVITEM, (inv_slots - 4 + 0)] == item.none){
					//Wloz przedmiot na slot czapki
					var clothslot = (inv_slots - 4 + 0);
					inv_grid[# INVITEM, clothslot] = inv_grid[# INVITEM, selected_slot];
					inv_grid[# INVAMOUNT, clothslot] = 1;
					inv_grid[# INVTYPE, clothslot] = inv_grid[# INVTYPE, selected_slot];
					inv_grid[# MAXSTACK, clothslot] = inv_grid[# MAXSTACK, selected_slot];
					inv_grid[# INVHP, clothslot] = inv_grid[# INVHP, selected_slot];
					inv_grid[# INVSTAMINA, clothslot] = inv_grid[# INVSTAMINA, selected_slot];
					inv_grid[# INVLEVEL, clothslot] = inv_grid[# INVLEVEL, selected_slot];
					inv_grid[# INVDAMAGE, clothslot] = inv_grid[# INVDAMAGE, selected_slot];
					inv_grid[# INVDEFENCE, clothslot] = inv_grid[# INVDEFENCE, selected_slot];
					inv_grid[# INVEFFECTS, clothslot] = inv_grid[# INVEFFECTS, selected_slot];
					inv_grid[# INVTEMPERATURE, clothslot] = inv_grid[# INVTEMPERATURE, selected_slot];
					
					slot_remove(selected_slot);
				}
				//Jezeli klikamy lewym na przedmiot typu ubranie
				if (inhand == -1) && (inv_grid[# INVTYPE, selected_slot] == itemtype.clothing) && (inv_grid[# INVITEM, (inv_slots - 4 + 1)] == item.none){
					//Wloz przedmiot na slot ubrania
					var clothslot = (inv_slots - 4 + 1);
					inv_grid[# INVITEM, clothslot] = inv_grid[# INVITEM, selected_slot];
					inv_grid[# INVAMOUNT, clothslot] = 1;
					inv_grid[# INVTYPE, clothslot] = inv_grid[# INVTYPE, selected_slot];
					inv_grid[# MAXSTACK, clothslot] = inv_grid[# MAXSTACK, selected_slot];
					inv_grid[# INVHP, clothslot] = inv_grid[# INVHP, selected_slot];
					inv_grid[# INVSTAMINA, clothslot] = inv_grid[# INVSTAMINA, selected_slot];
					inv_grid[# INVLEVEL, clothslot] = inv_grid[# INVLEVEL, selected_slot];
					inv_grid[# INVDAMAGE, clothslot] = inv_grid[# INVDAMAGE, selected_slot];
					inv_grid[# INVDEFENCE, clothslot] = inv_grid[# INVDEFENCE, selected_slot];
					inv_grid[# INVEFFECTS, clothslot] = inv_grid[# INVEFFECTS, selected_slot];
					inv_grid[# INVTEMPERATURE, clothslot] = inv_grid[# INVTEMPERATURE, selected_slot];
					
					slot_remove(selected_slot);
				}
				//Jezeli klikamy lewym na przedmiot typu spodnie
				if (inhand == -1) && (inv_grid[# INVTYPE, selected_slot] == itemtype.pants) && (inv_grid[# INVITEM, (inv_slots - 4 + 2)] == item.none){
					//Wloz przedmiot na slot spodni
					var clothslot = (inv_slots - 4 + 2);
					inv_grid[# INVITEM, clothslot] = inv_grid[# INVITEM, selected_slot];
					inv_grid[# INVAMOUNT, clothslot] = 1;
					inv_grid[# INVTYPE, clothslot] = inv_grid[# INVTYPE, selected_slot];
					inv_grid[# MAXSTACK, clothslot] = inv_grid[# MAXSTACK, selected_slot];
					inv_grid[# INVHP, clothslot] = inv_grid[# INVHP, selected_slot];
					inv_grid[# INVSTAMINA, clothslot] = inv_grid[# INVSTAMINA, selected_slot];
					inv_grid[# INVLEVEL, clothslot] = inv_grid[# INVLEVEL, selected_slot];
					inv_grid[# INVDAMAGE, clothslot] = inv_grid[# INVDAMAGE, selected_slot];
					inv_grid[# INVDEFENCE, clothslot] = inv_grid[# INVDEFENCE, selected_slot];
					inv_grid[# INVEFFECTS, clothslot] = inv_grid[# INVEFFECTS, selected_slot];
					inv_grid[# INVTEMPERATURE, clothslot] = inv_grid[# INVTEMPERATURE, selected_slot];
					
					slot_remove(selected_slot);
				}
				//Jezeli klikamy lewym na przedmiot typu buty
				if (inhand == -1) && (inv_grid[# INVTYPE, selected_slot] == itemtype.boots) && (inv_grid[# INVITEM, (inv_slots - 4 + 3)] == item.none){
					//Wloz przedmiot na slot butow
					var clothslot = (inv_slots - 4 + 3);
					inv_grid[# INVITEM, clothslot] = inv_grid[# INVITEM, selected_slot];
					inv_grid[# INVAMOUNT, clothslot] = 1;
					inv_grid[# INVTYPE, clothslot] = inv_grid[# INVTYPE, selected_slot];
					inv_grid[# MAXSTACK, clothslot] = inv_grid[# MAXSTACK, selected_slot];
					inv_grid[# INVHP, clothslot] = inv_grid[# INVHP, selected_slot];
					inv_grid[# INVSTAMINA, clothslot] = inv_grid[# INVSTAMINA, selected_slot];
					inv_grid[# INVLEVEL, clothslot] = inv_grid[# INVLEVEL, selected_slot];
					inv_grid[# INVDAMAGE, clothslot] = inv_grid[# INVDAMAGE, selected_slot];
					inv_grid[# INVDEFENCE, clothslot] = inv_grid[# INVDEFENCE, selected_slot];
					inv_grid[# INVEFFECTS, clothslot] = inv_grid[# INVEFFECTS, selected_slot];
					inv_grid[# INVTEMPERATURE, clothslot] = inv_grid[# INVTEMPERATURE, selected_slot];
					
					slot_remove(selected_slot);
				}
		}
		
		//Branie przedmiotow lewym
		if (mouse_check_button_pressed(mb_left)) && !(keyboard_check(vk_shift)){
			//Jezeli nie mamy nic w rece i klikamy na slot z przedmiotem
			if (inhand == -1) && (inv_grid[# INVITEM, selected_slot] != item.none){
				//Od teraz trzymamy w rece przedmiot ze slotu
				inhand = inv_grid[# INVITEM, selected_slot];
				multipick = inv_grid[# INVAMOUNT, selected_slot];
				cap = inv_grid[# INVLEVEL, selected_slot];
				
				slot_remove(selected_slot);
			}else
			//Jezeli mamy przedmiot w rece i klikamy na pusty slot
			if (inhand != -1) && (inv_grid[# INVITEM, selected_slot] == item.none){
				//Jezeli kladziemy przedmiot specjalny na slot specjalny
				if (selected_slot == (inv_slots - 4) + 0){
					if (ds_item_all[# INVTYPE, inhand] == itemtype.hat){
						//Kladziemy przedmiot na slot
						putitem();
					}
				}else if (selected_slot == (inv_slots - 4) + 1){
					if (ds_item_all[# INVTYPE, inhand] == itemtype.clothing){
						//Kladziemy przedmiot na slot
						putitem();
					}
				}else if (selected_slot == (inv_slots - 4) + 2){
					if (ds_item_all[# INVTYPE, inhand] == itemtype.pants){
						//Kladziemy przedmiot na slot
						putitem();
					}
				}else if (selected_slot == (inv_slots - 4) + 3){
					if (ds_item_all[# INVTYPE, inhand] == itemtype.boots){
						//Kladziemy przedmiot na slot
						putitem();
					}
				}else{
					//Kladziemy przedmiot na slot
					putitem();
				}
			}else
			//Jezeli mamy przedmiot w rece i klikamy na slot z tym samym przedmiotem
			if (inhand != -1) && (inv_grid[# INVITEM, selected_slot] == inhand){
				//Jezeli ilosc przedmiotu ktory trzymamy jest taka ze gdy go polozymy to przekroczymy maxstack
				if (inv_grid[# INVAMOUNT, selected_slot] + multipick >= inv_grid[# MAXSTACK, selected_slot]){
					//Na slocie maxstack, w rece reszta
					var am = inv_grid[# INVAMOUNT, selected_slot];
					var am2 = multipick;
					inv_grid[# INVAMOUNT, selected_slot] = inv_grid[# MAXSTACK, selected_slot];
					inv_grid[# MAXSTACK, selected_slot] = ds_item_all[# MAXSTACK, inhand];
					inv_grid[# INVHP, selected_slot] = ds_item_all[# INVHP, inhand];
					inv_grid[# INVSTAMINA, selected_slot] = ds_item_all[# INVSTAMINA, inhand];
					inv_grid[# INVDAMAGE, selected_slot] = ds_item_all[# INVDAMAGE, inhand];
					inv_grid[# INVDEFENCE, selected_slot] = ds_item_all[# INVDEFENCE, inhand];
					inv_grid[# INVEFFECTS, selected_slot] = ds_item_all[# INVEFFECTS, inhand];
					inv_grid[# INVTEMPERATURE, selected_slot] = ds_item_all[# INVTEMPERATURE, inhand];
					
					if (inv_grid[# INVLEVEL, selected_slot] != cap){
						changeitem();
					}
					
					multipick = am + am2 - inv_grid[# MAXSTACK, selected_slot];
				}else{
					//Jezeli ilosc przedmiotu jest mniejsza kladziemy normalnie
					inv_grid[# INVAMOUNT, selected_slot] += multipick;
					inv_grid[# INVTYPE, selected_slot] = ds_item_all[# INVTYPE, inhand];
					inv_grid[# MAXSTACK, selected_slot] = ds_item_all[# MAXSTACK, inhand];
					inv_grid[# INVHP, selected_slot] = ds_item_all[# INVHP, inhand];
					inv_grid[# INVSTAMINA, selected_slot] = ds_item_all[# INVSTAMINA, inhand];
					inv_grid[# INVDAMAGE, selected_slot] = ds_item_all[# INVDAMAGE, inhand];
					inv_grid[# INVDEFENCE, selected_slot] = ds_item_all[# INVDEFENCE, inhand];
					inv_grid[# INVEFFECTS, selected_slot] = ds_item_all[# INVEFFECTS, inhand];
					inv_grid[# INVTEMPERATURE, selected_slot] = ds_item_all[# INVTEMPERATURE, inhand];
					
					if (inv_grid[# INVLEVEL, selected_slot] != cap){
						changeitem();
					}
					
					multipick = 0;
				}
			}else
			//Jezeli mamy przedmiot w rece i klikamy na slot z innym przedmiotem
			if (inhand != -1) && (inv_grid[# INVITEM, selected_slot] != inhand) && (inv_grid[# INVITEM, selected_slot] != item.none){
				//Jezeli kladziemy przedmiot specjalny na slot specjalny
				if (selected_slot == (inv_slots - 4) + 0){
					if (ds_item_all[# INVTYPE, inhand] == itemtype.hat){
						//Zamieniamy przedmioty w rece i slocie
						changeitem();
					}
				}else if (selected_slot == (inv_slots - 4) + 1){
					if (ds_item_all[# INVTYPE, inhand] == itemtype.clothing){
						//Zamieniamy przedmioty w rece i slocie
						changeitem();
					}
				}else if (selected_slot == (inv_slots - 4) + 2){
					if (ds_item_all[# INVTYPE, inhand] == itemtype.pants){
						//Zamieniamy przedmioty w rece i slocie
						changeitem();
					}
				}else if (selected_slot == (inv_slots - 4) + 3){
					if (ds_item_all[# INVTYPE, inhand] == itemtype.boots){
						//Zamieniamy przedmioty w rece i slocie
						changeitem();
					}
				}else{
					//Zamieniamy przedmioty w rece i slocie
					changeitem();
				}
			}
		}
		//Branie przedmiotow prawym
		if (mouse_check_button_pressed(mb_right)){
			//Jezeli klikamy prawym na przedmiot nie majac nic w rece
			if (inhand == -1) && (inv_grid[# INVITEM, selected_slot] != item.none) && (inv_grid[# INVAMOUNT, selected_slot] > 0) && (multipick < inv_grid[# MAXSTACK, selected_slot]){
				//Od teraz trzymamy w rece przedmiot ze slotu
				inhand = inv_grid[# INVITEM, selected_slot];
				if (inv_grid[# INVTYPE, selected_slot] == itemtype.magazine){
					inhand = inv_grid[# INVITEM, selected_slot];
					multipick = inv_grid[# INVAMOUNT, selected_slot];
					cap = inv_grid[# INVLEVEL, selected_slot];
				
					slot_remove(selected_slot);
				}else{
					
					if (input_check("shift")){
						multipick = floor((inv_grid[# INVAMOUNT, selected_slot])/2);
						inv_grid[# INVAMOUNT, selected_slot] -= multipick;
					}else{
						multipick++;
						inv_grid[# INVAMOUNT, selected_slot]--;
					}
				}

			}else
			//Jezeli klikamy prawym na przedmiot majac w rece ten sam przedmiot
			if (inhand != -1) && (inv_grid[# INVITEM, selected_slot] == inhand) && (inv_grid[# INVAMOUNT, selected_slot] > 0) && (multipick < inv_grid[# MAXSTACK, selected_slot]){
				inhand = inv_grid[# INVITEM, selected_slot];
				
				if (inv_grid[# INVLEVEL, selected_slot] != cap){
					changeitem();
				}else{
					if (input_check("shift")){
						if (inv_grid[# INVAMOUNT, selected_slot] == 1){
							multipick++;
							slot_remove(selected_slot);
						}else{
							var mm = floor((inv_grid[# INVAMOUNT, selected_slot])/2);
							if (multipick + mm >= inv_grid[# MAXSTACK, selected_slot]){
								var mi = (inv_grid[# MAXSTACK, selected_slot] - multipick);
								inv_grid[# INVAMOUNT, selected_slot] -= mi;
								multipick = inv_grid[# MAXSTACK, selected_slot];
							}else{
								multipick += mm;
								inv_grid[# INVAMOUNT, selected_slot] -= mm;
							}	
						}
					}else{
						multipick++;
						inv_grid[# INVAMOUNT, selected_slot]--;
					}
				}
				
			}
		}
		

		
	}else{
		//Jezeli myszka jest poza ekranem ekwipunku
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
	    if ((inv_grid[# INVAMOUNT, i] == 0) && (inv_grid[# INVITEM, i] != item.none)){
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
		if (obj_amadix.y > (room_height - 132)) || (global.inDialogue){
			slots_position_up = true;
		}else{
			slots_position_up = false;	
		}
	}
	
	#region Pozycja myszki
	
	if (slots_position_up) || (global.inDialogue){
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
		
		function canChange(){
			if instance_exists(obj_amadix){
				if (obj_amadix.actionstate == player_state_action.none){
					if (!global.inDialogue)
						return true;	
				}else
				if (obj_amadix.actionstate == player_state_action.handgun){
					if instance_exists(obj_gun_logic){
						if ((obj_gun_logic.state == gunState.reloading)
						|| (obj_gun_logic.state == gunState.shooting)
						|| (obj_gun_logic.state == gunState.reloading_empty)){
							return false;	
						}else{
							if (!global.inDialogue)
								return true;	
						}
					}
						
				}
			}
		}
		
		if (mouse_check_button_pressed(mb_left)) && canChange(){
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
		if canChange(){
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
		if canChange(){
			if (input_check_pressed("inventory_1")){mouse_slotx_second = 0;selected_slot = mouse_slotx_second;show_slots_mouse = true;mouse_slotx_fix = false;text_timer = 300;text_alpha = 1;}
			if (input_check_pressed("inventory_2")){mouse_slotx_second = 1;selected_slot = mouse_slotx_second;show_slots_mouse = true;mouse_slotx_fix = false;text_timer = 300;text_alpha = 1;}
			if (input_check_pressed("inventory_3")){mouse_slotx_second = 2;selected_slot = mouse_slotx_second;show_slots_mouse = true;mouse_slotx_fix = false;text_timer = 300;text_alpha = 1;}
			if (input_check_pressed("inventory_4")){mouse_slotx_second = 3;selected_slot = mouse_slotx_second;show_slots_mouse = true;mouse_slotx_fix = false;text_timer = 300;text_alpha = 1;}
			if (input_check_pressed("inventory_5")){mouse_slotx_second = 4;selected_slot = mouse_slotx_second;show_slots_mouse = true;mouse_slotx_fix = false;text_timer = 300;text_alpha = 1;}
			if (input_check_pressed("inventory_6")){mouse_slotx_second = 5;selected_slot = mouse_slotx_second;show_slots_mouse = true;mouse_slotx_fix = false;text_timer = 300;text_alpha = 1;}
			if (input_check_pressed("inventory_7")){mouse_slotx_second = 6;selected_slot = mouse_slotx_second;show_slots_mouse = true;mouse_slotx_fix = false;text_timer = 300;text_alpha = 1;}
			if (input_check_pressed("inventory_8")){mouse_slotx_second = 7;selected_slot = mouse_slotx_second;show_slots_mouse = true;mouse_slotx_fix = false;text_timer = 300;text_alpha = 1;}
			if (input_check_pressed("inventory_9")){mouse_slotx_second = 8;selected_slot = mouse_slotx_second;show_slots_mouse = true;mouse_slotx_fix = false;text_timer = 300;text_alpha = 1;}
			if (input_check_pressed("inventory_0")){mouse_slotx_second = 9;selected_slot = mouse_slotx_second;show_slots_mouse = true;mouse_slotx_fix = false;text_timer = 300;text_alpha = 1;}
			if (input_check_pressed("inventory_hyphen")){mouse_slotx_second = 10;selected_slot = mouse_slotx_second;show_slots_mouse = true;mouse_slotx_fix = false;text_timer = 300;text_alpha = 1;}
			if (input_check_pressed("inventory_equals")){mouse_slotx_second = 11;selected_slot = mouse_slotx_second;show_slots_mouse = true;mouse_slotx_fix = false;text_timer = 300;text_alpha = 1;}
		}
	}
	#endregion
	
	//Operacje na przedmiotach w slocie (jedzenie, atak)
	item_action();
	
	//Jezeli istnieje w siatce przedmiot o ilosci zerowej usun go
	for (var i = 0; i < inv_slots_width; ++i) {
	    if (ds_inventory[# 1, i] == 0) && (multipick == 0) && (ds_inventory[# 0, i] != 0){
				slot_remove(i);
		}
	}
	
	#endregion	
}
else if (!show_inventory) && (!show_slots){
	exit;
}
#endregion

//Logika ubran i akcesoriow
global.playerHat = (ds_inventory[# INVITEM, ((inv_slots - 4) + 0)]);
global.playerTorso = (ds_inventory[# INVITEM, ((inv_slots - 4) + 1)]);
global.playerLegs = (ds_inventory[# INVITEM, ((inv_slots - 4) + 2)]);
global.playerBoots = (ds_inventory[# INVITEM, ((inv_slots - 4) + 3)]);