function item_remove_capacity(iitem, cap){
		var xx = 0;
		var picked = false;
		var am = cap;
		if (!picked){
			repeat(obj_inventory.inv_slots){
				if (obj_inventory.ds_inventory[# INVITEM, xx] == iitem){
					if (obj_inventory.ds_inventory[# INVCAP, xx] > 0){
						if (item_find_capacity(iitem) >= cap){
							if (!picked){
								if (obj_inventory.ds_inventory[# INVCAP, xx] >= cap){
									obj_inventory.ds_inventory[# INVCAP, xx] -= cap;
								
									if (obj_inventory.ds_inventory[# INVCAP, xx] <= 0){
										obj_inventory.ds_inventory[# INVCAP, xx] = 0;
									}
								
								}else{
									am = cap - obj_inventory.ds_inventory[# INVCAP, xx];
									obj_inventory.ds_inventory[# INVCAP, xx] = 0;
									item_remove_capacity(iitem, am);
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
				}else{
					xx++;
				}
				if (picked){exit;}
			}
		}
}