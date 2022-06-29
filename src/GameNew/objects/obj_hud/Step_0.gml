
if (instance_exists(obj_daynightclock)){
	if (obj_daynightclock.rot > 180) && (obj_daynightclock.rot < 360){
		nght = "N";	
	}else{
		nght = "D";	
	}
}

if (t < 50){t++;}
if (t > 50){t = 50;}

if global.hp > global.maxhp{
	global.hp = global.maxhp;	
}
if global.hp <= 0{
	global.hp = 0;	
}
if global.maxhp <= 1{
	global.maxhp = 1;	
}

if global.stamina > global.maxstamina{
	global.stamina = global.maxstamina;	
}
if global.stamina <= 0{
	global.stamina = 0;	
}
if global.maxstamina <= 1{
	global.maxstamina = 1;	
}
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
if (keyboard_check_pressed(ord("I"))){
	effect_add(effect.speed_ef, 2, 1);	
}
if (keyboard_check_pressed(ord("O"))){
	effect_add(effect.speed_ef, 6, 2);	
}
if (keyboard_check_pressed(ord("P"))){
	effect_add(effect.speed_ef, 15, 3);	
}
	



#region Opcje HUD
if input_check_pressed("inventoryAccess") && (obj_inventory.inhand == -1){
	
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
if (show_hud == hud.inv) || (show_hud == hud.crafting) || (show_hud == hud.player) || (show_hud == hud.map) || (show_hud == hud.journal) || (show_hud == hud.options){
	var mousex = device_mouse_x_to_gui(0);
	var mousey = device_mouse_y_to_gui(0);

	var cell_xoffset = 24 + 12;
	var cell_yoffset = 42;

	var i_mousex = mousex - slots_x;
	var i_mousey = mousey - slots_y;

	var numx = i_mousex div cell_xoffset;
	var numy = i_mousey div cell_yoffset;

	if (mousex >= hud_slot_x) && (mousex < (hud_slot_x + (24 * 6))) && (mousey >= hud_slot_y) && (mousey < (hud_slot_y + 42)){
		var sx = i_mousex - (numx * cell_xoffset);
		var sy = i_mousey - (numy * cell_yoffset);
	
		if ((sx < 24) && (sy < 42)){
			mouse_slotx = numx;
			mouse_sloty = numy;
		}
	
		if (mouse_check_button_pressed(mb_left)){
			selected_hud_slot = mouse_slotx;
		}
	
	}
	
}
#endregion

if (keyboard_check(vk_left)){
	global.stamina--;	
}
if (keyboard_check(vk_right)){
	global.stamina++;	
}