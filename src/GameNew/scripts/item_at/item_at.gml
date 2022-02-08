function item_at(iitem, itemslot){
/*	//Atrybuty przedmiotow

	#region Item Type Food
	if (obj_inventory.ds_inventory[# TYPE, itemslot] = locals.itemTypeFood){
		obj_inventory.ds_inventory[# MAXSTACK, itemslot] = 20;
		obj_inventory.ds_inventory[# LEVEL, itemslot] = 0;
		obj_inventory.ds_inventory[# DAMAGE, itemslot] = 0;
		obj_inventory.ds_inventory[# DEFENCE, itemslot] = 0;
	}
	#endregion
	
	#region Item Type Fruit
		
	switch(iitem){
		case item.apple:
			obj_inventory.ds_inventory[# TYPE, itemslot] = locals.itemTypeFruit;
			obj_inventory.ds_inventory[# HP, itemslot] = 5;
			obj_inventory.ds_inventory[# STAMINA, itemslot] = 5;
		break;
		case item.pear:
			obj_inventory.ds_inventory[# TYPE, itemslot] = locals.itemTypeFruit;
			obj_inventory.ds_inventory[# HP, itemslot] = 5;
			obj_inventory.ds_inventory[# STAMINA, itemslot] = 5;
		break;
		case item.strawberry:
			obj_inventory.ds_inventory[# TYPE, itemslot] = locals.itemTypeFruit;
			obj_inventory.ds_inventory[# HP, itemslot] = 8;
			obj_inventory.ds_inventory[# STAMINA, itemslot] = 5;
		break;
		case item.lemon:
			obj_inventory.ds_inventory[# TYPE, itemslot] = locals.itemTypeFruit;
			obj_inventory.ds_inventory[# HP, itemslot] = 5;
			obj_inventory.ds_inventory[# STAMINA, itemslot] = 10;
		break;
		case item.orange:
			obj_inventory.ds_inventory[# TYPE, itemslot] = locals.itemTypeFruit;
			obj_inventory.ds_inventory[# HP, itemslot] = 5;
			obj_inventory.ds_inventory[# STAMINA, itemslot] = 8;
		break;
	}
		
	if (obj_inventory.ds_inventory[# TYPE, itemslot] = locals.itemTypeFruit){
		obj_inventory.ds_inventory[# MAXSTACK, itemslot] = 20;
		obj_inventory.ds_inventory[# LEVEL, itemslot] = 0;
		obj_inventory.ds_inventory[# DAMAGE, itemslot] = 0;
		obj_inventory.ds_inventory[# DEFENCE, itemslot] = 0;
	}
	#endregion
	
	#region Item Type Vegetable
	if (obj_inventory.ds_inventory[# TYPE, itemslot] = locals.itemTypeVegetable){
		obj_inventory.ds_inventory[# MAXSTACK, itemslot] = 20;
		obj_inventory.ds_inventory[# LEVEL, itemslot] = 0;
		obj_inventory.ds_inventory[# DAMAGE, itemslot] = 0;
		obj_inventory.ds_inventory[# DEFENCE, itemslot] = 0;
	}
	#endregion
	
	#region Item Type Dish
	
	switch(iitem){
		case item.mango_salsa:
			obj_inventory.ds_inventory[# TYPE, itemslot] = locals.itemTypeDish;
			obj_inventory.ds_inventory[# HP, itemslot] = 25;
			obj_inventory.ds_inventory[# STAMINA, itemslot] = 10;
		break;
	}
		
	if (obj_inventory.ds_inventory[# TYPE, itemslot] = locals.itemTypeDish){
		obj_inventory.ds_inventory[# MAXSTACK, itemslot] = 20;
		obj_inventory.ds_inventory[# LEVEL, itemslot] = 0;
		obj_inventory.ds_inventory[# DAMAGE, itemslot] = 0;
		obj_inventory.ds_inventory[# DEFENCE, itemslot] = 0;
	}
	#endregion
	
	#region Item Type Drink
	switch(iitem){
		case item.bull_energy_drink:
			obj_inventory.ds_inventory[# TYPE, itemslot] = locals.itemTypeDrink;
			obj_inventory.ds_inventory[# HP, itemslot] = 0;
			obj_inventory.ds_inventory[# STAMINA, itemslot] = 25;
		break;
	}
	
	if (obj_inventory.ds_inventory[# TYPE, itemslot] = locals.itemTypeDrink){
		obj_inventory.ds_inventory[# MAXSTACK, itemslot] = 20;
		obj_inventory.ds_inventory[# LEVEL, itemslot] = 0;
		obj_inventory.ds_inventory[# DAMAGE, itemslot] = 0;
		obj_inventory.ds_inventory[# DEFENCE, itemslot] = 0;
	}
	#endregion
	
	#region Item Type Resource
	switch(iitem){
		case item.stone:
			obj_inventory.ds_inventory[# TYPE, itemslot] = locals.itemTypeResource;
		break;
		case item.stick:
			obj_inventory.ds_inventory[# TYPE, itemslot] = locals.itemTypeResource;
		break;
		case item.log:
			obj_inventory.ds_inventory[# TYPE, itemslot] = locals.itemTypeResource;
		break;
	}
	
	if (obj_inventory.ds_inventory[# TYPE, itemslot] = locals.itemTypeResource){
		obj_inventory.ds_inventory[# MAXSTACK, itemslot] = 99;
		obj_inventory.ds_inventory[# HP, itemslot] = 0;
		obj_inventory.ds_inventory[# STAMINA, itemslot] = 0;
		obj_inventory.ds_inventory[# LEVEL, itemslot] = 0;
		obj_inventory.ds_inventory[# DAMAGE, itemslot] = 0;
		obj_inventory.ds_inventory[# DEFENCE, itemslot] = 0;
	}
	#endregion
	
	#region Item Type Tool
	switch(iitem){
		case item.bucket:
			obj_inventory.ds_inventory[# TYPE, itemslot] = locals.itemTypeTool;
			obj_inventory.ds_inventory[# DAMAGE, itemslot] = 0;
			obj_inventory.ds_inventory[# STAMINA, itemslot] = 0;
		break;
	}
	if (obj_inventory.ds_inventory[# TYPE, itemslot] = locals.itemTypeTool){
		obj_inventory.ds_inventory[# MAXSTACK, itemslot] = 1;
		obj_inventory.ds_inventory[# HP, itemslot] = 0;
		obj_inventory.ds_inventory[# LEVEL, itemslot] = 0;
		obj_inventory.ds_inventory[# DEFENCE, itemslot] = 0;
	}
	#endregion
	
	#region Item Type Weapon
	switch(iitem){
		case item.sword:
			obj_inventory.ds_inventory[# TYPE, itemslot] = locals.itemTypeWeapon;
			obj_inventory.ds_inventory[# STAMINA, itemslot] = 0;
			obj_inventory.ds_inventory[# LEVEL, itemslot] = 0;
			obj_inventory.ds_inventory[# DAMAGE, itemslot] = 0;
		break;
	}
		
	if (obj_inventory.ds_inventory[# TYPE, itemslot] = locals.itemTypeWeapon){
		obj_inventory.ds_inventory[# MAXSTACK, itemslot] = 1;
		obj_inventory.ds_inventory[# HP, itemslot] = 0;
		obj_inventory.ds_inventory[# DEFENCE, itemslot] = 0;
	}
	#endregion
*/
	
}