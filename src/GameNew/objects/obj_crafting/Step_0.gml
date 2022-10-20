if (!show_crafting){exit;}

invSlots = obj_inventory.inv_slots - 4;
craftSlots = ds_grid_height(global.recipes);

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
	selected_slot_craft = max(-1, mouse_slotx + (mouse_sloty * craftSlotsWidth) + (craftRow * craftSlotsWidth));
	if (mouse_check_button_pressed(mb_left)){
		if (selected_slot_craft < ds_grid_height(global.recipes)){
			craftSlotSelected = selected_slot_craft;	
			craftSlotSelectedX = mouse_slotx;
			craftSlotSelectedY = mouse_sloty;
		}
	}
	
}else{
	selected_slot_craft = -1;
	if (mouse_check_button_pressed(mb_left)){
		craftSlotSelected = -1;
		craftSlotSelectedX = 0;
		craftSlotSelectedY = 0;
	}
}
	
//---------------------------------------------------------------------------

if isbounded(mousex, 0, GAMEWIDTH/2) {
	if (mouse_wheel_up()){
		if (craftRow > 0){
			craftRow--;
		}
	}
	if (mouse_wheel_down()){
		if (craftRow < ( (craftSlots / craftSlotsWidth) - craftSlotsHeight)){
			craftRow++;
		}
	}
}else{
	if (mouse_wheel_up()){
		if (invRow > 0){
			invRow--;
		}
	}
	if (mouse_wheel_down()){
		if (invRow < ( (invSlots / invSlotsWidth) - invSlotsHeight)){
			invRow++;
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