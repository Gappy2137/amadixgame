function item_stack_fix(iitem, amount, xx, ready){
	/*
	if ready == undefined{ready = 0;}
	if xx == undefined{xx = 0;}
	var slots = obj_inventory.inv_slots;
	var inv = obj_inventory.ds_inventory;
	var itemall = obj_inventory.ds_item_all;
	var am = amount;
	
	switch(ready){
		case 0:
				if (ds_grid_value_exists(inv, 0, 0, 0, slots, iitem)){
					
					var i = 0;
					if (inv[# AMOUNT, i] == itemall[# MAXSTACK, iitem]){
						
						repeat(slots){
							if (inv[# AMOUNT, i] == itemall[# MAXSTACK, iitem]){
								i++;
							}else{
								xx = i;
							}
						}
					}else{
						xx = ds_grid_value_y(inv, 0, 0, 0, slots, iitem);
					}

					if (am + inv[# AMOUNT, xx] <= itemall[# MAXSTACK, iitem]){
						inv[# ITEM, xx] = iitem;
						inv[# AMOUNT, xx] += am;
						item_at(iitem, xx);
					}else{
						if (inv[# AMOUNT, xx] == itemall[# MAXSTACK, iitem]){
							am = amount;	
							inv[# ITEM, xx] = iitem;
							inv[# AMOUNT, xx] = itemall[# MAXSTACK, iitem];
							item_at(iitem, xx);
							item_stack(iitem, am, 0, 2);
						}else{
							am = itemall[# MAXSTACK, iitem] - inv[# AMOUNT, xx];
							inv[# ITEM, xx] = iitem;
							inv[# AMOUNT, xx] = itemall[# MAXSTACK, iitem];
							item_at(iitem, xx);
							item_stack(iitem, am, 0, 1);
						}
					}
		
				}else if (ds_grid_value_exists(inv, 0, 0, 0, slots, item.none)){
					xx = ds_grid_value_y(inv, 0, 0, 0, slots, item.none);
					inv[# ITEM, xx] = iitem;
					inv[# AMOUNT, xx] += am;
					item_at(iitem, xx);
				}
		break;
		case 1:
				var test = ds_grid_value_y(inv, 0, 0, 0, slots, iitem);
				if (test) && (inv[# AMOUNT, test] != itemall[# MAXSTACK, iitem]){
					xx = ds_grid_value_y(inv, 0, 0, 0, slots, iitem);
					inv[# ITEM, xx] = iitem;
					inv[# AMOUNT, xx] += am;
					item_at(iitem, xx);
				}else if (ds_grid_value_exists(inv, 0, 0, 0, slots, item.none)){
					xx = ds_grid_value_y(inv, 0, 0, 0, slots, item.none);
					inv[# ITEM, xx] = iitem;
					inv[# AMOUNT, xx] += am;
					item_at(iitem, xx);
				}
		break;
		case 2:
				if (ds_grid_value_exists(inv, 0, 0, 0, slots, item.none)){
					xx = ds_grid_value_y(inv, 0, 0, 0, slots, item.none);
					inv[# ITEM, xx] = iitem;
					inv[# AMOUNT, xx] += am;
					item_at(iitem, xx);
				}
		break;
	}*/
}