function item_check_amount(iitem){
	var yy = 0;
	var amount = 0;
	repeat(obj_inventory.inv_slots){
		if (obj_inventory.ds_inventory[# ITEM, yy] == iitem){
			amount += obj_inventory.ds_inventory[# AMOUNT, yy];
			yy++;
		}else{
			yy++;	
		}
	}
	return amount;
}