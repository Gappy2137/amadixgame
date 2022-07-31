function container_stack(iitem, amount, xx, ready, level, capacity, _con, _maxslots){
	if ready == undefined{ready = false;}
	var itemall = obj_inventory.ds_item_all;
	var am = amount;
	
		var i = 0;
		var flag = false;
		repeat(_maxslots){
			if (!flag){
				if (ready){
					if (_con[# INVITEM, i] == item.none){
						_con[# INVITEM, i] = iitem;
						_con[# INVAMOUNT, i] = amount;
						_con[# INVTYPE, i] = itemall[# INVTYPE, iitem];
						_con[# MAXSTACK, i] = itemall[# MAXSTACK, iitem];
						_con[# INVHP, i] = itemall[# INVHP, iitem];
						_con[# INVSTAMINA, i] = itemall[# INVSTAMINA, iitem];
						_con[# INVLEVEL, i] = level;
						_con[# INVDAMAGE, i] = itemall[# INVDAMAGE, iitem];
						_con[# INVDEFENCE, i] = itemall[# INVDEFENCE, iitem];
						_con[# INVEFFECTS, i] = itemall[# INVEFFECTS, iitem];
						_con[# INVTEMPERATURE, i] = itemall[# INVTEMPERATURE, iitem];
						_con[# INVCAP, i] = capacity;
						_con[# MAXCAP, i] = itemall[# MAXCAP, iitem];
						flag = true;
					}else{
						i++;	
					}
				}else{
					if (_con[# INVITEM, i] == iitem) && (_con[# INVAMOUNT, i] != itemall[# MAXSTACK, iitem]){
						if (_con[# INVAMOUNT, i] + am > itemall[# MAXSTACK, iitem]){
							am = (_con[# INVAMOUNT, i] + amount) - itemall[# MAXSTACK, iitem];
							_con[# INVAMOUNT, i] = itemall[# MAXSTACK, iitem];
							container_stack(iitem, am, 0, false, level, capacity, _con, _maxslots);
							return am;
							flag = true;
						}else{
							_con[# INVAMOUNT, i]+=amount;
							flag = true;
						}
					}else{
						i++;
						if (i >= _maxslots){
							container_stack(iitem, am, 0, true, level, capacity, _con, _maxslots);
							return 0;
							break;
						}
					}
				}
			}
		}
		return 0;
}