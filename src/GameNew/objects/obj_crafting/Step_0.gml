if (!show_crafting){exit;}

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
	var citem_1 = global.recipes[# 0, selected_slot][? "ingredients"][# ITEM, 0];
	var citem_2 = global.recipes[# 0, selected_slot][? "ingredients"][# ITEM, 1];
	var citem_3 = global.recipes[# 0, selected_slot][? "ingredients"][# ITEM, 2];
	var citem_4 = global.recipes[# 0, selected_slot][? "ingredients"][# ITEM, 3];
	var citem_5 = global.recipes[# 0, selected_slot][? "ingredients"][# ITEM, 4];
	var citem_6 = global.recipes[# 0, selected_slot][? "ingredients"][# ITEM, 5];
	var camount_1 = global.recipes[# 0, selected_slot][? "ingredients"][# AMOUNT, 0];
	var camount_2 = global.recipes[# 0, selected_slot][? "ingredients"][# AMOUNT, 1];
	var camount_3 = global.recipes[# 0, selected_slot][? "ingredients"][# AMOUNT, 2];
	var camount_4 = global.recipes[# 0, selected_slot][? "ingredients"][# AMOUNT, 3];
	var camount_5 = global.recipes[# 0, selected_slot][? "ingredients"][# AMOUNT, 4];
	var camount_6 = global.recipes[# 0, selected_slot][? "ingredients"][# AMOUNT, 5];
	if (ds_grid_height(global.recipes[# 0, selected_slot][? "ingredients"]) == 1){
		if (item_exists_amount(citem_1, camount_1)){
			//slot_remove()
		}
	}
}
#endregion