function containter_additem(iitem, amount, pos){
	ds_container[# INVITEM, pos] = iitem;
	ds_container[# INVAMOUNT, pos] = amount;
	
	ds_container[# INVTYPE, pos] = obj_inventory.ds_item_all[# INVTYPE, iitem];
	ds_container[# MAXSTACK, pos] = obj_inventory.ds_item_all[# MAXSTACK, iitem];
	ds_container[# INVHP, pos] = obj_inventory.ds_item_all[# INVHP, iitem];
	ds_container[# INVSTAMINA, pos] = obj_inventory.ds_item_all[# INVSTAMINA, iitem];
	ds_container[# INVLEVEL, pos] = obj_inventory.ds_item_all[# INVLEVEL, iitem];
	ds_container[# INVDAMAGE, pos] = obj_inventory.ds_item_all[# INVDAMAGE, iitem];
	ds_container[# INVDEFENCE, pos] = obj_inventory.ds_item_all[# INVDEFENCE, iitem];
	ds_container[# INVEFFECTS, pos] = obj_inventory.ds_item_all[# INVEFFECTS, iitem];
	ds_container[# INVTEMPERATURE, pos] = obj_inventory.ds_item_all[# INVTEMPERATURE, iitem];
}