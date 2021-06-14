function craft_info(iitem, itemslot){
	//Atrybuty przedmiotow

	#region Item Type Food
	if (obj_crafting.ds_result_info[# TYPE, itemslot] = locals.itemTypeFood){
		obj_crafting.ds_result_info[# LEVEL, itemslot] = 0;
		obj_crafting.ds_result_info[# DAMAGE, itemslot] = 0;
		obj_crafting.ds_result_info[# DEFENCE, itemslot] = 0;
	}
	#endregion
	
	#region Item Type Fruit
		
	switch(iitem){
		case item.apple:
			obj_crafting.ds_result_info[# TYPE, itemslot] = locals.itemTypeFruit;
			obj_crafting.ds_result_info[# HP, itemslot] = 5;
			obj_crafting.ds_result_info[# STAMINA, itemslot] = 5;
		break;
		case item.pear:
			obj_crafting.ds_result_info[# TYPE, itemslot] = locals.itemTypeFruit;
			obj_crafting.ds_result_info[# HP, itemslot] = 5;
			obj_crafting.ds_result_info[# STAMINA, itemslot] = 5;
		break;
		case item.strawberry:
			obj_crafting.ds_result_info[# TYPE, itemslot] = locals.itemTypeFruit;
			obj_crafting.ds_result_info[# HP, itemslot] = 8;
			obj_crafting.ds_result_info[# STAMINA, itemslot] = 5;
		break;
		case item.lemon:
			obj_crafting.ds_result_info[# TYPE, itemslot] = locals.itemTypeFruit;
			obj_crafting.ds_result_info[# HP, itemslot] = 5;
			obj_crafting.ds_result_info[# STAMINA, itemslot] = 10;
		break;
		case item.orange:
			obj_crafting.ds_result_info[# TYPE, itemslot] = locals.itemTypeFruit;
			obj_crafting.ds_result_info[# HP, itemslot] = 5;
			obj_crafting.ds_result_info[# STAMINA, itemslot] = 8;
		break;
	}
		
	if (obj_crafting.ds_result_info[# TYPE, itemslot] = locals.itemTypeFruit){
		obj_crafting.ds_result_info[# LEVEL, itemslot] = 0;
		obj_crafting.ds_result_info[# DAMAGE, itemslot] = 0;
		obj_crafting.ds_result_info[# DEFENCE, itemslot] = 0;
	}
	#endregion
	
	#region Item Type Vegetable
	if (obj_crafting.ds_result_info[# TYPE, itemslot] = locals.itemTypeVegetable){
		obj_crafting.ds_result_info[# LEVEL, itemslot] = 0;
		obj_crafting.ds_result_info[# DAMAGE, itemslot] = 0;
		obj_crafting.ds_result_info[# DEFENCE, itemslot] = 0;
	}
	#endregion
	
	#region Item Type Dish
	
	switch(iitem){
		case item.mango_salsa:
			obj_crafting.ds_result_info[# TYPE, itemslot] = locals.itemTypeDish;
			obj_crafting.ds_result_info[# HP, itemslot] = 25;
			obj_crafting.ds_result_info[# STAMINA, itemslot] = 10;
		break;
	}
		
	if (obj_crafting.ds_result_info[# TYPE, itemslot] = locals.itemTypeDish){
		obj_crafting.ds_result_info[# LEVEL, itemslot] = 0;
		obj_crafting.ds_result_info[# DAMAGE, itemslot] = 0;
		obj_crafting.ds_result_info[# DEFENCE, itemslot] = 0;
	}
	#endregion
	
	#region Item Type Drink
	switch(iitem){
		case item.bull_energy_drink:
			obj_crafting.ds_result_info[# TYPE, itemslot] = locals.itemTypeDrink;
			obj_crafting.ds_result_info[# HP, itemslot] = 0;
			obj_crafting.ds_result_info[# STAMINA, itemslot] = 25;
		break;
	}
	
	if (obj_crafting.ds_result_info[# TYPE, itemslot] = locals.itemTypeDrink){
		obj_crafting.ds_result_info[# LEVEL, itemslot] = 0;
		obj_crafting.ds_result_info[# DAMAGE, itemslot] = 0;
		obj_crafting.ds_result_info[# DEFENCE, itemslot] = 0;
	}
	#endregion
	
	#region Item Type Resource
	switch(iitem){
		case item.stone:
			obj_crafting.ds_result_info[# TYPE, itemslot] = locals.itemTypeResource;
		break;
		case item.stick:
			obj_crafting.ds_result_info[# TYPE, itemslot] = locals.itemTypeResource;
		break;
		case item.log:
			obj_crafting.ds_result_info[# TYPE, itemslot] = locals.itemTypeResource;
		break;
	}
	
	if (obj_crafting.ds_result_info[# TYPE, itemslot] = locals.itemTypeResource){
		obj_crafting.ds_result_info[# HP, itemslot] = 0;
		obj_crafting.ds_result_info[# STAMINA, itemslot] = 0;
		obj_crafting.ds_result_info[# LEVEL, itemslot] = 0;
		obj_crafting.ds_result_info[# DAMAGE, itemslot] = 0;
		obj_crafting.ds_result_info[# DEFENCE, itemslot] = 0;
	}
	#endregion
	
	#region Item Type Tool
	switch(iitem){
		case item.bucket:
			obj_crafting.ds_result_info[# TYPE, itemslot] = locals.itemTypeTool;
			obj_crafting.ds_result_info[# DAMAGE, itemslot] = 0;
			obj_crafting.ds_result_info[# STAMINA, itemslot] = 0;
		break;
	}
	if (obj_crafting.ds_result_info[# TYPE, itemslot] = locals.itemTypeTool){
		obj_crafting.ds_result_info[# HP, itemslot] = 0;
		obj_crafting.ds_result_info[# LEVEL, itemslot] = 0;
		obj_crafting.ds_result_info[# DEFENCE, itemslot] = 0;
	}
	#endregion
	
	#region Item Type Weapon
	switch(iitem){
		case item.sword:
		obj_crafting.ds_result_info[# TYPE, itemslot] = locals.itemTypeWeapon;
		obj_crafting.ds_result_info[# STAMINA, itemslot] = 0;
		obj_crafting.ds_result_info[# LEVEL, itemslot] = 0;
		obj_crafting.ds_result_info[# DAMAGE, itemslot] = 0;
		break;
	}
		
	if (obj_crafting.ds_result_info[# TYPE, itemslot] = locals.itemTypeWeapon){
		obj_crafting.ds_result_info[# HP, itemslot] = 0;
		obj_crafting.ds_result_info[# DEFENCE, itemslot] = 0;
	}
	#endregion

	
}