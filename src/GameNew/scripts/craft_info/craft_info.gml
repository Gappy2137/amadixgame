function craft_info(iitem, itemslot){
	//Atrybuty przedmiotow

	#region Item Type Food
	if (obj_crafting.ds_result_info[# INVTYPE, itemslot] = locals.itemTypeFood){
		obj_crafting.ds_result_info[# INVLEVEL, itemslot] = 0;
		obj_crafting.ds_result_info[# INVDAMAGE, itemslot] = 0;
		obj_crafting.ds_result_info[# INVDEFENCE, itemslot] = 0;
	}
	#endregion
	
	#region Item Type Fruit
		
	switch(iitem){
		case item.apple:
			obj_crafting.ds_result_info[# INVTYPE, itemslot] = locals.itemTypeFruit;
			obj_crafting.ds_result_info[# INVHP, itemslot] = 5;
			obj_crafting.ds_result_info[# INVSTAMINA, itemslot] = 5;
		break;
		case item.pear:
			obj_crafting.ds_result_info[# INVTYPE, itemslot] = locals.itemTypeFruit;
			obj_crafting.ds_result_info[# INVHP, itemslot] = 5;
			obj_crafting.ds_result_info[# INVSTAMINA, itemslot] = 5;
		break;
		case item.strawberry:
			obj_crafting.ds_result_info[# INVTYPE, itemslot] = locals.itemTypeFruit;
			obj_crafting.ds_result_info[# INVHP, itemslot] = 8;
			obj_crafting.ds_result_info[# INVSTAMINA, itemslot] = 5;
		break;
		case item.lemon:
			obj_crafting.ds_result_info[# INVTYPE, itemslot] = locals.itemTypeFruit;
			obj_crafting.ds_result_info[# INVHP, itemslot] = 5;
			obj_crafting.ds_result_info[# INVSTAMINA, itemslot] = 10;
		break;
		case item.orange:
			obj_crafting.ds_result_info[# INVTYPE, itemslot] = locals.itemTypeFruit;
			obj_crafting.ds_result_info[# INVHP, itemslot] = 5;
			obj_crafting.ds_result_info[# INVSTAMINA, itemslot] = 8;
		break;
	}
		
	if (obj_crafting.ds_result_info[# INVTYPE, itemslot] = locals.itemTypeFruit){
		obj_crafting.ds_result_info[# INVLEVEL, itemslot] = 0;
		obj_crafting.ds_result_info[# INVDAMAGE, itemslot] = 0;
		obj_crafting.ds_result_info[# INVDEFENCE, itemslot] = 0;
	}
	#endregion
	
	#region Item Type Vegetable
	if (obj_crafting.ds_result_info[# INVTYPE, itemslot] = locals.itemTypeVegetable){
		obj_crafting.ds_result_info[# INVLEVEL, itemslot] = 0;
		obj_crafting.ds_result_info[# INVDAMAGE, itemslot] = 0;
		obj_crafting.ds_result_info[# INVDEFENCE, itemslot] = 0;
	}
	#endregion
	
	#region Item Type Dish
	
	switch(iitem){
		case item.mango_salsa:
			obj_crafting.ds_result_info[# INVTYPE, itemslot] = locals.itemTypeDish;
			obj_crafting.ds_result_info[# INVHP, itemslot] = 25;
			obj_crafting.ds_result_info[# INVSTAMINA, itemslot] = 10;
		break;
	}
		
	if (obj_crafting.ds_result_info[# INVTYPE, itemslot] = locals.itemTypeDish){
		obj_crafting.ds_result_info[# INVLEVEL, itemslot] = 0;
		obj_crafting.ds_result_info[# INVDAMAGE, itemslot] = 0;
		obj_crafting.ds_result_info[# INVDEFENCE, itemslot] = 0;
	}
	#endregion
	
	#region Item Type Drink
	switch(iitem){
		case item.bull_energy_drink:
			obj_crafting.ds_result_info[# INVTYPE, itemslot] = locals.itemTypeDrink;
			obj_crafting.ds_result_info[# INVHP, itemslot] = 0;
			obj_crafting.ds_result_info[# INVSTAMINA, itemslot] = 25;
		break;
	}
	
	if (obj_crafting.ds_result_info[# INVTYPE, itemslot] = locals.itemTypeDrink){
		obj_crafting.ds_result_info[# INVLEVEL, itemslot] = 0;
		obj_crafting.ds_result_info[# INVDAMAGE, itemslot] = 0;
		obj_crafting.ds_result_info[# INVDEFENCE, itemslot] = 0;
	}
	#endregion
	
	#region Item Type Resource
	switch(iitem){
		case item.stone:
			obj_crafting.ds_result_info[# INVTYPE, itemslot] = locals.itemTypeResource;
		break;
		case item.stick:
			obj_crafting.ds_result_info[# INVTYPE, itemslot] = locals.itemTypeResource;
		break;
		case item.log:
			obj_crafting.ds_result_info[# INVTYPE, itemslot] = locals.itemTypeResource;
		break;
	}
	
	if (obj_crafting.ds_result_info[# INVTYPE, itemslot] = locals.itemTypeResource){
		obj_crafting.ds_result_info[# INVHP, itemslot] = 0;
		obj_crafting.ds_result_info[# INVSTAMINA, itemslot] = 0;
		obj_crafting.ds_result_info[# INVLEVEL, itemslot] = 0;
		obj_crafting.ds_result_info[# INVDAMAGE, itemslot] = 0;
		obj_crafting.ds_result_info[# INVDEFENCE, itemslot] = 0;
	}
	#endregion
	
	#region Item Type Tool
	switch(iitem){
		case item.bucket:
			obj_crafting.ds_result_info[# INVTYPE, itemslot] = locals.itemTypeTool;
			obj_crafting.ds_result_info[# INVDAMAGE, itemslot] = 0;
			obj_crafting.ds_result_info[# INVSTAMINA, itemslot] = 0;
		break;
	}
	if (obj_crafting.ds_result_info[# INVTYPE, itemslot] = locals.itemTypeTool){
		obj_crafting.ds_result_info[# INVHP, itemslot] = 0;
		obj_crafting.ds_result_info[# INVLEVEL, itemslot] = 0;
		obj_crafting.ds_result_info[# INVDEFENCE, itemslot] = 0;
	}
	#endregion
	
	#region Item Type Weapon
	switch(iitem){
		case item.sword:
		obj_crafting.ds_result_info[# INVTYPE, itemslot] = locals.itemTypeWeapon;
		obj_crafting.ds_result_info[# INVSTAMINA, itemslot] = 0;
		obj_crafting.ds_result_info[# INVLEVEL, itemslot] = 0;
		obj_crafting.ds_result_info[# INVDAMAGE, itemslot] = 0;
		break;
	}
		
	if (obj_crafting.ds_result_info[# INVTYPE, itemslot] = locals.itemTypeWeapon){
		obj_crafting.ds_result_info[# INVHP, itemslot] = 0;
		obj_crafting.ds_result_info[# INVDEFENCE, itemslot] = 0;
	}
	#endregion

	
}