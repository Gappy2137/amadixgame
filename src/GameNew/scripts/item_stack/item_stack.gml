function item_stack(iitem, amount, xx, ready, level, capacity){
	
	if ready == undefined{ready = false;}
	var slots = obj_inventory.inv_slots;
	var _inv = obj_inventory.ds_inventory;
	var itemall = obj_inventory.ds_item_all;
	var am = amount;
	//var flag = false;
	
		var i = 0;
		var flag = false;
		repeat(slots){
			if (!flag){
				if (ready){
					if (_inv[# INVITEM, i] == item.none){
						_inv[# INVITEM, i] = iitem;
						_inv[# INVAMOUNT, i] = amount;
						_inv[# INVTYPE, i] = itemall[# INVTYPE, iitem];
						_inv[# MAXSTACK, i] = itemall[# MAXSTACK, iitem];
						_inv[# INVHP, i] = itemall[# INVHP, iitem];
						_inv[# INVSTAMINA, i] = itemall[# INVSTAMINA, iitem];
						_inv[# INVLEVEL, i] = itemall[# INVLEVEL, iitem];
						_inv[# INVDAMAGE, i] = itemall[# INVDAMAGE, iitem];
						_inv[# INVDEFENCE, i] = itemall[# INVDEFENCE, iitem];
						_inv[# INVEFFECTS, i] = itemall[# INVEFFECTS, iitem];
						_inv[# INVTEMPERATURE, i] = itemall[# INVTEMPERATURE, iitem];
						_inv[# INVCAP, i] = itemall[# INVCAP, iitem];
						flag = true;
					}else{
						i++;	
					}
				}else{
					if (_inv[# INVITEM, i] == iitem) && !(_inv[# INVAMOUNT, i] == itemall[# MAXSTACK, iitem]){
						if (_inv[# INVAMOUNT, i] + am > itemall[# MAXSTACK, iitem]){
							am = (_inv[# INVAMOUNT, i] + amount) - itemall[# MAXSTACK, iitem];
							_inv[# INVAMOUNT, i] = itemall[# MAXSTACK, iitem];
							item_stack(iitem, am, 0, false, level, capacity);
							flag = true;
						}else{
							_inv[# INVAMOUNT, i]+=amount;
							flag = true;
						}
					}else{
						i++;
						if (i >= slots){
							item_stack(iitem, am, 0, true, level, capacity);
						}
					}
				}
			}
		}

}