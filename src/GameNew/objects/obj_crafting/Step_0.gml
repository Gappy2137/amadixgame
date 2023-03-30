if (!show_crafting){exit;}

invSlots = obj_inventory.inv_slots - 4;
craftSlots = ds_grid_height(global.recipes);

if (instance_exists(obj_amadix)){
	currentStation = obj_amadix.crafting_station;	
}

//---------------------------------------------------------------------------
#region Pozycja myszki
mousex = device_mouse_x_to_gui(0);
mousey = device_mouse_y_to_gui(0);

// Inv

var i_mousex = mousex - invUIX;
var i_mousey = mousey - invUIY;

var numx = i_mousex div cell_size;
var numy = i_mousey div cell_size;

var endinvUIX = invUIX + (invSlotsWidth * cell_size);
var endinvUIY = invUIY + (invSlotsHeight * cell_size);


if isbounded(mousex, invUIX, endinvUIX) && isbounded(mousey, invUIY, endinvUIY){
	var sx = i_mousex - (numx * cell_size);
	var sy = i_mousey - (numy * cell_size);
	
	if ((sx < cell_size) && (sy < cell_size)){
		mouse_slotx = numx;
		mouse_sloty = numy;
	}
	selected_slot_eq = min(invSlots - 1 + (invRow * invSlotsWidth), mouse_slotx + (mouse_sloty * invSlotsWidth) + (invRow * invSlotsWidth));
	
}else{
	selected_slot_eq = -1;
}
#endregion

// Crafting
var i_mousex_craft = mousex - craftUIX;
var i_mousey_craft = mousey - craftUIY;

var numx_craft = i_mousex_craft div cell_size;
var numy_craft = i_mousey_craft div cell_size;

var endcraftUIX = craftUIX + (craftSlotsWidth * cell_size);
var endcraftUIY = craftUIY + (craftSlotsHeight * cell_size);

if isbounded(mousex, craftUIX, endcraftUIX) && isbounded(mousey, craftUIY, endcraftUIY){
	var sxC = i_mousex_craft - (numx_craft * cell_size);
	var syC = i_mousey_craft - (numy_craft * cell_size);
	
	if ((sxC < cell_size) && (syC < cell_size)){
		mouse_slotx = numx_craft;
		mouse_sloty = numy_craft;
	}
	selected_slot_craft = max(-1, (mouse_slotx + (mouse_sloty * craftSlotsWidth) + (craftRow * craftSlotsWidth)) + from);
	if (mouse_check_button_pressed(mb_left)){
		if (recipeAmount == ds_grid_height(global.recipes)){
			if (selected_slot_craft < recipeAmount){
				craftSlotSelected = selected_slot_craft;	
				craftSlotSelectedX = mouse_slotx;
				craftSlotSelectedY = mouse_sloty;
			}
		}
		
		if (recipeAmount < ds_grid_height(global.recipes)){
			if (selected_slot_craft < recipeAmount + from){
				craftSlotSelected = selected_slot_craft;	
				craftSlotSelectedX = mouse_slotx;
				craftSlotSelectedY = mouse_sloty;
			}
		}

	}
	
}else{
	/*
	if !(isbounded(mousex, 85, 394) && isbounded(mousey, 48, 240)){
		selected_slot_craft = -1;
		if (mouse_check_button_pressed(mb_left)){
			craftSlotSelected = -1;
			craftSlotSelectedX = 0;
			craftSlotSelectedY = 0;
		}
	}
	*/
}
	
//---------------------------------------------------------------------------

if isbounded(mousex, 0, GAMEWIDTH/2) {
	if (mouse_wheel_up()) {
		if (craftRow > 0){
			craftRow--;
			craftSlotSelected -= craftSlotsWidth;
		}
	}
	if (mouse_wheel_down()) {
		if (craftRow < ( (craftSlots / craftSlotsWidth) - craftSlotsHeight)){
			craftRow++;
			if (craftSlotSelected + craftSlotsWidth < recipeAmount) {
				craftSlotSelected += craftSlotsWidth;
			}else{
				craftSlotSelected -= craftSlotsWidth;
				selected_slot_craft -= craftSlotsWidth;
				craftSlotSelectedY -= 1;
			}
		}
	}
} else {
	if (mouse_wheel_up()) {
		if (invRow > 0) {
			invRow--;
		}
	}
	if (mouse_wheel_down()) {
		if (invRow < ( (invSlots / invSlotsWidth) - invSlotsHeight)){
			invRow++;
		}
	}
}

//---------------------------------------------------------------------------
// Arrows

// Crafting arrow top >:3
if isbounded(mousex, craftingUIArrowX, craftingUIArrowX + 14) && isbounded(mousey, craftingUIArrowY[0], craftingUIArrowY[0] + 15) {
	if (mouse_check_button_pressed(mb_left)) {
		if (craftRow > 0){
			craftRow--;
		}
	}
}
// Crafting arrow bottom >w<
if isbounded(mousex, craftingUIArrowX, craftingUIArrowX + 14) && isbounded(mousey, craftingUIArrowY[1], craftingUIArrowY[1] + 15) {
	if (mouse_check_button_pressed(mb_left)) {
		if (craftRow < ( (craftSlots / craftSlotsWidth) - craftSlotsHeight)){
			craftRow++;
		}
	}
}


// Inventory arrow top >:3
if isbounded(mousex, invUIArrowX, invUIArrowX + 14) && isbounded(mousey, craftingUIArrowY[0], craftingUIArrowY[0] + 15) {
	if (mouse_check_button_pressed(mb_left)) {
		if (invRow > 0){
			invRow--;
		}
	}
}
// Inventory arrow bottom >w<
if isbounded(mousex, invUIArrowX, invUIArrowX + 14) && isbounded(mousey, craftingUIArrowY[1], craftingUIArrowY[1] + 15) {
	if (mouse_check_button_pressed(mb_left)) {
		if (invRow < ( (invSlots / invSlotsWidth) - invSlotsHeight)){
			invRow++;
		}
	}
}

//---------------------------------------------------------------------------

if isbounded(mousex, craftUIX, endcraftUIX) && isbounded(mousey, craftUIY, endcraftUIY) {
	onCraftUI = true;
} else {
	onCraftUI = false;
}
if isbounded(mousex, invUIX, endinvUIX) && isbounded(mousey, invUIY, endinvUIY) {
	onEqUI = true;
} else {
	onEqUI = false;
}

//---------------------------------------------------------------------------
// Trash item
if ((mousex >= trashSlotX) && (mousex < trashSlotX2) && (mousey >= trashSlotY) && (mousey <= trashSlotY2)) {
	if (inhand != -1) {
		onTrashSlot = true;
	}
} else {
	onTrashSlot = false;
}
	
//---------------------------------------------------------------------------

if isbounded(mousex, 85, 394) && isbounded(mousey, 54, 240)
|| isbounded(mousex, craftingUItabX, 85) && isbounded(mousey, craftingUItabY[0], 184) {
	canThrowOut = false;
} else {
	canThrowOut = true;	
}

//---------------------------------------------------------------------------
// Tabs

var __i = 0;

repeat(5) {
	
	
	if isbounded(mousex, craftingUItabX, craftingUItabX + 51) && isbounded(mousey, craftingUItabY[__i], craftingUItabY[__i] + 24) {
		if (mouse_check_button_pressed(mb_left)) {
			
			var tt = 0;
			repeat(5) {
				
				craftingUItabActive[tt] = false;
				
				tt++;
			}
			
			craftingUItabActive[__i] = true;
			selected_slot_craft = -1;
			craftSlotSelected = -1;
			
		}
	}
	
	__i++;
}

__i = 0;

//---------------------------------------------------------------------------



	//---------------------------------------------------------------------------
	#region Operacje na przedmiotach
	var inv_grid = obj_inventory.ds_inventory;
	var item_all = obj_inventory.ds_item_all;

	function putitem(){
		var inv_grid = obj_inventory.ds_inventory;
		var item_all = obj_inventory.ds_item_all;
		
		inv_grid[# INVITEM, selected_slot_eq] = inhand;
		inv_grid[# INVAMOUNT, selected_slot_eq] = multipick;
		inv_grid[# INVLEVEL, selected_slot_eq] = lvl;
		inv_grid[# INVTYPE, selected_slot_eq] = item_all[# INVTYPE, inhand];
		inv_grid[# MAXSTACK, selected_slot_eq] = item_all[# MAXSTACK, inhand];
		inv_grid[# INVHP, selected_slot_eq] = item_all[# INVHP, inhand];
		inv_grid[# INVSTAMINA, selected_slot_eq] = item_all[# INVSTAMINA, inhand];
		inv_grid[# INVDAMAGE, selected_slot_eq] = item_all[# INVDAMAGE, inhand];
		inv_grid[# INVDEFENCE, selected_slot_eq] = item_all[# INVDEFENCE, inhand];
		inv_grid[# INVEFFECTS, selected_slot_eq] = item_all[# INVEFFECTS, inhand];
		inv_grid[# INVTEMPERATURE, selected_slot_eq] = item_all[# INVTEMPERATURE, inhand];	
		inv_grid[# INVCAP, selected_slot_eq] = cap;
		inv_grid[# MAXCAP, selected_slot_eq] = item_all[# MAXCAP, inhand];	
		
		inhand = -1;
		multipick = 0;
		cap = -1;
		lvl = 0;
	}
	function changeitem(){
		var inv_grid = obj_inventory.ds_inventory;
		var item_all = obj_inventory.ds_item_all;
		//Zamieniamy przedmioty w rece i slocie
		var temp0 = inv_grid[# INVITEM, selected_slot_eq];
		var temp1 = inv_grid[# INVAMOUNT, selected_slot_eq];
		var temp2 = inv_grid[# INVLEVEL, selected_slot_eq];
		var temp3 = inv_grid[# INVCAP, selected_slot_eq];
				
		inv_grid[# INVITEM, selected_slot_eq] = inhand;
		inv_grid[# INVAMOUNT, selected_slot_eq] = multipick;
		inv_grid[# INVLEVEL, selected_slot_eq] = lvl;	
		inv_grid[# INVTYPE, selected_slot_eq] = item_all[# INVTYPE, inhand];
		inv_grid[# MAXSTACK, selected_slot_eq] = item_all[# MAXSTACK, inhand];
		inv_grid[# INVHP, selected_slot_eq] = item_all[# INVHP, inhand];
		inv_grid[# INVSTAMINA, selected_slot_eq] = item_all[# INVSTAMINA, inhand];
		inv_grid[# INVDAMAGE, selected_slot_eq] = item_all[# INVDAMAGE, inhand];
		inv_grid[# INVDEFENCE, selected_slot_eq] = item_all[# INVDEFENCE, inhand];
		inv_grid[# INVEFFECTS, selected_slot_eq] = item_all[# INVEFFECTS, inhand];
		inv_grid[# INVTEMPERATURE, selected_slot_eq] = item_all[# INVTEMPERATURE, inhand];
		inv_grid[# INVCAP, selected_slot_eq] = cap;
		inv_grid[# MAXCAP, selected_slot_eq] = item_all[# MAXCAP, inhand];
				
		inhand = temp0;
		multipick = temp1;	
		cap = temp3;
		lvl = temp2;
	}
	

	if (onEqUI){
		
		
		//Uzywanie shifta
		if (mouse_check_button_pressed(mb_left)) && (keyboard_check(vk_shift)){

		}
		
		//Branie przedmiotow lewym
		if (mouse_check_button_pressed(mb_left)) && (!keyboard_check(vk_shift)){
			//Jezeli nie mamy nic w rece i klikamy na slot z przedmiotem
			if (inhand == -1) && (inv_grid[# INVITEM, selected_slot_eq] != item.none){
				//Od teraz trzymamy w rece przedmiot ze slotu
				inhand = inv_grid[# INVITEM, selected_slot_eq];
				multipick = inv_grid[# INVAMOUNT, selected_slot_eq];
				cap = inv_grid[# INVCAP, selected_slot_eq];
				lvl = inv_grid[# INVLEVEL, selected_slot_eq];
				
				inv_grid[# INVITEM, selected_slot_eq] = item.none;
				inv_grid[# INVAMOUNT, selected_slot_eq] = 0;
				inv_grid[# INVTYPE, selected_slot_eq] = -1;
				inv_grid[# MAXSTACK, selected_slot_eq] = 0;
				inv_grid[# INVHP, selected_slot_eq] = 0;
				inv_grid[# INVSTAMINA, selected_slot_eq] = 0;
				inv_grid[# INVLEVEL, selected_slot_eq] = 0;
				inv_grid[# INVDAMAGE, selected_slot_eq] = 0;
				inv_grid[# INVDEFENCE, selected_slot_eq] = 0;
				inv_grid[# INVEFFECTS, selected_slot_eq] = 0;
				inv_grid[# INVTEMPERATURE, selected_slot_eq] = 0;
				inv_grid[# INVCAP, selected_slot_eq] = -1;
				inv_grid[# MAXCAP, selected_slot_eq] = -1;
			}else
			//Jezeli mamy przedmiot w rece i klikamy na pusty slot
			if (inhand != -1) && (inv_grid[# INVITEM, selected_slot_eq] == item.none){
				putitem();
			}else
			//Jezeli mamy przedmiot w rece i klikamy na slot z tym samym przedmiotem
			if (inhand != -1) && (inv_grid[# INVITEM, selected_slot_eq] == inhand){
				//Jezeli ilosc przedmiotu ktory trzymamy jest taka ze gdy go polozymy to przekroczymy maxstack
				if (inv_grid[# INVAMOUNT, selected_slot_eq] + multipick >= inv_grid[# MAXSTACK, selected_slot_eq]){
					//Na slocie maxstack, w rece reszta
					var am = inv_grid[# INVAMOUNT, selected_slot_eq];
					var am2 = multipick;
					inv_grid[# INVAMOUNT, selected_slot_eq] = inv_grid[# MAXSTACK, selected_slot_eq];
					inv_grid[# MAXSTACK, selected_slot_eq] = item_all[# MAXSTACK, inhand];
					inv_grid[# INVHP, selected_slot_eq] = item_all[# INVHP, inhand];
					inv_grid[# INVSTAMINA, selected_slot_eq] = item_all[# INVSTAMINA, inhand];
					inv_grid[# INVDAMAGE, selected_slot_eq] = item_all[# INVDAMAGE, inhand];
					inv_grid[# INVDEFENCE, selected_slot_eq] = item_all[# INVDEFENCE, inhand];
					inv_grid[# INVEFFECTS, selected_slot_eq] = item_all[# INVEFFECTS, inhand];
					inv_grid[# INVTEMPERATURE, selected_slot_eq] = item_all[# INVTEMPERATURE, inhand];
					
					if (inv_grid[# INVCAP, selected_slot_eq] != cap){
						changeitem();
					}
					if (inv_grid[# INVLEVEL, selected_slot_eq] != lvl){
						changeitem();
					}
					
					multipick = am + am2 - inv_grid[# MAXSTACK, selected_slot_eq];
				}else{
					//Jezeli ilosc przedmiotu jest mniejsza kladziemy normalnie
					inv_grid[# INVAMOUNT, selected_slot_eq] += multipick;
					inv_grid[# INVTYPE, selected_slot_eq] = item_all[# INVTYPE, inhand];
					inv_grid[# MAXSTACK, selected_slot_eq] = item_all[# MAXSTACK, inhand];
					inv_grid[# INVHP, selected_slot_eq] = item_all[# INVHP, inhand];
					inv_grid[# INVSTAMINA, selected_slot_eq] = item_all[# INVSTAMINA, inhand];
					inv_grid[# INVDAMAGE, selected_slot_eq] = item_all[# INVDAMAGE, inhand];
					inv_grid[# INVDEFENCE, selected_slot_eq] = item_all[# INVDEFENCE, inhand];
					inv_grid[# INVEFFECTS, selected_slot_eq] = item_all[# INVEFFECTS, inhand];
					inv_grid[# INVTEMPERATURE, selected_slot_eq] = item_all[# INVTEMPERATURE, inhand];
					
					if (inv_grid[# INVCAP, selected_slot_eq] != cap){
						changeitem();
					}
					if (inv_grid[# INVLEVEL, selected_slot_eq] != lvl){
						changeitem();
					}
					
					multipick = 0;
				}
			}else
			//Jezeli mamy przedmiot w rece i klikamy na slot z innym przedmiotem
			if (inhand != -1) && (inv_grid[# INVITEM, selected_slot_eq] != inhand) && (inv_grid[# INVITEM, selected_slot_eq] != item.none){
				changeitem();
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
					multipick = inv_grid[# INVAMOUNT, selected_slot_eq];
					cap = inv_grid[# INVCAP, selected_slot_eq];
					lvl = inv_grid[# INVLEVEL, selected_slot_eq];
				
					inv_grid[# INVITEM, selected_slot_eq] = item.none;
					inv_grid[# INVAMOUNT, selected_slot_eq] = 0;
					inv_grid[# INVTYPE, selected_slot_eq] = -1;
					inv_grid[# MAXSTACK, selected_slot_eq] = 0;
					inv_grid[# INVHP, selected_slot_eq] = 0;
					inv_grid[# INVSTAMINA, selected_slot_eq] = 0;
					inv_grid[# INVLEVEL, selected_slot_eq] = 0;
					inv_grid[# INVDAMAGE, selected_slot_eq] = 0;
					inv_grid[# INVDEFENCE, selected_slot_eq] = 0;
					inv_grid[# INVEFFECTS, selected_slot_eq] = 0;
					inv_grid[# INVTEMPERATURE, selected_slot_eq] = 0;
					inv_grid[# INVCAP, selected_slot_eq] = -1;
					inv_grid[# MAXCAP, selected_slot_eq] = -1;
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
					changeitem();
				}else{
					if (input_check("inventory_shift")){
						if (inv_grid[# INVAMOUNT, selected_slot_eq] == 1){
							multipick++;
							inv_grid[# INVITEM, selected_slot_eq] = item.none;
							inv_grid[# INVAMOUNT, selected_slot_eq] = 0;
							inv_grid[# INVTYPE, selected_slot_eq] = -1;
							inv_grid[# MAXSTACK, selected_slot_eq] = 0;
							inv_grid[# INVHP, selected_slot_eq] = 0;
							inv_grid[# INVSTAMINA, selected_slot_eq] = 0;
							inv_grid[# INVLEVEL, selected_slot_eq] = 0;
							inv_grid[# INVDAMAGE, selected_slot_eq] = 0;
							inv_grid[# INVDEFENCE, selected_slot_eq] = 0;
							inv_grid[# INVEFFECTS, selected_slot_eq] = 0;
							inv_grid[# INVTEMPERATURE, selected_slot_eq] = 0;
							inv_grid[# INVCAP, selected_slot_eq] = -1;
							inv_grid[# MAXCAP, selected_slot_eq] = -1;
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
		

		
	}else{
		//Jezeli myszka jest poza ekranem ekwipunku
		if !((pageArrowOnInv[0]) || (pageArrowOnInv[1]))
		&& !((pageArrowOnCraft[0]) || (pageArrowOnCraft[1]))
		&& !(onCraftUI){
			if (onTrashSlot){
				if (mouse_check_button_pressed(mb_left)){
					
					audio_play_sound(snd_trashcan, 10, false);
					
					inhand = -1;
					multipick = 0;
					cap = -1;
					lvl = 0;
				}
			}else{
				if (selected_slot_eq == -1) && (canThrowOut){
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
	}
	
	//---------------------------------------------------------------------------
	//Jezeli istnieje w siatce przedmiot o ilosci zerowej usun go
	for (var i = 0; i < invSlots; ++i){
	    if ((inv_grid[# INVAMOUNT, i] == 0) && (inv_grid[# INVITEM, i] != item.none)){
			inv_grid[# INVITEM, i] = item.none;
			inv_grid[# INVAMOUNT, i] = 0;
			inv_grid[# INVTYPE, i] = -1;
			inv_grid[# MAXSTACK, i] = 0;
			inv_grid[# INVHP, i] = 0;
			inv_grid[# INVSTAMINA, i] = 0;
			inv_grid[# INVLEVEL, i] = 0;
			inv_grid[# INVDAMAGE, i] = 0;
			inv_grid[# INVDEFENCE, i] = 0;
			inv_grid[# INVEFFECTS, i] = 0;
			inv_grid[# INVTEMPERATURE, i] = 0;
			inv_grid[# INVCAP, i] = -1;
			inv_grid[# MAXCAP, i] = -1;
		}
		if (inv_grid[# INVCAP, i] <= 0) && (inv_grid[# INVCAP, i] != -1){
			inv_grid[# INVCAP, i] = 0;	
		}
	}
	//---------------------------------------------------------------------------
	
	//---------------------------------------------------------------------------
	if (inhand == -1){
		multipick = 0;	
	}
	if (multipick == 0){
		inhand = -1;	
	}
	//---------------------------------------------------------------------------
	
	#endregion
	//---------------------------------------------------------------------------



// Crafting

if (craftSlotSelected != -1){
	
	var craft_grid = global.recipes;
	var ing_amount = array_length(craft_grid[# C_ING, craftSlotSelected]);
	var stationReq = craft_grid[# C_STATION, craftSlotSelected];
	
	var _i = 0;
	var _cancraft = [];

	repeat(ing_amount){
			
		var _iitem = craft_grid[# C_ING, craftSlotSelected][@ _i][@ C_ITEM];
		var _amount = craft_grid[# C_ING, craftSlotSelected][@ _i][@ C_AMOUNT];
		
		var amountInInv = 0;
		
		var _type = item_all[# INVTYPE, _iitem];
		
		if (_iitem >= CRAFTITEMTYPE){
		
			if (item_isinsep(_type)){
				
				amountInInv = itemtype_find_amount(_iitem - CRAFTITEMTYPE);
				
			}else{
				
				amountInInv = itemtype_find_amount(_iitem - CRAFTITEMTYPE);
				
			}
		
		}else{
			
			if (item_isinsep(_type)){
			
				amountInInv = item_find_capacity(_iitem);
			
			}else{
				
				amountInInv = item_find_amount(_iitem);
				
			}
		}
		
		if (amountInInv >= _amount){
			
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
		
		
		if (currentStation == stationReq){
			craftButtonActive = true;
		}else{
			if (stationReq == craftingStation.craft_basic_1)
			&& ( (currentStation == craftingStation.craft_basic_2) || (currentStation == craftingStation.craft_basic_3) ){
				craftButtonActive = true;
			}else
			if (stationReq == craftingStation.craft_basic_2)
			&& (currentStation == craftingStation.craft_basic_3){
				craftButtonActive = true;
			}else
			if (stationReq == craftingStation.cooking_1)
			&& ( (currentStation == craftingStation.cooking_2) || (currentStation == craftingStation.cooking_3) ){
				craftButtonActive = true;
			}else
			if (stationReq == craftingStation.cooking_2)
			&& (currentStation == craftingStation.cooking_3){
				craftButtonActive = true;
			}else{
				craftButtonActive = false;
			}
		}
		
		if (_cancraft[_i] == false){
			craftButtonActive = false;
			break;
		}
		_i++;
	}
	
	_i = 0;
	
	if (craftButtonActive){
		if (isbounded(mousex, craftButtonX, craftButtonX + 32))
		&& (isbounded(mousey, craftButtonY, craftButtonY + 16)){
			if (mouse_check_button_pressed(mb_left)){
				
				
				var _result_item = craft_grid[# C_RES, craftSlotSelected][@ C_ITEM];
				var _result_amount = craft_grid[# C_RES, craftSlotSelected][@ C_AMOUNT];
				var _result_cap = craft_grid[# C_RES, craftSlotSelected][@ C_CAP];
				var _result_lvl = craft_grid[# C_RES, craftSlotSelected][@ C_LVL];
				
				
				if (inhand == -1){
					inhand = _result_item;
					multipick += _result_amount;
					cap = _result_cap;
					lvl = _result_lvl;
				}else{
					if (_result_amount + multipick <= obj_inventory.ds_item_all[# MAXSTACK, inhand]){
						inhand = _result_item;
						multipick += _result_amount;
						cap = _result_cap;
						lvl = _result_lvl;
					}
				}
				
				
				repeat(ing_amount){
					
					var _iitem = craft_grid[# C_ING, craftSlotSelected][@ _i][@ C_ITEM];
					var _amount = craft_grid[# C_ING, craftSlotSelected][@ _i][@ C_AMOUNT];
					
					
					
					if (_iitem >= CRAFTITEMTYPE){
						
						var _type = _iitem - CRAFTITEMTYPE;
						
						if (item_isinsep(_type)){
							
							var __item = 0;
						
							repeat(_amount){
							
								__item = itemtype_find_cap(_iitem - CRAFTITEMTYPE);
							
								item_remove_capacity(__item, 1);
							
							}
							
						}else{
							
							var __item = 0;
						
							repeat(_amount){
							
								__item = itemtype_find(_iitem - CRAFTITEMTYPE);
							
								item_remove(__item, 1, false);
							
							}
							
						}
						
				
						
						
						
					}else{
						
						var _type = item_all[# INVTYPE, _iitem];
			
						if (item_isinsep(_type)){
							
							var __item = 0;
						
							repeat(_amount){
							
								__item = itemtype_find(_type);
							
								item_remove_capacity(__item, 1);
							
							}
							
						}else{
							
							item_remove(_iitem, _amount, false);
							
						}
						
					}
					
					
					
					_i++;
				}
				
				
			}
		}
	}
	
}


/*
#region Pozycja myszki
var mousex = device_mouse_x_to_gui(0);
var mousey = device_mouse_y_to_gui(0);

var cell_xoffset = cell_size;
var cell_yoffset = cell_size;

var i_mousex = mousex - slots_x;
var i_mousey = mousey - slots_y;

var numx = i_mousex div cell_xoffset;
var numy = i_mousey div cell_yoffset;

var endx = (gui_width - craft_slot_width)/2;
var endUIx = craft_slot_width + endx;

var endy = (gui_height - craft_slot_height)/2;
var endUIy = craft_slot_height + endy;

if (mousex >= craft_slot_x) && (mousex < endUIx) && (mousey >= craft_slot_y) && (mousey < endUIy){
	var sx = i_mousex - (numx * cell_xoffset);
	var sy = i_mousey - (numy * cell_yoffset);
	
	if ((sx < cell_size) && (sy < cell_size)){
		mouse_slotx = numx;
		mouse_sloty = numy;
	}

	selected_slot = min(craft_slots - 1, mouse_slotx + (mouse_sloty * craft_slots_width));
	
}else{
	selected_slot = -1;
}
#endregion

#region Crafting
if (mouse_check_button_pressed(mb_right)){
	var citem_1 = global.recipes[# 0, selected_slot][? "ingredients"][# INVITEM, 0];
	var citem_2 = global.recipes[# 0, selected_slot][? "ingredients"][# INVITEM, 1];
	var citem_3 = global.recipes[# 0, selected_slot][? "ingredients"][# INVITEM, 2];
	var citem_4 = global.recipes[# 0, selected_slot][? "ingredients"][# INVITEM, 3];
	var citem_5 = global.recipes[# 0, selected_slot][? "ingredients"][# INVITEM, 4];
	var citem_6 = global.recipes[# 0, selected_slot][? "ingredients"][# INVITEM, 5];
	var camount_1 = global.recipes[# 0, selected_slot][? "ingredients"][# INVAMOUNT, 0];
	var camount_2 = global.recipes[# 0, selected_slot][? "ingredients"][# INVAMOUNT, 1];
	var camount_3 = global.recipes[# 0, selected_slot][? "ingredients"][# INVAMOUNT, 2];
	var camount_4 = global.recipes[# 0, selected_slot][? "ingredients"][# INVAMOUNT, 3];
	var camount_5 = global.recipes[# 0, selected_slot][? "ingredients"][# INVAMOUNT, 4];
	var camount_6 = global.recipes[# 0, selected_slot][? "ingredients"][# INVAMOUNT, 5];
	if (ds_grid_height(global.recipes[# 0, selected_slot][? "ingredients"]) == 1){
		if (item_exists_amount(citem_1, camount_1)){
			//slot_remove()
		}
	}
}
#endregion