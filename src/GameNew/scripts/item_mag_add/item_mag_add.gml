function item_mag_add(iitem, cap, level){
	var xx = 0;
	var flag = false;
	var _inv = obj_inventory.ds_inventory;
	var itemall = obj_inventory.ds_item_all;
	if (!flag){
		repeat(obj_inventory.inv_slots){
			if (obj_inventory.ds_inventory[# INVITEM, xx] == item.none){
				_inv[# INVITEM, xx] = iitem;
				_inv[# INVAMOUNT, xx] = 1;
				_inv[# INVTYPE, xx] = itemall[# INVTYPE, iitem];
				_inv[# MAXSTACK, xx] = 1;
				_inv[# INVHP, xx] = itemall[# INVHP, iitem];
				_inv[# INVSTAMINA, xx] = itemall[# INVSTAMINA, iitem];
				_inv[# INVLEVEL, xx] = level;
				_inv[# INVCAP, xx] = cap;
				_inv[# INVDAMAGE, xx] = itemall[# INVDAMAGE, iitem];
				_inv[# INVDEFENCE, xx] = itemall[# INVDEFENCE, iitem];
				_inv[# INVEFFECTS, xx] = itemall[# INVEFFECTS, iitem];
				_inv[# INVTEMPERATURE, xx] = itemall[# INVTEMPERATURE, iitem];
				_inv[# MAXCAP, xx] = itemall[# MAXCAP, iitem];
				flag = true;
				exit;
			}else{
				xx++;
			}
		}
	}
}