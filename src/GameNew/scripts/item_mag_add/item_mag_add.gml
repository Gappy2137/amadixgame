function item_mag_add(iitem, cap){
	var xx = 0;
	var flag = false;
	var inv = obj_inventory.ds_inventory;
	var itemall = obj_inventory.ds_item_all;
	if (!flag){
		repeat(obj_inventory.inv_slots){
			if (obj_inventory.ds_inventory[# INVITEM, xx] == item.none){
				inv[# INVITEM, xx] = iitem;
				inv[# INVAMOUNT, xx] = 1;
				inv[# INVTYPE, xx] = itemall[# INVTYPE, iitem];
				inv[# MAXSTACK, xx] = itemall[# MAXSTACK, iitem];
				inv[# INVHP, xx] = itemall[# INVHP, iitem];
				inv[# INVSTAMINA, xx] = itemall[# INVSTAMINA, iitem];
				inv[# INVLEVEL, xx] = cap;
				inv[# INVDAMAGE, xx] = itemall[# INVDAMAGE, iitem];
				inv[# INVDEFENCE, xx] = itemall[# INVDEFENCE, iitem];
				inv[# INVEFFECTS, xx] = itemall[# INVEFFECTS, iitem];
				inv[# INVTEMPERATURE, xx] = itemall[# INVTEMPERATURE, iitem];
				flag = true;
				exit;
			}else{
				xx++;
			}
		}
	}
}