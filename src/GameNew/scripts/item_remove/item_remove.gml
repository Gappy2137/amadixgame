function item_remove(iitem, amount, allitems){
		var xx = 0;
		var picked = false;
		var am = amount;
		if (!picked){
			repeat(obj_inventory.inv_slots){
				if (obj_inventory.ds_inventory[# INVITEM, xx] == iitem){
					if (item_check_amount(iitem) >= amount){
						if (!picked){
							if (obj_inventory.ds_inventory[# INVAMOUNT, xx] >= amount){
								obj_inventory.ds_inventory[# INVAMOUNT, xx] -= amount;
								
								if (obj_inventory.ds_inventory[# INVAMOUNT, xx] == 0){
									slot_remove(xx);
								}
								
							}else{
								am = amount - obj_inventory.ds_inventory[# INVAMOUNT, xx];
								obj_inventory.ds_inventory[# INVITEM, xx] = item.none;
								obj_inventory.ds_inventory[# INVAMOUNT, xx] = 0;
								item_remove(iitem, am, false);
								xx++;
							}
							picked = true;
						}
						picked = true;
					}else{
						xx++;
					}
				}else{
					xx++;
				}
				if (picked){exit;}
			}
		}
}