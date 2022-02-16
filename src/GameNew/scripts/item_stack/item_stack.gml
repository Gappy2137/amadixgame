function item_stack(iitem, amount, xx, ready){
	
	if ready == undefined{ready = 0;}
	var slots = obj_inventory.inv_slots;
	var inv = obj_inventory.ds_inventory;
	var itemall = obj_inventory.ds_item_all;
	var am = amount;
	//var flag = false;
	
		var i = 0;
		var flag = false;
		repeat(slots){
			if (!flag){
				if (ready){
					if (inv[# INVITEM, i] == item.none){
						inv[# INVITEM, i] = iitem;
						inv[# INVAMOUNT, i] = amount;
						inv[# INVTYPE, i] = itemall[# INVTYPE, iitem];
						inv[# MAXSTACK, i] = itemall[# MAXSTACK, iitem];
						inv[# INVHP, i] = itemall[# INVHP, iitem];
						inv[# INVSTAMINA, i] = itemall[# INVSTAMINA, iitem];
						inv[# INVLEVEL, i] = itemall[# INVLEVEL, iitem];
						inv[# INVDAMAGE, i] = itemall[# INVDAMAGE, iitem];
						inv[# INVDEFENCE, i] = itemall[# INVDEFENCE, iitem];
						inv[# INVEFFECTS, i] = itemall[# INVEFFECTS, iitem];
						inv[# INVTEMPERATURE, i] = itemall[# INVTEMPERATURE, iitem];
						flag = true;
					}else{
						i++;	
					}
				}else{
					if (inv[# INVITEM, i] == iitem) && !(inv[# INVAMOUNT, i] == itemall[# MAXSTACK, iitem]){
						if (inv[# INVAMOUNT, i] + am > itemall[# MAXSTACK, iitem]){
							am = (inv[# INVAMOUNT, i] + amount) - itemall[# MAXSTACK, iitem];
							inv[# INVAMOUNT, i] = itemall[# MAXSTACK, iitem];
							item_stack(iitem, am, 0, false);
							flag = true;
						}else{
							inv[# INVAMOUNT, i]+=amount;
							flag = true;
						}
					}else{
						i++;
						if (i >= slots){
							item_stack(iitem, am, 0, true);
						}
					}
				}
			}
		}

}