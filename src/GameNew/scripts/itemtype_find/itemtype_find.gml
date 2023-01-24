function itemtype_find(iitemtype){

	var yy = 0;
	var iitem = item.none;

	repeat(obj_inventory.inv_slots - ADDITIONALSLOTS){
		
		if (obj_inventory.ds_inventory[# INVTYPE, yy] == iitemtype){
			
			iitem = obj_inventory.ds_inventory[# INVITEM, yy];
			
			return iitem;
			
		}
		
		yy++;
		
	}

}