
#region Pora dnia na zegarze
if (instance_exists(obj_daynightclock)){
	if (obj_daynightclock.rot > 180) && (obj_daynightclock.rot < 360){
		nght = "N";	
	}else{
		nght = "D";	
	}
}
#endregion


if (t < 50){t++;}
if (t > 50){t = 50;}

#region Efekty
ds_grid_sort(effect_grid, 1, false);
var i = 0;
repeat(maxeffects){
	if (effect_grid[# EF_EFFECT, i] != effect.none){
		effect_grid[# EF_TIMER, i] ++;
	}
	/*
	if (effect_grid[# EF_EFFECT, i - 1] == effect.none){
		var temp_effect = effect_grid[# EF_EFFECT, i];
		var temp_amp = effect_grid[# EF_AMPLIFIER, i];
		var temp_duration = effect_grid[# EF_DURATION, i];
		var temp_time = effect_grid[# EF_TIMER, i];
		effect_add(temp_effect, temp_duration,temp_amp, temp_time);
		effect_grid[# EF_DURATION, i] = 0;
		effect_grid[# EF_AMPLIFIER, i] = 0;
		effect_grid[# EF_TIMER, i] = 0;
		effect_grid[# EF_EFFECT, i] = effect.none;
	}
	*/
	
	if (effect_grid[# EF_DURATION, i] - effect_grid[# EF_TIMER, i] <= 0){
		if instance_exists(obj_amadix){
			switch(effect_grid[# EF_EFFECT, i]){
				case effect.speed_ef:
					obj_amadix.speedEffect = 0;
				break;
				case effect.stuffed:
					obj_amadix.stuffed = false;
				break;
			}
		}
		effect_grid[# EF_DURATION, i] = 0;
		effect_grid[# EF_AMPLIFIER, i] = 0;
		effect_grid[# EF_TIMER, i] = 0;
		effect_grid[# EF_EFFECT, i] = effect.none;
	}
	i++;
}
#endregion

#region Opcje HUD
if input_check_pressed("inventoryAccess") 
&& (obj_inventory.inhand == -1) 
&& (canOpenInv) 
&& (instance_exists(obj_amadix))
&& (!global.inCutscene)
&& (!global.inConsole)
&& (!global.inDialogue){
	
	if (instance_exists(obj_amadix)){
		var ins = instance_nearest(obj_amadix.x , obj_amadix.y, par_container);
	}else{
		var ins = 0;
	}
	
	if (instance_exists(par_container)){
		if !(ins.show_container){
			if (show_hud == hud.slots){
				show_hud = lasthud;	
			}else{
				lasthud = show_hud;
				show_hud = hud.slots;
			}
		}
	}else{

			if (show_hud == hud.slots){
				show_hud = lasthud;	
			}else{
				lasthud = show_hud;
				show_hud = hud.slots;
			}
		
	}
}
switch (show_hud){
	case hud.crafting:
		obj_inventory.show_inventory = false;
		obj_inventory.show_slots = false;
		obj_crafting.show_crafting = true;
		hud_inner = true;
	break;
	case hud.player:
		obj_inventory.show_inventory = false;
		obj_inventory.show_slots = false;
		obj_crafting.show_crafting = false;
		hud_inner = true;
	break;
	case hud.map:
		obj_inventory.show_inventory = false;
		obj_inventory.show_slots = false;
		obj_crafting.show_crafting = false;
		hud_inner = true;
	break;
	case hud.journal:
		obj_inventory.show_inventory = false;
		obj_inventory.show_slots = false;
		obj_crafting.show_crafting = false;
		hud_inner = true;
	break;
	case hud.options:
		obj_inventory.show_inventory = false;
		obj_inventory.show_slots = false;
		obj_crafting.show_crafting = false;
		hud_inner = true;
	break;
	case hud.inv:
		obj_inventory.show_inventory = true;
		obj_inventory.show_slots = false;
		obj_crafting.show_crafting = false;
		hud_inner = true;
	break;
	case hud.slots:
		obj_inventory.show_inventory = false;
		obj_inventory.show_slots = true;
		obj_crafting.show_crafting = false;
		hud_inner = false;
	break;
	case hud.none:
		obj_inventory.show_inventory = false;
		obj_inventory.show_slots = false;
		obj_crafting.show_crafting = false;
		hud_inner = false;
	break;
}
if (hud_inner){
	switch (selected_hud_slot){
		case 0:
			show_hud = hud.inv;
			hud_slot_y_active[0] = 6;
			hud_slot_y_active[1] = 0;
			hud_slot_y_active[2] = 0;
			hud_slot_y_active[3] = 0;
			hud_slot_y_active[4] = 0;
			hud_slot_y_active[5] = 0;
		break;
		case 1:
			show_hud = hud.player;
			hud_slot_y_active[0] = 0;
			hud_slot_y_active[1] = 6;
			hud_slot_y_active[2] = 0;
			hud_slot_y_active[3] = 0;
			hud_slot_y_active[4] = 0;
			hud_slot_y_active[5] = 0;
		break;
		case 2:
			show_hud = hud.crafting;
			hud_slot_y_active[0] = 0;
			hud_slot_y_active[1] = 0;
			hud_slot_y_active[2] = 6;
			hud_slot_y_active[3] = 0;
			hud_slot_y_active[4] = 0;
			hud_slot_y_active[5] = 0;
		break;
		case 3:
			show_hud = hud.map;
			hud_slot_y_active[0] = 0;
			hud_slot_y_active[1] = 0;
			hud_slot_y_active[2] = 0;
			hud_slot_y_active[3] = 6;
			hud_slot_y_active[4] = 0;
			hud_slot_y_active[5] = 0;
		break;
		case 4:
			show_hud = hud.journal;
			hud_slot_y_active[0] = 0;
			hud_slot_y_active[1] = 0;
			hud_slot_y_active[2] = 0;
			hud_slot_y_active[3] = 0;
			hud_slot_y_active[4] = 6;
			hud_slot_y_active[5] = 0;
		break;
		case 5:
			show_hud = hud.options;
			hud_slot_y_active[0] = 0;
			hud_slot_y_active[1] = 0;
			hud_slot_y_active[2] = 0;
			hud_slot_y_active[3] = 0;
			hud_slot_y_active[4] = 0;
			hud_slot_y_active[5] = 6;
		break;
	}
}
if (show_hud == hud.inv) 
|| (show_hud == hud.crafting) 
|| (show_hud == hud.player) 
|| (show_hud == hud.map)
|| (show_hud == hud.journal)
|| (show_hud == hud.options){
	
	global.inEq = true;
	
	var mousex = device_mouse_x_to_gui(0);
	var mousey = device_mouse_y_to_gui(0);
	var _width = 24;
	var _height = 42;
	
	var _i = 0;
	repeat(6){
		if ( (isbounded(mousex, tabX[_i], tabX[_i] + _width) ) && (isbounded(mousey, tabY[_i], tabY[_i] + _height) ) ){
			if (input_check("mouseLeft")){
				selected_hud_slot = _i;
				tabY_active[_i] = true;
			}else{
				if (tabY_active[_i] == false)
					tabY_hover[_i] = true;
			}
		}else{
			tabY_hover[_i] = false;	
		}
		
		if (selected_hud_slot != _i){
			tabY_active[_i] = false;
		}
		
		if (tabY_hover[_i] == true) && (tabY_active[_i] == false){
			if (tabY_add[_i] != 3)
				tabY_add[_i] = lerp(tabY_add[_i], 3, 0.5);	
		}
		if (tabY_active[_i] == true){
			if (tabY_add[_i] != 6)
				tabY_add[_i] = lerp(tabY_add[_i], 6, 0.5);	
		}
		if (tabY_hover[_i] == false) && (tabY_active[_i] == false){
			if (tabY_add[_i] != 0)
				tabY_add[_i] = lerp(tabY_add[_i], 0, 0.5);	
		}
		
		_i++;
	}
	
}else{
	global.inEq = false;	
}
#endregion