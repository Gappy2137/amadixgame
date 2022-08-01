event_inherited();


if (instance_exists(obj_inventory)){
	if (!obj_inventory.show_inventory) && (obj_inventory.show_slots) && (show_container){
		
		obj_inventory.show_slots = false;
		
		#region Myszka w polu pojemnika
		mousex = device_mouse_x_to_gui(0);
		mousey = device_mouse_y_to_gui(0);

		var i_mousex = mousex - slots_x;
		var i_mousey = mousey - slots_y;

		var numx = i_mousex div cell_size;
		var numy = i_mousey div cell_size;

		var endx = xUI + (containerSlotWidth * cell_size);

		var endy = yUI + (containerSlotHeight * cell_size);
		

		#endregion
		
		#region Myszka w polu ekwipunku

		var i_mousex_eq = mousex - slots_x_eq;
		var i_mousey_eq = mousey - slots_y_eq;

		var numx_eq = i_mousex_eq div cell_size;
		var numy_eq = i_mousey_eq div cell_size;

		var endx_eq = xUI_eq + (obj_inventory.inv_slots_width * cell_size);

		var endy_eq = yUI_eq + (obj_inventory.inv_slots_height * cell_size);
		
		
		if isbounded(mousex, xUI_eq, endx_eq) && isbounded(mousey, yUI_eq, endy_eq){
			var sx = i_mousex_eq - (numx_eq * cell_size);
			var sy = i_mousey_eq - (numy_eq * cell_size);
	
			if ((sx < cell_size) && (sy < cell_size)){
				mouse_slotx = numx_eq;
				mouse_sloty = numy_eq;
			}
			selected_slot_eq = min(obj_inventory.inv_slots - 1 + (obj_inventory.page * obj_inventory.slots_onpage), mouse_slotx + (mouse_sloty * obj_inventory.inv_slots_width) + (obj_inventory.page * obj_inventory.slots_onpage));
			selected_slot = -1;
			
		}else if isbounded(mousex, xUI, endx) && isbounded(mousey, yUI, endy){
			var sx = i_mousex - (numx * cell_size);
			var sy = i_mousey - (numy * cell_size);
	
			if ((sx < cell_size) && (sy < cell_size)){
				mouse_slotx = numx;
				mouse_sloty = numy;
			}
			selected_slot = min(containerSlots - 1, mouse_slotx + (mouse_sloty * containerSlotWidth));
			selected_slot_eq = -1;	
		}else{
			selected_slot = -1;	
			selected_slot_eq = -1;	
		}
		#endregion
		
		
	var inv_grid = obj_inventory.ds_inventory;
	var con_grid = ds_container;
if (canUseContainter){
	if ((mousex >= xUI_eq) && (mousex < endx_eq) && (mousey >= yUI_eq) && (mousey < endy_eq)){
		
		
		//Uzywanie shifta
		if (mouse_check_button_pressed(mb_left)) && (keyboard_check(vk_shift)){
			var _item = inv_grid[# INVITEM, selected_slot_eq];
			var _amount = inv_grid[# INVAMOUNT, selected_slot_eq];
			var _level = inv_grid[# INVLEVEL, selected_slot_eq];
			var _cap = inv_grid[# INVCAP, selected_slot_eq];
			var _maxstack = inv_grid[# MAXSTACK, selected_slot_eq];
			
			var am = container_stack(_item, _amount, _level, _cap, con_grid, containerSlots);
			
			inv_grid[# INVAMOUNT, selected_slot_eq] = am;
		}
		
		//Branie przedmiotow lewym
		if (mouse_check_button_pressed(mb_left)) && !(keyboard_check(vk_shift)){
			//Jezeli nie mamy nic w rece i klikamy na slot z przedmiotem
			if (inhand == -1) && (inv_grid[# INVITEM, selected_slot_eq] != item.none){
				//Od teraz trzymamy w rece przedmiot ze slotu
				inhand = inv_grid[# INVITEM, selected_slot_eq];
				multipick = inv_grid[# INVAMOUNT, selected_slot_eq];
				cap = inv_grid[# INVCAP, selected_slot_eq];
				lvl = inv_grid[# INVLEVEL, selected_slot_eq];
				
				slot_remove(selected_slot_eq);
			}else
			//Jezeli mamy przedmiot w rece i klikamy na pusty slot
			if (inhand != -1) && (inv_grid[# INVITEM, selected_slot_eq] == item.none){
				//Kladziemy przedmiot na slot
				inv_grid[# INVITEM, selected_slot_eq] = inhand;
				inv_grid[# INVAMOUNT, selected_slot_eq] = multipick;
				inv_grid[# INVTYPE, selected_slot_eq] = obj_inventory.ds_item_all[# INVTYPE, inhand];
				inv_grid[# MAXSTACK, selected_slot_eq] = obj_inventory.ds_item_all[# MAXSTACK, inhand];
				inv_grid[# INVHP, selected_slot_eq] = obj_inventory.ds_item_all[# INVHP, inhand];
				inv_grid[# INVSTAMINA, selected_slot_eq] = obj_inventory.ds_item_all[# INVSTAMINA, inhand];
				inv_grid[# INVLEVEL, selected_slot_eq] = lvl;
				inv_grid[# INVDAMAGE, selected_slot_eq] = obj_inventory.ds_item_all[# INVDAMAGE, inhand];
				inv_grid[# INVDEFENCE, selected_slot_eq] = obj_inventory.ds_item_all[# INVDEFENCE, inhand];
				inv_grid[# INVEFFECTS, selected_slot_eq] = obj_inventory.ds_item_all[# INVEFFECTS, inhand];
				inv_grid[# INVTEMPERATURE, selected_slot_eq] = obj_inventory.ds_item_all[# INVTEMPERATURE, inhand];
				inv_grid[# INVCAP, selected_slot_eq] = cap;
				inv_grid[# MAXCAP, selected_slot_eq] = obj_inventory.ds_item_all[# MAXCAP, inhand];	
				
				inhand = -1;
				multipick = 0;
				cap = -1;
				lvl = 0;
			}else
			//Jezeli mamy przedmiot w rece i klikamy na slot z tym samym przedmiotem
			if (inhand != -1) && (inv_grid[# INVITEM, selected_slot_eq] == inhand){
				//Jezeli ilosc przedmiotu ktory trzymamy jest taka ze gdy go polozymy to przekroczymy maxstack
				if (inv_grid[# INVAMOUNT, selected_slot_eq] + multipick >= inv_grid[# MAXSTACK, selected_slot_eq]){
					//Na slocie maxstack, w rece reszta
					var am = inv_grid[# INVAMOUNT, selected_slot_eq];
					var am2 = multipick;
					inv_grid[# INVAMOUNT, selected_slot_eq] = inv_grid[# MAXSTACK, selected_slot_eq];
					inv_grid[# MAXSTACK, selected_slot_eq] = obj_inventory.ds_item_all[# MAXSTACK, inhand];
					inv_grid[# INVHP, selected_slot_eq] = obj_inventory.ds_item_all[# INVHP, inhand];
					inv_grid[# INVSTAMINA, selected_slot_eq] = obj_inventory.ds_item_all[# INVSTAMINA, inhand];
					inv_grid[# INVDAMAGE, selected_slot_eq] = obj_inventory.ds_item_all[# INVDAMAGE, inhand];
					inv_grid[# INVDEFENCE, selected_slot_eq] = obj_inventory.ds_item_all[# INVDEFENCE, inhand];
					inv_grid[# INVEFFECTS, selected_slot_eq] = obj_inventory.ds_item_all[# INVEFFECTS, inhand];
					inv_grid[# INVTEMPERATURE, selected_slot_eq] = obj_inventory.ds_item_all[# INVTEMPERATURE, inhand];
					inv_grid[# MAXCAP, selected_slot_eq] = obj_inventory.ds_item_all[# MAXCAP, inhand];
					
					if (inv_grid[# INVCAP, selected_slot_eq] != cap) || (inv_grid[# INVLEVEL, selected_slot_eq] != lvl){
						var temp0 = inv_grid[# INVITEM, selected_slot_eq];
						var temp1 = inv_grid[# INVAMOUNT, selected_slot_eq];
						var temp2 = inv_grid[# INVLEVEL, selected_slot_eq];
						var temp3 = inv_grid[# INVCAP, selected_slot_eq];
				
						inv_grid[# INVITEM, selected_slot_eq] = inhand;
						inv_grid[# INVAMOUNT, selected_slot_eq] = multipick;
						inv_grid[# INVTYPE, selected_slot_eq] = obj_inventory.ds_item_all[# INVTYPE, inhand];
						inv_grid[# MAXSTACK, selected_slot_eq] = obj_inventory.ds_item_all[# MAXSTACK, inhand];
						inv_grid[# INVHP, selected_slot_eq] = obj_inventory.ds_item_all[# INVHP, inhand];
						inv_grid[# INVSTAMINA, selected_slot_eq] = obj_inventory.ds_item_all[# INVSTAMINA, inhand];
						inv_grid[# INVDAMAGE, selected_slot_eq] = obj_inventory.ds_item_all[# INVDAMAGE, inhand];
						inv_grid[# INVDEFENCE, selected_slot_eq] = obj_inventory.ds_item_all[# INVDEFENCE, inhand];
						inv_grid[# INVEFFECTS, selected_slot_eq] = obj_inventory.ds_item_all[# INVEFFECTS, inhand];
						inv_grid[# INVTEMPERATURE, selected_slot_eq] = obj_inventory.ds_item_all[# INVTEMPERATURE, inhand];
						inv_grid[# INVLEVEL, selected_slot_eq] = lvl;
						inv_grid[# INVCAP, selected_slot_eq] = cap;
						inv_grid[# MAXCAP, selected_slot_eq] = obj_inventory.ds_item_all[# MAXCAP, inhand];
				
						inhand = temp0;
						multipick = temp1;	
						lvl = temp2;	
						cap = temp3;	
					}
					
					multipick = am + am2 - inv_grid[# MAXSTACK, selected_slot_eq];
				}else{
					//Jezeli ilosc przedmiotu jest mniejsza kladziemy normalnie
					inv_grid[# INVAMOUNT, selected_slot_eq] += multipick;
					inv_grid[# INVTYPE, selected_slot_eq] = obj_inventory.ds_item_all[# INVTYPE, inhand];
					inv_grid[# MAXSTACK, selected_slot_eq] = obj_inventory.ds_item_all[# MAXSTACK, inhand];
					inv_grid[# INVHP, selected_slot_eq] = obj_inventory.ds_item_all[# INVHP, inhand];
					inv_grid[# INVSTAMINA, selected_slot_eq] = obj_inventory.ds_item_all[# INVSTAMINA, inhand];
					inv_grid[# INVDAMAGE, selected_slot_eq] = obj_inventory.ds_item_all[# INVDAMAGE, inhand];
					inv_grid[# INVDEFENCE, selected_slot_eq] = obj_inventory.ds_item_all[# INVDEFENCE, inhand];
					inv_grid[# INVEFFECTS, selected_slot_eq] = obj_inventory.ds_item_all[# INVEFFECTS, inhand];
					inv_grid[# INVTEMPERATURE, selected_slot_eq] = obj_inventory.ds_item_all[# INVTEMPERATURE, inhand];
					inv_grid[# MAXCAP, selected_slot_eq] = obj_inventory.ds_item_all[# MAXCAP, inhand];
					
					if (inv_grid[# INVCAP, selected_slot_eq] != cap) || (inv_grid[# INVLEVEL, selected_slot_eq] != lvl){
						var temp0 = inv_grid[# INVITEM, selected_slot_eq];
						var temp1 = inv_grid[# INVAMOUNT, selected_slot_eq];
						var temp2 = inv_grid[# INVLEVEL, selected_slot_eq];
						var temp3 = inv_grid[# INVCAP, selected_slot_eq];
				
						inv_grid[# INVITEM, selected_slot_eq] = inhand;
						inv_grid[# INVAMOUNT, selected_slot_eq] = multipick;
						inv_grid[# INVTYPE, selected_slot_eq] = obj_inventory.ds_item_all[# INVTYPE, inhand];
						inv_grid[# MAXSTACK, selected_slot_eq] = obj_inventory.ds_item_all[# MAXSTACK, inhand];
						inv_grid[# INVHP, selected_slot_eq] = obj_inventory.ds_item_all[# INVHP, inhand];
						inv_grid[# INVSTAMINA, selected_slot_eq] = obj_inventory.ds_item_all[# INVSTAMINA, inhand];
						inv_grid[# INVDAMAGE, selected_slot_eq] = obj_inventory.ds_item_all[# INVDAMAGE, inhand];
						inv_grid[# INVDEFENCE, selected_slot_eq] = obj_inventory.ds_item_all[# INVDEFENCE, inhand];
						inv_grid[# INVEFFECTS, selected_slot_eq] = obj_inventory.ds_item_all[# INVEFFECTS, inhand];
						inv_grid[# INVTEMPERATURE, selected_slot_eq] = obj_inventory.ds_item_all[# INVTEMPERATURE, inhand];
						inv_grid[# INVLEVEL, selected_slot_eq] = lvl;
						inv_grid[# INVCAP, selected_slot_eq] = cap;
						inv_grid[# MAXCAP, selected_slot_eq] = obj_inventory.ds_item_all[# MAXCAP, inhand];
				
						inhand = temp0;
						multipick = temp1;	
						lvl = temp2;	
						cap = temp3;	
					}
					
					multipick = 0;
				}
			}else
			//Jezeli mamy przedmiot w rece i klikamy na slot z innym przedmiotem
			if (inhand != -1) && (inv_grid[# INVITEM, selected_slot_eq] != inhand) && (inv_grid[# INVITEM, selected_slot_eq] != item.none){
				//Zamieniamy przedmioty w rece i slocie
				var temp0 = inv_grid[# INVITEM, selected_slot_eq];
				var temp1 = inv_grid[# INVAMOUNT, selected_slot_eq];
				var temp2 = inv_grid[# INVLEVEL, selected_slot_eq];
				var temp3 = inv_grid[# INVCAP, selected_slot_eq];
				
				inv_grid[# INVITEM, selected_slot_eq] = inhand;
				inv_grid[# INVAMOUNT, selected_slot_eq] = multipick;
				inv_grid[# INVTYPE, selected_slot_eq] = obj_inventory.ds_item_all[# INVTYPE, inhand];
				inv_grid[# MAXSTACK, selected_slot_eq] = obj_inventory.ds_item_all[# MAXSTACK, inhand];
				inv_grid[# INVHP, selected_slot_eq] = obj_inventory.ds_item_all[# INVHP, inhand];
				inv_grid[# INVSTAMINA, selected_slot_eq] = obj_inventory.ds_item_all[# INVSTAMINA, inhand];
				inv_grid[# INVDAMAGE, selected_slot_eq] = obj_inventory.ds_item_all[# INVDAMAGE, inhand];
				inv_grid[# INVDEFENCE, selected_slot_eq] = obj_inventory.ds_item_all[# INVDEFENCE, inhand];
				inv_grid[# INVEFFECTS, selected_slot_eq] = obj_inventory.ds_item_all[# INVEFFECTS, inhand];
				inv_grid[# INVTEMPERATURE, selected_slot_eq] = obj_inventory.ds_item_all[# INVTEMPERATURE, inhand];
				inv_grid[# INVLEVEL, selected_slot_eq] = lvl;
				inv_grid[# INVCAP, selected_slot_eq] = cap;
				inv_grid[# MAXCAP, selected_slot_eq] = obj_inventory.ds_item_all[# MAXCAP, inhand];
				
				inhand = temp0;
				multipick = temp1;	
				lvl = temp2;	
				cap = temp3;	
			}
		}
		//Branie przedmiotow prawym
		if (mouse_check_button_pressed(mb_right)){
			//Jezeli klikamy prawym na przedmiot nie majac nic w rece
			if (inhand == -1) && (inv_grid[# INVITEM, selected_slot_eq] != item.none) && (inv_grid[# INVAMOUNT, selected_slot_eq] > 0) && (multipick < inv_grid[# MAXSTACK, selected_slot_eq]){
				//Od teraz trzymamy w rece przedmiot ze slotu
				inhand = inv_grid[# INVITEM, selected_slot_eq];
				
				if (inv_grid[# INVTYPE, selected_slot_eq] == itemtype.alcohol)
				|| (inv_grid[# INVTYPE, selected_slot_eq] == itemtype.drink)
				|| (inv_grid[# INVTYPE, selected_slot_eq] == itemtype.magazine){
					inhand = inv_grid[# INVITEM, selected_slot_eq];
					multipick = inv_grid[# INVAMOUNT, selected_slot_eq];
					cap = inv_grid[# INVCAP, selected_slot_eq];
					lvl = inv_grid[# INVLEVEL, selected_slot_eq];
				
					slot_remove(selected_slot_eq);
				}else{
					
					if (input_check("inventory_shift")){
						multipick = floor((inv_grid[# INVAMOUNT, selected_slot_eq])/2);
						inv_grid[# INVAMOUNT, selected_slot_eq] -= multipick;
					}else{
						multipick++;
						inv_grid[# INVAMOUNT, selected_slot_eq]--;
					}
				}

			}else
			//Jezeli klikamy prawym na przedmiot majac w rece ten sam przedmiot
			if (inhand != -1) && (inv_grid[# INVITEM, selected_slot_eq] == inhand) && (inv_grid[# INVAMOUNT, selected_slot_eq] > 0) && (multipick < inv_grid[# MAXSTACK, selected_slot_eq]){
				inhand = inv_grid[# INVITEM, selected_slot_eq];
				
				if (inv_grid[# INVCAP, selected_slot_eq] != cap) || (inv_grid[# INVLEVEL, selected_slot_eq] != lvl){
						var temp0 = inv_grid[# INVITEM, selected_slot_eq];
						var temp1 = inv_grid[# INVAMOUNT, selected_slot_eq];
						var temp2 = inv_grid[# INVLEVEL, selected_slot_eq];
						var temp3 = inv_grid[# INVCAP, selected_slot_eq];
				
						inv_grid[# INVITEM, selected_slot_eq] = inhand;
						inv_grid[# INVAMOUNT, selected_slot_eq] = multipick;
						inv_grid[# INVTYPE, selected_slot_eq] = obj_inventory.ds_item_all[# INVTYPE, inhand];
						inv_grid[# MAXSTACK, selected_slot_eq] = obj_inventory.ds_item_all[# MAXSTACK, inhand];
						inv_grid[# INVHP, selected_slot_eq] = obj_inventory.ds_item_all[# INVHP, inhand];
						inv_grid[# INVSTAMINA, selected_slot_eq] = obj_inventory.ds_item_all[# INVSTAMINA, inhand];
						inv_grid[# INVDAMAGE, selected_slot_eq] = obj_inventory.ds_item_all[# INVDAMAGE, inhand];
						inv_grid[# INVDEFENCE, selected_slot_eq] = obj_inventory.ds_item_all[# INVDEFENCE, inhand];
						inv_grid[# INVEFFECTS, selected_slot_eq] = obj_inventory.ds_item_all[# INVEFFECTS, inhand];
						inv_grid[# INVTEMPERATURE, selected_slot_eq] = obj_inventory.ds_item_all[# INVTEMPERATURE, inhand];
						inv_grid[# INVLEVEL, selected_slot_eq] = lvl;
						inv_grid[# INVCAP, selected_slot_eq] = cap;
						inv_grid[# MAXCAP, selected_slot_eq] = obj_inventory.ds_item_all[# MAXCAP, inhand];
				
						inhand = temp0;
						multipick = temp1;	
						lvl = temp2;	
						cap = temp3;	
				}else{
					if (input_check("inventory_shift")){
						if (inv_grid[# INVAMOUNT, selected_slot_eq] == 1){
							multipick++;
							slot_remove(selected_slot_eq);
						}else{
							var mm = floor((inv_grid[# INVAMOUNT, selected_slot_eq])/2);
							if (multipick + mm >= inv_grid[# MAXSTACK, selected_slot_eq]){
								var mi = (inv_grid[# MAXSTACK, selected_slot_eq] - multipick);
								inv_grid[# INVAMOUNT, selected_slot_eq] -= mi;
								multipick = inv_grid[# MAXSTACK, selected_slot_eq];
							}else{
								multipick += mm;
								inv_grid[# INVAMOUNT, selected_slot_eq] -= mm;
							}	
						}
					}else{
						multipick++;
						inv_grid[# INVAMOUNT, selected_slot_eq]--;
					}
				}
			}
		}
		

		
	}else if ((mousex >= xUI) && (mousex < endx) && (mousey >= yUI) && (mousey < endy)){

		
		//Uzywanie shifta
		if (mouse_check_button_pressed(mb_left)) && (keyboard_check(vk_shift)){
		}
		
		//Branie przedmiotow lewym
		if (mouse_check_button_pressed(mb_left)) && !(keyboard_check(vk_shift)){
			//Jezeli nie mamy nic w rece i klikamy na slot z przedmiotem
			if (inhand == -1) && (con_grid[# INVITEM, selected_slot] != item.none){
				//Od teraz trzymamy w rece przedmiot ze slotu
				inhand = con_grid[# INVITEM, selected_slot];
				multipick = con_grid[# INVAMOUNT, selected_slot];
				cap = con_grid[# INVCAP, selected_slot];
				lvl = con_grid[# INVLEVEL, selected_slot];
				
				con_grid[# INVITEM, selected_slot] = item.none;
				con_grid[# INVAMOUNT, selected_slot] = 0;
				con_grid[# INVTYPE, selected_slot] = -1;
				con_grid[# MAXSTACK, selected_slot] = 0;
				con_grid[# INVHP, selected_slot] = 0;
				con_grid[# INVSTAMINA, selected_slot] = 0;
				con_grid[# INVLEVEL, selected_slot] = 0;
				con_grid[# INVDAMAGE, selected_slot] = 0;
				con_grid[# INVDEFENCE, selected_slot] = 0;
				con_grid[# INVEFFECTS, selected_slot] = 0;
				con_grid[# INVTEMPERATURE, selected_slot] = 0;
				con_grid[# INVCAP, selected_slot] = -1;
				con_grid[# MAXCAP, selected_slot] = -1;
			}else
			//Jezeli mamy przedmiot w rece i klikamy na pusty slot
			if (inhand != -1) && (con_grid[# INVITEM, selected_slot] == item.none){
				//Kladziemy przedmiot na slot
				con_grid[# INVITEM, selected_slot] = inhand;
				con_grid[# INVAMOUNT, selected_slot] = multipick;
				con_grid[# INVTYPE, selected_slot] = obj_inventory.ds_item_all[# INVTYPE, inhand];
				con_grid[# MAXSTACK, selected_slot] = obj_inventory.ds_item_all[# MAXSTACK, inhand];
				con_grid[# INVHP, selected_slot] = obj_inventory.ds_item_all[# INVHP, inhand];
				con_grid[# INVSTAMINA, selected_slot] = obj_inventory.ds_item_all[# INVSTAMINA, inhand];
				con_grid[# INVLEVEL, selected_slot] = lvl;
				con_grid[# INVDAMAGE, selected_slot] = obj_inventory.ds_item_all[# INVDAMAGE, inhand];
				con_grid[# INVDEFENCE, selected_slot] = obj_inventory.ds_item_all[# INVDEFENCE, inhand];
				con_grid[# INVEFFECTS, selected_slot] = obj_inventory.ds_item_all[# INVEFFECTS, inhand];
				con_grid[# INVTEMPERATURE, selected_slot] = obj_inventory.ds_item_all[# INVTEMPERATURE, inhand];
				con_grid[# INVCAP, selected_slot] = cap;
				con_grid[# MAXCAP, selected_slot] = obj_inventory.ds_item_all[# MAXCAP, inhand];	
				
				inhand = -1;
				multipick = 0;
				cap = -1;
				lvl = 0;
			}else
			//Jezeli mamy przedmiot w rece i klikamy na slot z tym samym przedmiotem
			if (inhand != -1) && (con_grid[# INVITEM, selected_slot] == inhand){
				//Jezeli ilosc przedmiotu ktory trzymamy jest taka ze gdy go polozymy to przekroczymy maxstack
				if (con_grid[# INVAMOUNT, selected_slot] + multipick >= con_grid[# MAXSTACK, selected_slot]){
					//Na slocie maxstack, w rece reszta
					var am = con_grid[# INVAMOUNT, selected_slot];
					var am2 = multipick;
					con_grid[# INVAMOUNT, selected_slot] = con_grid[# MAXSTACK, selected_slot];
					con_grid[# MAXSTACK, selected_slot] = obj_inventory.ds_item_all[# MAXSTACK, inhand];
					con_grid[# INVHP, selected_slot] = obj_inventory.ds_item_all[# INVHP, inhand];
					con_grid[# INVSTAMINA, selected_slot] = obj_inventory.ds_item_all[# INVSTAMINA, inhand];
					con_grid[# INVDAMAGE, selected_slot] = obj_inventory.ds_item_all[# INVDAMAGE, inhand];
					con_grid[# INVDEFENCE, selected_slot] = obj_inventory.ds_item_all[# INVDEFENCE, inhand];
					con_grid[# INVEFFECTS, selected_slot] = obj_inventory.ds_item_all[# INVEFFECTS, inhand];
					con_grid[# INVTEMPERATURE, selected_slot] = obj_inventory.ds_item_all[# INVTEMPERATURE, inhand];
					con_grid[# MAXCAP, selected_slot] = obj_inventory.ds_item_all[# MAXCAP, inhand];
					
					if (con_grid[# INVCAP, selected_slot] != cap) || (con_grid[# INVLEVEL, selected_slot] != lvl){
						var temp0 = con_grid[# INVITEM, selected_slot];
						var temp1 = con_grid[# INVAMOUNT, selected_slot];
						var temp2 = con_grid[# INVLEVEL, selected_slot];
						var temp3 = con_grid[# INVCAP, selected_slot];
				
						con_grid[# INVITEM, selected_slot] = inhand;
						con_grid[# INVAMOUNT, selected_slot] = multipick;
						con_grid[# INVTYPE, selected_slot] = obj_inventory.ds_item_all[# INVTYPE, inhand];
						con_grid[# MAXSTACK, selected_slot] = obj_inventory.ds_item_all[# MAXSTACK, inhand];
						con_grid[# INVHP, selected_slot] = obj_inventory.ds_item_all[# INVHP, inhand];
						con_grid[# INVSTAMINA, selected_slot] = obj_inventory.ds_item_all[# INVSTAMINA, inhand];
						con_grid[# INVDAMAGE, selected_slot] = obj_inventory.ds_item_all[# INVDAMAGE, inhand];
						con_grid[# INVDEFENCE, selected_slot] = obj_inventory.ds_item_all[# INVDEFENCE, inhand];
						con_grid[# INVEFFECTS, selected_slot] = obj_inventory.ds_item_all[# INVEFFECTS, inhand];
						con_grid[# INVTEMPERATURE, selected_slot] = obj_inventory.ds_item_all[# INVTEMPERATURE, inhand];
						con_grid[# INVLEVEL, selected_slot] = lvl;
						con_grid[# INVCAP, selected_slot] = cap;
						con_grid[# MAXCAP, selected_slot] = obj_inventory.ds_item_all[# MAXCAP, inhand];
				
						inhand = temp0;
						multipick = temp1;	
						lvl = temp2;	
						cap = temp3;	
					}
					
					multipick = am + am2 - con_grid[# MAXSTACK, selected_slot];
				}else{
					//Jezeli ilosc przedmiotu jest mniejsza kladziemy normalnie
					con_grid[# INVAMOUNT, selected_slot] += multipick;
					con_grid[# INVTYPE, selected_slot] = obj_inventory.ds_item_all[# INVTYPE, inhand];
					con_grid[# MAXSTACK, selected_slot] = obj_inventory.ds_item_all[# MAXSTACK, inhand];
					con_grid[# INVHP, selected_slot] = obj_inventory.ds_item_all[# INVHP, inhand];
					con_grid[# INVSTAMINA, selected_slot] = obj_inventory.ds_item_all[# INVSTAMINA, inhand];
					con_grid[# INVDAMAGE, selected_slot] = obj_inventory.ds_item_all[# INVDAMAGE, inhand];
					con_grid[# INVDEFENCE, selected_slot] = obj_inventory.ds_item_all[# INVDEFENCE, inhand];
					con_grid[# INVEFFECTS, selected_slot] = obj_inventory.ds_item_all[# INVEFFECTS, inhand];
					con_grid[# INVTEMPERATURE, selected_slot] = obj_inventory.ds_item_all[# INVTEMPERATURE, inhand];
					con_grid[# MAXCAP, selected_slot] = obj_inventory.ds_item_all[# MAXCAP, inhand];
					
					if (con_grid[# INVCAP, selected_slot] != cap) || (con_grid[# INVLEVEL, selected_slot] != lvl){
						var temp0 = con_grid[# INVITEM, selected_slot];
						var temp1 = con_grid[# INVAMOUNT, selected_slot];
						var temp2 = con_grid[# INVLEVEL, selected_slot];
						var temp3 = con_grid[# INVCAP, selected_slot];
				
						con_grid[# INVITEM, selected_slot] = inhand;
						con_grid[# INVAMOUNT, selected_slot] = multipick;
						con_grid[# INVTYPE, selected_slot] = obj_inventory.ds_item_all[# INVTYPE, inhand];
						con_grid[# MAXSTACK, selected_slot] = obj_inventory.ds_item_all[# MAXSTACK, inhand];
						con_grid[# INVHP, selected_slot] = obj_inventory.ds_item_all[# INVHP, inhand];
						con_grid[# INVSTAMINA, selected_slot] = obj_inventory.ds_item_all[# INVSTAMINA, inhand];
						con_grid[# INVDAMAGE, selected_slot] = obj_inventory.ds_item_all[# INVDAMAGE, inhand];
						con_grid[# INVDEFENCE, selected_slot] = obj_inventory.ds_item_all[# INVDEFENCE, inhand];
						con_grid[# INVEFFECTS, selected_slot] = obj_inventory.ds_item_all[# INVEFFECTS, inhand];
						con_grid[# INVTEMPERATURE, selected_slot] = obj_inventory.ds_item_all[# INVTEMPERATURE, inhand];
						con_grid[# INVLEVEL, selected_slot] = lvl;
						con_grid[# INVCAP, selected_slot] = cap;
						con_grid[# MAXCAP, selected_slot] = obj_inventory.ds_item_all[# MAXCAP, inhand];
				
						inhand = temp0;
						multipick = temp1;	
						lvl = temp2;	
						cap = temp3;	
					}
					
					multipick = 0;
				}
			}else
			//Jezeli mamy przedmiot w rece i klikamy na slot z innym przedmiotem
			if (inhand != -1) && (con_grid[# INVITEM, selected_slot] != inhand) && (con_grid[# INVITEM, selected_slot] != item.none){
				//Zamieniamy przedmioty w rece i slocie
				var temp0 = con_grid[# INVITEM, selected_slot];
				var temp1 = con_grid[# INVAMOUNT, selected_slot];
				var temp2 = con_grid[# INVLEVEL, selected_slot];
				var temp3 = con_grid[# INVCAP, selected_slot];
				
				con_grid[# INVITEM, selected_slot] = inhand;
				con_grid[# INVAMOUNT, selected_slot] = multipick;
				con_grid[# INVTYPE, selected_slot] = obj_inventory.ds_item_all[# INVTYPE, inhand];
				con_grid[# MAXSTACK, selected_slot] = obj_inventory.ds_item_all[# MAXSTACK, inhand];
				con_grid[# INVHP, selected_slot] = obj_inventory.ds_item_all[# INVHP, inhand];
				con_grid[# INVSTAMINA, selected_slot] = obj_inventory.ds_item_all[# INVSTAMINA, inhand];
				con_grid[# INVDAMAGE, selected_slot] = obj_inventory.ds_item_all[# INVDAMAGE, inhand];
				con_grid[# INVDEFENCE, selected_slot] = obj_inventory.ds_item_all[# INVDEFENCE, inhand];
				con_grid[# INVEFFECTS, selected_slot] = obj_inventory.ds_item_all[# INVEFFECTS, inhand];
				con_grid[# INVTEMPERATURE, selected_slot] = obj_inventory.ds_item_all[# INVTEMPERATURE, inhand];
				con_grid[# INVLEVEL, selected_slot] = lvl;
				con_grid[# INVCAP, selected_slot] = cap;
				con_grid[# MAXCAP, selected_slot] = obj_inventory.ds_item_all[# MAXCAP, inhand];
				
				inhand = temp0;
				multipick = temp1;	
				lvl = temp2;	
				cap = temp3;	
			}
		}
		//Branie przedmiotow prawym
		if (mouse_check_button_pressed(mb_right)){
			//Jezeli klikamy prawym na przedmiot nie majac nic w rece
			if (inhand == -1) && (con_grid[# INVITEM, selected_slot] != item.none) && (con_grid[# INVAMOUNT, selected_slot] > 0) && (multipick < con_grid[# MAXSTACK, selected_slot]){
				//Od teraz trzymamy w rece przedmiot ze slotu
				inhand = con_grid[# INVITEM, selected_slot];
				
				if (con_grid[# INVTYPE, selected_slot] == itemtype.alcohol)
				|| (con_grid[# INVTYPE, selected_slot] == itemtype.drink)
				|| (con_grid[# INVTYPE, selected_slot] == itemtype.magazine){
					multipick = con_grid[# INVAMOUNT, selected_slot];
					cap = con_grid[# INVCAP, selected_slot];
					lvl = con_grid[# INVLEVEL, selected_slot];
				
					con_grid[# INVITEM, selected_slot] = item.none;
					con_grid[# INVAMOUNT, selected_slot] = 0;
					con_grid[# INVTYPE, selected_slot] = -1;
					con_grid[# MAXSTACK, selected_slot] = 0;
					con_grid[# INVHP, selected_slot] = 0;
					con_grid[# INVSTAMINA, selected_slot] = 0;
					con_grid[# INVLEVEL, selected_slot] = 0;
					con_grid[# INVDAMAGE, selected_slot] = 0;
					con_grid[# INVDEFENCE, selected_slot] = 0;
					con_grid[# INVEFFECTS, selected_slot] = 0;
					con_grid[# INVTEMPERATURE, selected_slot] = 0;
					con_grid[# INVCAP, selected_slot] = -1;
					con_grid[# MAXCAP, selected_slot] = -1;
				}else{
					
					if (input_check("inventory_shift")){
						multipick = floor((con_grid[# INVAMOUNT, selected_slot])/2);
						con_grid[# INVAMOUNT, selected_slot] -= multipick;
					}else{
						multipick++;
						con_grid[# INVAMOUNT, selected_slot]--;
					}
				}

			}else
			//Jezeli klikamy prawym na przedmiot majac w rece ten sam przedmiot
			if (inhand != -1) && (con_grid[# INVITEM, selected_slot] == inhand) && (con_grid[# INVAMOUNT, selected_slot] > 0) && (multipick < con_grid[# MAXSTACK, selected_slot]){
				inhand = con_grid[# INVITEM, selected_slot];
				
				if (con_grid[# INVCAP, selected_slot] != cap) || (con_grid[# INVLEVEL, selected_slot] != lvl){
						var temp0 = con_grid[# INVITEM, selected_slot];
						var temp1 = con_grid[# INVAMOUNT, selected_slot];
						var temp2 = con_grid[# INVLEVEL, selected_slot];
						var temp3 = con_grid[# INVCAP, selected_slot];
				
						con_grid[# INVITEM, selected_slot] = inhand;
						con_grid[# INVAMOUNT, selected_slot] = multipick;
						con_grid[# INVTYPE, selected_slot] = obj_inventory.ds_item_all[# INVTYPE, inhand];
						con_grid[# MAXSTACK, selected_slot] = obj_inventory.ds_item_all[# MAXSTACK, inhand];
						con_grid[# INVHP, selected_slot] = obj_inventory.ds_item_all[# INVHP, inhand];
						con_grid[# INVSTAMINA, selected_slot] = obj_inventory.ds_item_all[# INVSTAMINA, inhand];
						con_grid[# INVDAMAGE, selected_slot] = obj_inventory.ds_item_all[# INVDAMAGE, inhand];
						con_grid[# INVDEFENCE, selected_slot] = obj_inventory.ds_item_all[# INVDEFENCE, inhand];
						con_grid[# INVEFFECTS, selected_slot] = obj_inventory.ds_item_all[# INVEFFECTS, inhand];
						con_grid[# INVTEMPERATURE, selected_slot] = obj_inventory.ds_item_all[# INVTEMPERATURE, inhand];
						con_grid[# INVLEVEL, selected_slot] = lvl;
						con_grid[# INVCAP, selected_slot] = cap;
						con_grid[# MAXCAP, selected_slot] = obj_inventory.ds_item_all[# MAXCAP, inhand];
				
						inhand = temp0;
						multipick = temp1;	
						lvl = temp2;	
						cap = temp3;	
				}else{
					if (input_check("inventory_shift")){
						if (con_grid[# INVAMOUNT, selected_slot] == 1){
							multipick++;
							con_grid[# INVITEM, selected_slot] = item.none;
							con_grid[# INVAMOUNT, selected_slot] = 0;
							con_grid[# INVTYPE, selected_slot] = -1;
							con_grid[# MAXSTACK, selected_slot] = 0;
							con_grid[# INVHP, selected_slot] = 0;
							con_grid[# INVSTAMINA, selected_slot] = 0;
							con_grid[# INVLEVEL, selected_slot] = 0;
							con_grid[# INVDAMAGE, selected_slot] = 0;
							con_grid[# INVDEFENCE, selected_slot] = 0;
							con_grid[# INVEFFECTS, selected_slot] = 0;
							con_grid[# INVTEMPERATURE, selected_slot] = 0;
							con_grid[# INVCAP, selected_slot] = -1;
							con_grid[# MAXCAP, selected_slot] = -1;
						}else{
							var mm = floor((con_grid[# INVAMOUNT, selected_slot])/2);
							if (multipick + mm >= con_grid[# MAXSTACK, selected_slot]){
								var mi = (con_grid[# MAXSTACK, selected_slot] - multipick);
								con_grid[# INVAMOUNT, selected_slot] -= mi;
								multipick = con_grid[# MAXSTACK, selected_slot];
							}else{
								multipick += mm;
								con_grid[# INVAMOUNT, selected_slot] -= mm;
							}	
						}
					}else{
						multipick++;
						con_grid[# INVAMOUNT, selected_slot]--;
					}
				}
			}
		}
		


	}else{
		//Jezeli myszka jest poza ekranem ekwipunku
		if (selected_slot_eq == -1){
			if (mouse_check_button_pressed(mb_left)){
				//Jezeli trzymasz cos w rece wyrzuc to
				if (inhand != -1){
					item_drop(inhand, multipick, lvl, cap, true, obj_amadix.x, obj_amadix.y, 5);		
					inhand = -1;
					multipick = 0;
					cap = -1;
					lvl = 0;
				}
			}
		}
	}
	}
	
	//Jezeli istnieje w siatce przedmiot o ilosci zerowej usun go
	for (var i = 0; i < obj_inventory.inv_slots; ++i){
	    if ((inv_grid[# INVAMOUNT, i] == 0) && (inv_grid[# INVITEM, i] != item.none)){
				slot_remove(i);
		}
		if (inv_grid[# INVCAP, i] <= 0) && (inv_grid[# INVCAP, i] != -1){
			inv_grid[# INVCAP, i] = 0;	
		}
	}
	
	/*
	for (var i = 0; i < containerSlots; ++i){
	    if ((inv_grid[# INVAMOUNT, i] == 0) && (inv_grid[# INVITEM, i] != item.none)){
				slot_remove(i);
		}
	}
	*/
	
	if (inhand == -1){
		multipick = 0;	
	}
	if (multipick == 0){
		inhand = -1;	
	}
		
	}
}