function containter_additem(iitem, amount, pos){
	ds_container[# INVITEM, pos] = iitem;
	
	ds_container[# INVTYPE, pos] = obj_inventory.ds_item_all[# INVTYPE, iitem];
	/*
	if (capacity > -1){
		if (item_exists(item.none, false)){
			item_mag_add(iitem, capacity, level);
		}else{
			if (instance_exists(obj_amadix)){
				item_drop(iitem, amount, true, obj_amadix.x, obj_amadix.y, 5);		
			}
		}
		exit;
	}
	*/
	if (ds_container[# INVTYPE, pos] == itemtype.magazine){
		ds_container[# INVAMOUNT, pos] = 1;
		ds_container[# INVLEVEL, pos] = amount;	
	}else{
		ds_container[# INVAMOUNT, pos] = amount;
		ds_container[# INVLEVEL, pos] = obj_inventory.ds_item_all[# INVLEVEL, iitem];	
	}
	
	ds_container[# MAXSTACK, pos] = obj_inventory.ds_item_all[# MAXSTACK, iitem];
	ds_container[# INVHP, pos] = obj_inventory.ds_item_all[# INVHP, iitem];
	ds_container[# INVSTAMINA, pos] = obj_inventory.ds_item_all[# INVSTAMINA, iitem];
	ds_container[# INVDAMAGE, pos] = obj_inventory.ds_item_all[# INVDAMAGE, iitem];
	ds_container[# INVDEFENCE, pos] = obj_inventory.ds_item_all[# INVDEFENCE, iitem];
	ds_container[# INVEFFECTS, pos] = obj_inventory.ds_item_all[# INVEFFECTS, iitem];
	ds_container[# INVTEMPERATURE, pos] = obj_inventory.ds_item_all[# INVTEMPERATURE, iitem];
	//ds_container[# INVCAP, pos] = capacity;
}