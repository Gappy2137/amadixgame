function item_find_capacity(iitem){
	var xx = 0;
	var _inv = obj_inventory.ds_inventory;
	var cap = 0;
	repeat(obj_inventory.inv_slots - ADDITIONALSLOTS){
		if (_inv[# INVITEM, xx] == iitem){
			cap += _inv[# INVCAP, xx];
		}
		xx++;
	}
	if (xx == obj_inventory.inv_slots - ADDITIONALSLOTS){
		return cap;
	}
	
}