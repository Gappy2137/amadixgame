function itemtype_find_amount(iitemtype){

	var xx = 0;
	var _inv = obj_inventory.ds_inventory;
	var amount = 0;
	repeat(obj_inventory.inv_slots - ADDITIONALSLOTS){
		if (_inv[# INVTYPE, xx] == iitemtype){
			amount += _inv[# INVAMOUNT, xx];
		}
		xx++;
	}
	if (xx == obj_inventory.inv_slots - ADDITIONALSLOTS){
		return amount;
	}

}