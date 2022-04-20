function item_find_amount(iitem){
	var xx = 0;
	var inv = obj_inventory.ds_inventory;
	var amount = 0;
	repeat(obj_inventory.inv_slots){
		if (inv[# INVITEM, xx] == iitem){
			amount += inv[# INVAMOUNT, xx];
			xx++;
		}else{
			xx++;	
		}
	}
	if (xx == obj_inventory.inv_slots){
		return amount;
	}
}