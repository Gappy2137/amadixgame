//if (keyboard_check_pressed(ord("E"))) {show_inventory = !show_inventory;}
//if (keyboard_check_pressed(ord("R"))) {show_slots = !show_slots;}

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
	var endUIx = invUI_width + endx;

	var endy = (gui_height - invUI_height)/2;
	var endUIy = invUI_height + endy;

	if (mousex >= xUI) && (mousex < endUIx) && (mousey >= yUI) && (mousey < endUIy){
		var sx = i_mousex - (numx * cell_xoffset);
		var sy = i_mousey - (numy * cell_yoffset);
	
		if ((sx < cell_size*scale) && (sy < cell_size*scale)){
			mouse_slotx = numx;
			mouse_sloty = numy;
		}
		switch(page){
			case 0:
				selected_slot = min(inv_slots - 1, mouse_slotx + (mouse_sloty * inv_slots_width));
			break;
			case 1:
				selected_slot = min(inv_slots - 1 + 84, mouse_slotx + (mouse_sloty * inv_slots_width) + 84);
			break;
		}
	
	}else{
		selected_slot = -1;
	}
	
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
	
	#endregion


	#region Operacje na przedmiotach
	var inv_grid = ds_inventory;
	var ss_item = inv_grid[# 0, selected_slot];
	var ss_item_amount = inv_grid[# 1, selected_slot];
	var ss_item_type = inv_grid[# 2, selected_slot];
	var ss_item_maxstack = inv_grid[# 3, selected_slot];
	var ss_item_hp = inv_grid[# 4, selected_slot];
	var ss_item_stamina = inv_grid[# 5, selected_slot];
	var ss_item_level = inv_grid[# 6, selected_slot];
	var ss_item_damage = inv_grid[# 7, selected_slot];
	var ss_item_defence = inv_grid[# 8, selected_slot];
	var ss_item_effect1 = inv_grid[# 9, selected_slot];
	var ss_item_effect2 = inv_grid[# 10, selected_slot];
	var ss_item_effect3 = inv_grid[# 11, selected_slot];
	
	var ss_item_pick = inv_grid[# 0, picked_slot];
	var ss_item_pick_amount = inv_grid[# 1, picked_slot];
	var ss_item_pick_type = inv_grid[# 2, picked_slot];
	var ss_item_pick_maxstack = inv_grid[# 3, picked_slot];
	var ss_item_pick_hp = inv_grid[# 4, picked_slot];
	var ss_item_pick_stamina = inv_grid[# 5, picked_slot];
	var ss_item_pick_level = inv_grid[# 6, picked_slot];
	var ss_item_pick_damage = inv_grid[# 7, picked_slot];
	var ss_item_pick_defence = inv_grid[# 8, picked_slot];
	var ss_item_pick_effect1 = inv_grid[# 9, picked_slot];
	var ss_item_pick_effect2 = inv_grid[# 10, picked_slot];
	var ss_item_pick_effect3 = inv_grid[# 11, picked_slot];

	if (mousex >= xUI) && (mousex < endUIx) && (mousey >= yUI) && (mousey < endUIy){
		if(picked_slot != -1){
			if (mouse_check_button_pressed(mb_left)){
				if(ss_item == item.none){
				
					//Jezeli klikamy lewym na slot w ktorym nie ma nic
				
					if (multipick > 0){
					
						//Jezeli trzymamy jakas ilosc przedmiotow
					
						inv_grid[# 0, selected_slot] = inhand;
						inv_grid[# 1, selected_slot] = multipick;
						inv_grid[# 2, selected_slot] = multipick_2;
						inv_grid[# 3, selected_slot] = multipick_3;
						inv_grid[# 4, selected_slot] = multipick_4;
						inv_grid[# 5, selected_slot] = multipick_5;
						inv_grid[# 6, selected_slot] = multipick_6;
						inv_grid[# 7, selected_slot] = multipick_7;
						inv_grid[# 8, selected_slot] = multipick_8;
						inv_grid[# 9, selected_slot] = multipick_9;
						inv_grid[# 10, selected_slot] = multipick_10;
						inv_grid[# 11, selected_slot] = multipick_11;

						picked_slot = -1;
						
						inhand = -1;
						
						
						onepicked_slot = 0;
						multipick = 0;
						multipick_item = -1;
						changeitem = false;

						multipick_2 = -1;
						multipick_3 = -1;
						multipick_4 = -1;
						multipick_5 = -1;
						multipick_6 = -1;
						multipick_7 = -1;
						multipick_8 = -1;
						multipick_9 = -1;
						multipick_10 = -1;
						multipick_11 = -1;
					}else{
				
						//Jezeli trzymamy caly stack
				
						inv_grid[# 0, selected_slot] = inv_grid[# 0, picked_slot];
						inv_grid[# 1, selected_slot] = inv_grid[# 1, picked_slot];
						inv_grid[# 2, selected_slot] = inv_grid[# 2, picked_slot];
						inv_grid[# 3, selected_slot] = inv_grid[# 3, picked_slot];
						inv_grid[# 4, selected_slot] = inv_grid[# 4, picked_slot];
						inv_grid[# 5, selected_slot] = inv_grid[# 5, picked_slot];
						inv_grid[# 6, selected_slot] = inv_grid[# 6, picked_slot];
						inv_grid[# 7, selected_slot] = inv_grid[# 7, picked_slot];
						inv_grid[# 8, selected_slot] = inv_grid[# 8, picked_slot];
						inv_grid[# 9, selected_slot] = inv_grid[# 9, picked_slot];
						inv_grid[# 10, selected_slot] = inv_grid[# 10, picked_slot];
						inv_grid[# 11, selected_slot] = inv_grid[# 11, picked_slot];
			
						inv_grid[# 0, picked_slot] = item.none;
						inv_grid[# 1, picked_slot] = 0;
						inv_grid[# 2, picked_slot] = 0;
						inv_grid[# 3, picked_slot] = 0;
						inv_grid[# 4, picked_slot] = 0;
						inv_grid[# 5, picked_slot] = 0;
						inv_grid[# 6, picked_slot] = 0;
						inv_grid[# 7, picked_slot] = 0;
						inv_grid[# 8, picked_slot] = 0;
						inv_grid[# 9, picked_slot] = 0;
						inv_grid[# 10, picked_slot] = 0;
						inv_grid[# 11, picked_slot] = 0;
						
						picked_slot = -1;
						
						inhand = -1;
						
						onepicked_slot = 0;
						picked_slot_right = -1;
						changeitem = false;
						
						multipick_2 = -1;
						multipick_3 = -1;
						multipick_4 = -1;
						multipick_5 = -1;
						multipick_6 = -1;
						multipick_7 = -1;
						multipick_8 = -1;
						multipick_9 = -1;
						multipick_10 = -1;
						multipick_11 = -1;
					}
			
				}else if (ss_item == inhand){
				
					//Jezeli klikamy lewym na slot w ktorym znajduje sie ten sam rodzaj przedmiotu
				
					if (multipick > 0){
						if ((inv_grid[# 1, selected_slot] + multipick) <= inv_grid[# 3, selected_slot]){
							//Jezeli trzymamy jakas ilosc przedmiotow
					
							inv_grid[# 0, selected_slot] = inhand;
							inv_grid[# 1, selected_slot] += multipick;
			
							picked_slot = -1;
							
							inhand = -1;
							
							onepicked_slot = 0;
							multipick = 0;
							multipick_item = -1;
						}else if (inv_grid[# 1, selected_slot] < inv_grid[# 3, selected_slot]){
							var am = (inv_grid[# 3, selected_slot] - inv_grid[# 1, selected_slot]);
							inv_grid[# 1, selected_slot] += am;
							multipick -= am;
						}
					
					}else{
						
						if (selected_slot != picked_slot){
							if ((inv_grid[# 1, selected_slot] + inv_grid[# 1, picked_slot]) < inv_grid[# 3, selected_slot]){
								//Jezeli trzymamy caly stack
				
								inv_grid[# 1, selected_slot] += inv_grid[# 1, picked_slot];
				
								inv_grid[# 0, picked_slot] = item.none;
								inv_grid[# 1, picked_slot] = 0;
								inv_grid[# 2, picked_slot] = 0;
								inv_grid[# 3, picked_slot] = 0;
								inv_grid[# 4, picked_slot] = 0;
								inv_grid[# 5, picked_slot] = 0;
								inv_grid[# 6, picked_slot] = 0;
								inv_grid[# 7, picked_slot] = 0;
								inv_grid[# 8, picked_slot] = 0;
								inv_grid[# 9, picked_slot] = 0;
								inv_grid[# 10, picked_slot] = 0;
								inv_grid[# 11, picked_slot] = 0;
								
								picked_slot = -1;
								
								inhand = -1;
								
								onepicked_slot = 0;
								picked_slot_right = -1;
								changeitem = false;
							}else if (inv_grid[# 1, selected_slot] < inv_grid[# 3, selected_slot]){
									var am = (inv_grid[# 3, selected_slot] - inv_grid[# 1, selected_slot]);
									inv_grid[# 1, selected_slot] += am;
									inv_grid[# 1, picked_slot] -= am;
								}
							}else{
							picked_slot = -1;
							
							inhand = -1;
							
							onepicked_slot = 0;
							picked_slot_right = -1;
							changeitem = false;
							
							multipick_2 = -1;
							multipick_3 = -1;
							multipick_4 = -1;
							multipick_5 = -1;
							multipick_6 = -1;
							multipick_7 = -1;
							multipick_8 = -1;
							multipick_9 = -1;
							multipick_10 = -1;
							multipick_11 = -1;
						}
					}

				}else{
					//Zamiana przedmiotow
					if (multipick > 0){
						//Jezeli klikamy lewym na inny przedmiot w slocie trzymajac jakas ilosc przedmiotow
						var temp0 = inv_grid[# 0, selected_slot];
						var temp1 = inv_grid[# 1, selected_slot];
						var temp2 = inv_grid[# 2, selected_slot];
						var temp3 = inv_grid[# 3, selected_slot];
						var temp4 = inv_grid[# 4, selected_slot];
						var temp5 = inv_grid[# 5, selected_slot];
						var temp6 = inv_grid[# 6, selected_slot];
						var temp7 = inv_grid[# 7, selected_slot];
						var temp8 = inv_grid[# 8, selected_slot];
						var temp9 = inv_grid[# 9, selected_slot];
						var temp10 = inv_grid[# 10, selected_slot];
						var temp11 = inv_grid[# 11, selected_slot];
						
						inv_grid[# 0, selected_slot] = inhand;
						inv_grid[# 1, selected_slot] = multipick;
						inv_grid[# 2, selected_slot] = multipick_2;
						inv_grid[# 3, selected_slot] = multipick_3;
						inv_grid[# 4, selected_slot] = multipick_4;
						inv_grid[# 5, selected_slot] = multipick_5;
						inv_grid[# 6, selected_slot] = multipick_6;
						inv_grid[# 7, selected_slot] = multipick_7;
						inv_grid[# 8, selected_slot] = multipick_8;
						inv_grid[# 9, selected_slot] = multipick_9;
						inv_grid[# 10, selected_slot] = multipick_10;
						inv_grid[# 11, selected_slot] = multipick_11;
						
						inhand = temp0;
						multipick = temp1;
						multipick_2 = temp2;
						multipick_3 = temp3;
						multipick_4 = temp4;
						multipick_5 = temp5;
						multipick_6 = temp6;
						multipick_7 = temp7;
						multipick_8 = temp8;
						multipick_9 = temp9;
						multipick_10 = temp10;
						multipick_11 = temp11;
					
					}else{
						//Jezeli klikamy lewym na inny przedmiot w slocie trzymajac caly stack
				
						inv_grid[# 0, selected_slot] = inv_grid[# 0, picked_slot];
						inv_grid[# 1, selected_slot] = inv_grid[# 1, picked_slot];
						inv_grid[# 2, selected_slot] = inv_grid[# 2, picked_slot];
						inv_grid[# 3, selected_slot] = inv_grid[# 3, picked_slot];
						inv_grid[# 4, selected_slot] = inv_grid[# 4, picked_slot];
						inv_grid[# 5, selected_slot] = inv_grid[# 5, picked_slot];
						inv_grid[# 6, selected_slot] = inv_grid[# 6, picked_slot];
						inv_grid[# 7, selected_slot] = inv_grid[# 7, picked_slot];
						inv_grid[# 8, selected_slot] = inv_grid[# 8, picked_slot];
						inv_grid[# 9, selected_slot] = inv_grid[# 9, picked_slot];
						inv_grid[# 10, selected_slot] = inv_grid[# 10, picked_slot];
						inv_grid[# 11, selected_slot] = inv_grid[# 11, picked_slot];
						
						inv_grid[# 0, picked_slot] = ss_item;
						inv_grid[# 1, picked_slot] = ss_item_amount;
						inv_grid[# 2, picked_slot] = ss_item_type;
						inv_grid[# 3, picked_slot] = ss_item_maxstack;
						inv_grid[# 4, picked_slot] = ss_item_hp;
						inv_grid[# 5, picked_slot] = ss_item_stamina;
						inv_grid[# 6, picked_slot] = ss_item_level;
						inv_grid[# 7, picked_slot] = ss_item_damage;
						inv_grid[# 8, picked_slot] = ss_item_defence;
						inv_grid[# 9, picked_slot] = ss_item_effect1;
						inv_grid[# 10, picked_slot] = ss_item_effect2;
						inv_grid[# 11, picked_slot] = ss_item_effect3;
					
						inhand = ss_item;
					
						onepicked_slot = 0;
						picked_slot_right = -1;
						multipick_item = -1;
						changeitem = false;
					}
				}
			}
		
		}
		else if (ss_item != item.none){
	
			if (mouse_check_button_pressed(mb_left)){
				picked_slot = selected_slot;
				inhand = inv_grid[# 0, picked_slot];
				onepicked_slot = 0;
			}
		
		}
	
		if (ss_item != item.none){
				if (mouse_check_button_pressed(mb_right)) && (inhand != -1){
				
					if !(inhand == inv_grid[# 0, selected_slot]){
						
					}else{
						if (ss_item_amount > 1){
								onepicked_slot = 1;
								picked_slot = selected_slot;
								picked_slot_right = selected_slot;
								multipick += 1;
								multipick_zerobuffer = false;
								inv_grid[# 1, picked_slot] -= 1;
								multipick_item = inv_grid[# 0, picked_slot];
								inhand = inv_grid[# 0, picked_slot];
							
								multipick_2 = inv_grid[# 2, picked_slot];
								multipick_3 = inv_grid[# 3, picked_slot];
								multipick_4 = inv_grid[# 4, picked_slot];
								multipick_5 = inv_grid[# 5, picked_slot];
								multipick_6 = inv_grid[# 6, picked_slot];
								multipick_7 = inv_grid[# 7, picked_slot];
								multipick_8 = inv_grid[# 8, picked_slot];
								multipick_9 = inv_grid[# 9, picked_slot];
								multipick_10 = inv_grid[# 10, picked_slot];
								multipick_11 = inv_grid[# 11, picked_slot];
							
						}else if (ss_item_amount == 1){
							if (picked_slot != selected_slot){
								onepicked_slot = 1;
								picked_slot = selected_slot;
								picked_slot_right = selected_slot;
								multipick += 1;
								multipick_zerobuffer = true;
								inv_grid[# 1, picked_slot] = 0;
								multipick_item = inv_grid[# 0, picked_slot];
								inhand = inv_grid[# 0, picked_slot];
							
								multipick_2 = inv_grid[# 2, picked_slot];
								multipick_3 = inv_grid[# 3, picked_slot];
								multipick_4 = inv_grid[# 4, picked_slot];
								multipick_5 = inv_grid[# 5, picked_slot];
								multipick_6 = inv_grid[# 6, picked_slot];
								multipick_7 = inv_grid[# 7, picked_slot];
								multipick_8 = inv_grid[# 8, picked_slot];
								multipick_9 = inv_grid[# 9, picked_slot];
								multipick_10 = inv_grid[# 10, picked_slot];
								multipick_11 = inv_grid[# 11, picked_slot];
							}else{
								onepicked_slot = 1;
								picked_slot = selected_slot;
								picked_slot_right = selected_slot;
								multipick += 1;
								multipick_zerobuffer = true;
								inv_grid[# 1, picked_slot] = 0;
								multipick_item = inv_grid[# 0, picked_slot];
								inhand = inv_grid[# 0, picked_slot];
							
								multipick_2 = inv_grid[# 2, picked_slot];
								multipick_3 = inv_grid[# 3, picked_slot];
								multipick_4 = inv_grid[# 4, picked_slot];
								multipick_5 = inv_grid[# 5, picked_slot];
								multipick_6 = inv_grid[# 6, picked_slot];
								multipick_7 = inv_grid[# 7, picked_slot];
								multipick_8 = inv_grid[# 8, picked_slot];
								multipick_9 = inv_grid[# 9, picked_slot];
								multipick_10 = inv_grid[# 10, picked_slot];
								multipick_11 = inv_grid[# 11, picked_slot];
							}
						}
				
				
				
				
					}

				}else if (mouse_check_button_pressed(mb_right)) && (inhand == -1){
						if (ss_item_amount > 1){
								onepicked_slot = 1;
								picked_slot = selected_slot;
								picked_slot_right = selected_slot;
								multipick += 1;
								multipick_zerobuffer = false;
								inv_grid[# 1, picked_slot] -= 1;
								multipick_item = inv_grid[# 0, picked_slot];
								inhand = inv_grid[# 0, picked_slot];
							
								multipick_2 = inv_grid[# 2, picked_slot];
								multipick_3 = inv_grid[# 3, picked_slot];
								multipick_4 = inv_grid[# 4, picked_slot];
								multipick_5 = inv_grid[# 5, picked_slot];
								multipick_6 = inv_grid[# 6, picked_slot];
								multipick_7 = inv_grid[# 7, picked_slot];
								multipick_8 = inv_grid[# 8, picked_slot];
								multipick_9 = inv_grid[# 9, picked_slot];
								multipick_10 = inv_grid[# 10, picked_slot];
								multipick_11 = inv_grid[# 11, picked_slot];
							
						}else if (ss_item_amount == 1){
							if (picked_slot != selected_slot){
								onepicked_slot = 1;
								picked_slot = selected_slot;
								picked_slot_right = selected_slot;
								multipick += 1;
								multipick_zerobuffer = true;
								inv_grid[# 1, picked_slot] = 0;
								multipick_item = inv_grid[# 0, picked_slot];
								inhand = inv_grid[# 0, picked_slot];
							
								multipick_2 = inv_grid[# 2, picked_slot];
								multipick_3 = inv_grid[# 3, picked_slot];
								multipick_4 = inv_grid[# 4, picked_slot];
								multipick_5 = inv_grid[# 5, picked_slot];
								multipick_6 = inv_grid[# 6, picked_slot];
								multipick_7 = inv_grid[# 7, picked_slot];
								multipick_8 = inv_grid[# 8, picked_slot];
								multipick_9 = inv_grid[# 9, picked_slot];
								multipick_10 = inv_grid[# 10, picked_slot];
								multipick_11 = inv_grid[# 11, picked_slot];
							}else{
								onepicked_slot = 1;
								picked_slot = selected_slot;
								picked_slot_right = selected_slot;
								multipick += 1;
								multipick_zerobuffer = true;
								inv_grid[# 1, picked_slot] = 0;
								multipick_item = inv_grid[# 0, picked_slot];
								inhand = inv_grid[# 0, picked_slot];
							
								multipick_2 = inv_grid[# 2, picked_slot];
								multipick_3 = inv_grid[# 3, picked_slot];
								multipick_4 = inv_grid[# 4, picked_slot];
								multipick_5 = inv_grid[# 5, picked_slot];
								multipick_6 = inv_grid[# 6, picked_slot];
								multipick_7 = inv_grid[# 7, picked_slot];
								multipick_8 = inv_grid[# 8, picked_slot];
								multipick_9 = inv_grid[# 9, picked_slot];
								multipick_10 = inv_grid[# 10, picked_slot];
								multipick_11 = inv_grid[# 11, picked_slot];
							}
						}
				}
		}

	
	}else{
		if (selected_slot == -1){
			if (mouse_check_button_pressed(mb_left)){
				if (onepicked_slot == 0){
					//--------------------------------------------
						//Wyrzuc przedmiot i stworz go obok gracza (pelny stack)
						if (picked_slot != -1){
							var inst = instance_create_layer(obj_amadix.x, obj_amadix.y, "Instances", obj_item);
							with (inst){
								item_num = ss_item_pick;
								item_num_amount = ss_item_pick_amount;
								item_num_type = ss_item_pick_type;
								item_num_maxstack = ss_item_pick_maxstack;
								item_num_hp = ss_item_pick_hp;
								item_num_stamina = ss_item_pick_stamina;
								x_frame = item_num mod (spr_width/cell_size);
								y_frame = item_num div (spr_width/cell_size);
							}
				
							slot_remove(picked_slot);
						}
						picked_slot = -1;
						onepicked_slot = 0;
						multipick = 0;
					//--------------------------------------------
				}else{
					//--------------------------------------------
						//Wyrzuc przedmiot i stworz go obok gracza (pewna ilosc)
						if (picked_slot != -1){
							var inst = instance_create_layer(obj_amadix.x, obj_amadix.y, "Instances", obj_item);
							var multi = multipick;
							with (inst){
								item_num = ss_item_pick;
								item_num_amount = multi;
								item_num_type = ss_item_pick_type;
								item_num_maxstack = ss_item_pick_maxstack;
								item_num_hp = ss_item_pick_hp;
								item_num_stamina = ss_item_pick_stamina;
								x_frame = item_num mod (spr_width/cell_size);
								y_frame = item_num div (spr_width/cell_size);
							}
						}
						picked_slot = -1;
						onepicked_slot = 0;
						multipick = 0;
					//--------------------------------------------
				}
			}
		}
	}
	#endregion


	//Jezeli istnieje w siatce przedmiot o ilosci zerowej usun go
	for (var i = 0; i < inv_slots; ++i){
	    if (inv_grid[# 1, i] == 0){
				slot_remove(i);
		}
	}
	
	if (inhand == -1){
		multipick = 0;	
	}
	
	/*
	//Jezeli istnieje przedmiot o ilosci wiekszej niz maks stack tego przedmiotu, rozgrupuj go
	for (var ii = 0; ii < inv_slots; ++ii) {
	    if (inv_grid[# 1, ii] > inv_grid[# 3, ii]) && (multipick == 0){
			var ds_inv = ds_inventory;
			var yy = 0;
				if (ds_inv[# 0, yy] == item.none){
					ds_inv[# 0, yy] = inv_grid[# 0, ii];
					ds_inv[# 1, yy] = inv_grid[# 1, ii];
					ds_inv[# 2, yy] = inv_grid[# 2, ii];
					ds_inv[# 3, yy] = inv_grid[# 3, ii];
					break;
				}else{
					yy += 1;	
				}
			
		}
	}
	*/
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

