function item_exists(iitem, remove){
	var yy = 0;
	var temp = false;
	repeat(obj_inventory.inv_slots){
		if (obj_inventory.ds_inventory[# INVITEM, yy] == iitem){
			if (!temp){
				return true;
				if (remove == true){
					slot_remove(yy);	
				}
				temp = true;	
			}	
		}else{
			yy++;	
		}
	}
}