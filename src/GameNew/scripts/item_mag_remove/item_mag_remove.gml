function item_mag_remove(iitem){
		var xx = 0;
		var picked = false;
		var cap = 0;
		if (!picked){
			repeat(obj_inventory.inv_slots){
				if (obj_inventory.ds_inventory[# INVITEM, xx] == iitem)
				&& (obj_inventory.ds_inventory[# INVLEVEL, xx] != 0){
					cap = obj_inventory.ds_inventory[# INVLEVEL, xx];
					slot_remove(xx);
					return cap;
					
					picked = true;
					exit;
				}else{
					xx++;
				}
				if (picked){exit;}
			}
		}

}