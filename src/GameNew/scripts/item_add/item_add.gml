function item_add(slot, iitem, amount){
	
	var itemslot = 0;
	
	if (slot == -1){
		item_stack(iitem, amount, 0);
	}else{
		itemslot = slot;
		obj_inventory.ds_inventory[# INVITEM, itemslot] = iitem;
		obj_inventory.ds_inventory[# INVAMOUNT, itemslot] = amount;
		obj_inventory.ds_inventory[# INVTYPE, itemslot] = obj_inventory.ds_item_all[# INVTYPE, iitem];
		obj_inventory.ds_inventory[# MAXSTACK, itemslot] = obj_inventory.ds_item_all[# MAXSTACK, iitem];
		obj_inventory.ds_inventory[# INVHP, itemslot] = obj_inventory.ds_item_all[# INVHP, iitem];
		obj_inventory.ds_inventory[# INVSTAMINA, itemslot] = obj_inventory.ds_item_all[# INVSTAMINA, iitem];
		obj_inventory.ds_inventory[# INVLEVEL, itemslot] = obj_inventory.ds_item_all[# INVLEVEL, iitem];
		obj_inventory.ds_inventory[# INVDAMAGE, itemslot] = obj_inventory.ds_item_all[# INVDAMAGE, iitem];
		obj_inventory.ds_inventory[# INVDEFENCE, itemslot] = obj_inventory.ds_item_all[# INVDEFENCE, iitem];
		obj_inventory.ds_inventory[# INVEFFECTS, itemslot] = obj_inventory.ds_item_all[# INVEFFECTS, iitem];
	}
}