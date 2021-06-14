function item_exists_amount(iitem, amount){
	var yy = 0;
	var temp = false;
	repeat(obj_inventory.inv_slots){
		if (obj_inventory.ds_inventory[# ITEM, yy] == iitem) && (obj_inventory.ds_inventory[# AMOUNT, yy] >= amount){
			if (!temp){
				return true;
				temp = true;	
			}	
		}else{
			yy++;	
		}
	}
}