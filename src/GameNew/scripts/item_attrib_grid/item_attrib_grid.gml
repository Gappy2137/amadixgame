function item_attrib_grid(){
	var grid = obj_inventory.ds_item_all;
	
	//Nic
	grid[# TYPE, item.none] = 0;
	grid[# MAXSTACK, item.none] = 0;
	grid[# HP, item.none] = 0;
	grid[# STAMINA, item.none] = 0;
	grid[# LEVEL, item.none] = 0;
	grid[# DAMAGE, item.none] = 0;
	grid[# DEFENCE, item.none] = 0;
	grid[# EFFECT1, item.none] = 0;
	grid[# EFFECT2, item.none] = 0;
	grid[# EFFECT3, item.none] = 0;

	//Jablko
	grid[# TYPE, item.apple] = locals.itemTypeFruit;
	
	grid[# HP, item.apple] = 5;
	grid[# STAMINA, item.apple] = 5;
	
	//Wiadro
	grid[# TYPE, item.bucket] = locals.itemTypeTool;
	grid[# DAMAGE, item.bucket] = 0;
	grid[# STAMINA, item.bucket] = 0;
	
	//Kamien
	grid[# TYPE, item.stone] = locals.itemTypeResource;
	
	//Miecz
	grid[# TYPE, item.sword] = locals.itemTypeWeapon;
	grid[# STAMINA, item.sword] = 0;
	grid[# LEVEL, item.sword] = 1;
	grid[# DAMAGE, item.sword] = 5;
	
	//Byczek
	grid[# TYPE, item.bull_energy_drink] = locals.itemTypeDrink;
	grid[# HP, item.bull_energy_drink] = 5;
	grid[# STAMINA, item.bull_energy_drink] = 25;
	
	//Mangosalsa
	grid[# TYPE, item.mango_salsa] = locals.itemTypeDish;
	grid[# HP, item.mango_salsa] = 25;
	grid[# STAMINA, item.mango_salsa] = 10;
	
	//Patyk
	grid[# TYPE, item.stick] = locals.itemTypeResource;
	
	//Kloda
	grid[# TYPE, item.log] = locals.itemTypeResource;
	
	//Gruszka
	grid[# TYPE, item.pear] = locals.itemTypeFruit;
	grid[# HP, item.pear] = 7;
	grid[# STAMINA, item.pear] = 7;
	
	//Truskawka
	grid[# TYPE, item.strawberry] = locals.itemTypeFruit;
	grid[# HP, item.strawberry] = 5;
	grid[# STAMINA, item.strawberry] = 5;
	
	//Cytryna
	grid[# TYPE, item.lemon] = locals.itemTypeFruit;
	grid[# HP, item.lemon] = 5;
	grid[# STAMINA, item.lemon] = 10;
	
	//Pomarancza
	grid[# TYPE, item.orange] = locals.itemTypeFruit;
	grid[# HP, item.orange] = 10;
	grid[# STAMINA, item.orange] = 5;
	
	//Sprawdzenie typow
	for (var i = 0; i <= item.height; i++){
		if (grid[# TYPE, i] == locals.itemTypeDish){
			grid[# MAXSTACK, i] = 20;
			grid[# LEVEL, i] = 0;
			grid[# DAMAGE, i] = 0;
			grid[# DEFENCE, i] = 0;
		}
		if (grid[# TYPE, i] == locals.itemTypeDrink){
			grid[# MAXSTACK, i] = 20;
			grid[# LEVEL, i] = 0;
			grid[# DAMAGE, i] = 0;
			grid[# DEFENCE, i] = 0;
		}
		if (grid[# TYPE, i] == locals.itemTypeFood){
			grid[# MAXSTACK, i] = 20;
			grid[# LEVEL, i] = 0;
			grid[# DAMAGE, i] = 0;
			grid[# DEFENCE, i] = 0;
		}
		if (grid[# TYPE, i] == locals.itemTypeFruit){
			grid[# MAXSTACK, i] = 20;
			grid[# LEVEL, i] = 0;
			grid[# DAMAGE, i] = 0;
			grid[# DEFENCE, i] = 0;
		}
		if (grid[# TYPE, i] == locals.itemTypeResource){
			grid[# MAXSTACK, i] = 99;
			grid[# HP, i] = 0;
			grid[# STAMINA, i] = 0;
			grid[# LEVEL, i] = 0;
			grid[# DAMAGE, i] = 0;
			grid[# DEFENCE, i] = 0;
		}
		if (grid[# TYPE, i] == locals.itemTypeTool){
			grid[# MAXSTACK, i] = 1;
			grid[# HP, i] = 0;
			grid[# LEVEL, i] = 0;
			grid[# DEFENCE, i] = 0;
		}
		if (grid[# TYPE, i] == locals.itemTypeVegetable){
			grid[# MAXSTACK, i] = 20;
			grid[# LEVEL, i] = 0;
			grid[# DAMAGE, i] = 0;
			grid[# DEFENCE, i] = 0;
		}
		if (grid[# TYPE, i] == locals.itemTypeWeapon){
			grid[# MAXSTACK, i] = 1;
			grid[# HP, i] = 0;
			grid[# DEFENCE, i] = 0;
		}
	}
}