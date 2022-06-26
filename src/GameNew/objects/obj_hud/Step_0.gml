
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

if (show_hud == hud.inv){
	if backpack_frame >= backpack_frames{
		backpack_frame = backpack_frames - 1;	
	}else{
		backpack_frame += .2;
	}
}else{
	backpack_frame = 0;	
}

if (show_hud == hud.crafting){
	if crafting_frame >= crafting_frames{
		crafting_frame = crafting_frames - 1;	
	}else{
		crafting_frame += .2;	
	}
}else{
	crafting_frame = 0;	
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
			hud_slot_y_active[0] = 8;
			hud_slot_y_active[1] = 0;
		break;
		case 1:
			show_hud = hud.crafting;
			hud_slot_y_active[0] = 0;
			hud_slot_y_active[1] = 8;
		break;
		case 2:
			show_hud = hud.player;
		break;
		case 3:
			show_hud = hud.map;
		break;
		case 4:
			show_hud = hud.journal;
		break;
		case 5:
			show_hud = hud.options;
		break;
	}
}
if (show_hud == hud.inv) || (show_hud == hud.crafting) || (show_hud == hud.player) || (show_hud == hud.map) || (show_hud == hud.journal) || (show_hud == hud.options){
	var mousex = device_mouse_x_to_gui(0);
	var mousey = device_mouse_y_to_gui(0);

	var cell_xoffset = 24;
	var cell_yoffset = 42;

	var i_mousex = mousex - slots_x;
	var i_mousey = mousey - slots_y;

	var numx = i_mousex div cell_xoffset;
	var numy = i_mousey div cell_yoffset;

	if (mousex >= hud_slot_x) && (mousex < (hud_slot_x + (24 * 6))) && (mousey >= hud_slot_y) && (mousey < (hud_slot_y + 48)){
		var sx = i_mousex - (numx * cell_xoffset);
		var sy = i_mousey - (numy * cell_yoffset);
	
		if ((sx < 24) && (sy < 48)){
			mouse_slotx = numx;
			mouse_sloty = numy;
		}
	
		if (mouse_check_button_pressed(mb_left)) && (obj_amadix.actionstate == player_state_action.none){
			selected_hud_slot = mouse_slotx;
		}
	
	}
	
}
#endregion

if (keyboard_check(vk_left)){
	global.hp--;	
}
if (keyboard_check(vk_right)){
	global.hp++;	
}