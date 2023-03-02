function itemtype_find(iitemtype){

	var i = 0;
	var eq = obj_inventory.ds_inventory;

	repeat(obj_inventory.inv_slots - ADDITIONALSLOTS){
		
		if (eq[# INVTYPE, i] == iitemtype){
			
			if (eq[# INVCAP, i] > 0){
				
				return ( eq[# INVITEM, i] );
				
			}
			
		}
		
		i++;
		
	}

}