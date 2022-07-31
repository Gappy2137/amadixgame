function item_mag_find(iitem){
	var xx = 0;
	var _inv = obj_inventory.ds_inventory;
	var amount = 0;
	repeat(obj_inventory.inv_slots){
		if (_inv[# INVITEM, xx] == iitem){
			amount += _inv[# INVCAP, xx];
			xx++;
		}else{
			xx++;
		}
	}
	if (xx == obj_inventory.inv_slots){
		return amount;
	}
}