function slot_remove(slot){
	obj_inventory.ds_inventory[# INVITEM, slot] = item.none;
	obj_inventory.ds_inventory[# INVAMOUNT, slot] = 0;
	obj_inventory.ds_inventory[# INVTYPE, slot] = -1;
	obj_inventory.ds_inventory[# MAXSTACK, slot] = 0;
	obj_inventory.ds_inventory[# INVHP, slot] = 0;
	obj_inventory.ds_inventory[# INVSTAMINA, slot] = 0;
	obj_inventory.ds_inventory[# INVLEVEL, slot] = 0;
	obj_inventory.ds_inventory[# INVDAMAGE, slot] = 0;
	obj_inventory.ds_inventory[# INVDEFENCE, slot] = 0;
	obj_inventory.ds_inventory[# INVEFFECTS, slot] = 0;
	obj_inventory.ds_inventory[# INVTEMPERATURE, slot] = 0;
	obj_inventory.ds_inventory[# INVCAP, slot] = 0;
	obj_inventory.ds_inventory[# MAXCAP, slot] = -1;
}