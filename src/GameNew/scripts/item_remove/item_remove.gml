function item_remove(iitem, amount, allitems){
		var xx = 0;
		var picked = false;
		var am = amount;
		if (!picked){
			repeat(obj_inventory.inv_slots){
				if (obj_inventory.ds_inventory[# ITEM, xx] == iitem){
					if (item_check_amount(iitem) >= amount){
						if (!picked){
							if (obj_inventory.ds_inventory[# AMOUNT, xx] >= amount){
								obj_inventory.ds_inventory[# AMOUNT, xx] -= amount;
							}else{
								am = amount - obj_inventory.ds_inventory[# AMOUNT, xx];
								obj_inventory.ds_inventory[# ITEM, xx] = item.none;
								obj_inventory.ds_inventory[# AMOUNT, xx] = 0;
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