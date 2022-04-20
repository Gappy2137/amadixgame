function item_mag_check_amount(iitem){
	var yy = 0;
	var amount = 0;
	repeat(obj_inventory.inv_slots){
		if (obj_inventory.ds_inventory[# INVITEM, yy] == iitem){
			amount += obj_inventory.ds_inventory[# INVLEVEL, yy];
			yy++;
		}else{
			yy++;	
		}
	}
	return amount;
}