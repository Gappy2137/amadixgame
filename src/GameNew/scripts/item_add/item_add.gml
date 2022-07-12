function item_add(slot, iitem, amount, level, capacity){
	
	var itemslot = 0;
	
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
	
	if (slot == -1){
		if (item_exists(item.none, false)){
			item_stack(iitem, amount, 0, false, level, capacity);	
		}else{
			if (instance_exists(obj_amadix)){
				item_drop(iitem, amount, true, obj_amadix.x, obj_amadix.y, 5);		
			}
		}
	}else{
		itemslot = slot;
		obj_inventory.ds_inventory[# INVITEM, itemslot] = iitem;
		obj_inventory.ds_inventory[# INVAMOUNT, itemslot] = amount;
		obj_inventory.ds_inventory[# INVTYPE, itemslot] = obj_inventory.ds_item_all[# INVTYPE, iitem];
		obj_inventory.ds_inventory[# MAXSTACK, itemslot] = obj_inventory.ds_item_all[# MAXSTACK, iitem];
		obj_inventory.ds_inventory[# INVHP, itemslot] = obj_inventory.ds_item_all[# INVHP, iitem];
		obj_inventory.ds_inventory[# INVSTAMINA, itemslot] = obj_inventory.ds_item_all[# INVSTAMINA, iitem];
		obj_inventory.ds_inventory[# INVLEVEL, itemslot] = level;
		obj_inventory.ds_inventory[# INVDAMAGE, itemslot] = obj_inventory.ds_item_all[# INVDAMAGE, iitem];
		obj_inventory.ds_inventory[# INVDEFENCE, itemslot] = obj_inventory.ds_item_all[# INVDEFENCE, iitem];
		obj_inventory.ds_inventory[# INVEFFECTS, itemslot] = obj_inventory.ds_item_all[# INVEFFECTS, iitem];
		obj_inventory.ds_inventory[# INVTEMPERATURE, itemslot] = obj_inventory.ds_item_all[# INVTEMPERATURE, iitem];
		obj_inventory.ds_inventory[# INVCAP, itemslot] = capacity;
	}
}