function containter_additem(pos, iitem, amount, capacity, lvl){
	
	ds_container[# INVITEM, pos] = iitem;
	
	ds_container[# INVTYPE, pos] = obj_inventory.ds_item_all[# INVTYPE, iitem];
	
	if (capacity != -1){
		ds_container[# INVAMOUNT, pos] = 1;
		ds_container[# INVCAP, pos] = capacity;	
		ds_container[# MAXCAP, pos] = obj_inventory.ds_item_all[# MAXCAP, iitem];
	}else{
		ds_container[# INVAMOUNT, pos] = amount;
		ds_container[# INVCAP, pos] = -1;	
		ds_container[# MAXCAP, pos] = -1;
	}
	ds_container[# INVLEVEL, pos] = lvl;
	ds_container[# MAXSTACK, pos] = obj_inventory.ds_item_all[# MAXSTACK, iitem];
	ds_container[# INVHP, pos] = obj_inventory.ds_item_all[# INVHP, iitem];
	ds_container[# INVSTAMINA, pos] = obj_inventory.ds_item_all[# INVSTAMINA, iitem];
	ds_container[# INVDAMAGE, pos] = obj_inventory.ds_item_all[# INVDAMAGE, iitem];
	ds_container[# INVDEFENCE, pos] = obj_inventory.ds_item_all[# INVDEFENCE, iitem];
	ds_container[# INVEFFECTS, pos] = obj_inventory.ds_item_all[# INVEFFECTS, iitem];
	ds_container[# INVTEMPERATURE, pos] = obj_inventory.ds_item_all[# INVTEMPERATURE, iitem];
	
}