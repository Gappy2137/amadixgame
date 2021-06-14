function item_add(slot, iitem, amount){
	
	var itemslot = 0;
	
	if (slot == -1){
		item_stack(iitem, amount, 0);
	}else{
		itemslot = slot;
		obj_inventory.ds_inventory[# ITEM, itemslot] = iitem;
		obj_inventory.ds_inventory[# AMOUNT, itemslot] = amount;
		obj_inventory.ds_inventory[# TYPE, itemslot] = obj_inventory.ds_item_all[# TYPE, iitem];
		obj_inventory.ds_inventory[# MAXSTACK, itemslot] = obj_inventory.ds_item_all[# MAXSTACK, iitem];
		obj_inventory.ds_inventory[# HP, itemslot] = obj_inventory.ds_item_all[# HP, iitem];
		obj_inventory.ds_inventory[# STAMINA, itemslot] = obj_inventory.ds_item_all[# STAMINA, iitem];
		obj_inventory.ds_inventory[# LEVEL, itemslot] = obj_inventory.ds_item_all[# LEVEL, iitem];
		obj_inventory.ds_inventory[# DAMAGE, itemslot] = obj_inventory.ds_item_all[# DAMAGE, iitem];
		obj_inventory.ds_inventory[# DEFENCE, itemslot] = obj_inventory.ds_item_all[# DEFENCE, iitem];
		obj_inventory.ds_inventory[# EFFECT1, itemslot] = obj_inventory.ds_item_all[# EFFECT1, iitem];
		obj_inventory.ds_inventory[# EFFECT2, itemslot] = obj_inventory.ds_item_all[# EFFECT2, iitem];
		obj_inventory.ds_inventory[# EFFECT3, itemslot] = obj_inventory.ds_item_all[# EFFECT3, iitem];
	}
}