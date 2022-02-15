function item_exists_amount(iitem, amount){
	var yy = 0;
	var temp = false;
	repeat(obj_inventory.inv_slots){
		if (obj_inventory.ds_inventory[# INVITEM, yy] == iitem) && (obj_inventory.ds_inventory[# INVAMOUNT, yy] >= amount){
			if (!temp){
				return true;
				temp = true;	
			}	
		}else{
			yy++;	
		}
	}
}