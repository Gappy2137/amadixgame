function item_attrib_grid(){
	var grid = obj_inventory.ds_item_all;
	
	//Nic
	grid[# TYPE, item.none] = -1;
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
	grid[# TYPE, item.apple] = itemtype.fruit;
	grid[# HP, item.apple] = 5;
	grid[# STAMINA, item.apple] = 5;
	
	//Wiadro
	grid[# TYPE, item.bucket] = itemtype.tool;
	grid[# DAMAGE, item.bucket] = 0;
	grid[# STAMINA, item.bucket] = 0;
	
	//Kamien
	grid[# TYPE, item.stone] = itemtype.resource;
	
	//Miecz
	grid[# TYPE, item.sword] = itemtype.melee;
	grid[# STAMINA, item.sword] = 0;
	grid[# LEVEL, item.sword] = 1;
	grid[# DAMAGE, item.sword] = 5;
	
	//Byczek
	grid[# TYPE, item.bull_energy_drink] = itemtype.drink;
	grid[# HP, item.bull_energy_drink] = 5;
	grid[# STAMINA, item.bull_energy_drink] = 25;
	
	//Mangosalsa
	grid[# TYPE, item.mango_salsa] = itemtype.dish;
	grid[# HP, item.mango_salsa] = 25;
	grid[# STAMINA, item.mango_salsa] = 10;
	
	//Patyk
	grid[# TYPE, item.stick] = itemtype.resource;
	
	//Kloda
	grid[# TYPE, item.log] = itemtype.resource;
	
	//Gruszka
	grid[# TYPE, item.pear] = itemtype.fruit;
	grid[# HP, item.pear] = 7;
	grid[# STAMINA, item.pear] = 7;
	
	//Truskawka
	grid[# TYPE, item.strawberry] = itemtype.fruit;
	grid[# HP, item.strawberry] = 5;
	grid[# STAMINA, item.strawberry] = 5;
	
	//Cytryna
	grid[# TYPE, item.lemon] = itemtype.fruit;
	grid[# HP, item.lemon] = 5;
	grid[# STAMINA, item.lemon] = 10;
	
	//Pomarancza
	grid[# TYPE, item.orange] = itemtype.fruit;
	grid[# HP, item.orange] = 10;
	grid[# STAMINA, item.orange] = 5;
	
	//Kurtka amadixa
	grid[# TYPE, item.classic_jacket] = itemtype.clothing;
	
	//Jeansy
	grid[# TYPE, item.jeans] = itemtype.pants;
	
	//Trampki
	grid[# TYPE, item.sneakers] = itemtype.boots;
	
	//Kapelusz maklowicza
	grid[# TYPE, item.panama_hat] = itemtype.hat;
	
	//Sprawdzenie typow
	for (var i = 0; i <= item.height; i++){
		if (grid[# TYPE, i] == itemtype.dish){
			grid[# MAXSTACK, i] = 20;
			grid[# LEVEL, i] = 0;
			grid[# DAMAGE, i] = 0;
			grid[# DEFENCE, i] = 0;
		}
		if (grid[# TYPE, i] == itemtype.drink){
			grid[# MAXSTACK, i] = 20;
			grid[# LEVEL, i] = 0;
			grid[# DAMAGE, i] = 0;
			grid[# DEFENCE, i] = 0;
		}
		if (grid[# TYPE, i] == itemtype.food){
			grid[# MAXSTACK, i] = 20;
			grid[# LEVEL, i] = 0;
			grid[# DAMAGE, i] = 0;
			grid[# DEFENCE, i] = 0;
		}
		if (grid[# TYPE, i] == itemtype.fruit){
			grid[# MAXSTACK, i] = 20;
			grid[# LEVEL, i] = 0;
			grid[# DAMAGE, i] = 0;
			grid[# DEFENCE, i] = 0;
		}
		if (grid[# TYPE, i] == itemtype.resource){
			grid[# MAXSTACK, i] = 99;
			grid[# HP, i] = 0;
			grid[# STAMINA, i] = 0;
			grid[# LEVEL, i] = 0;
			grid[# DAMAGE, i] = 0;
			grid[# DEFENCE, i] = 0;
		}
		if (grid[# TYPE, i] == itemtype.tool){
			grid[# MAXSTACK, i] = 1;
			grid[# HP, i] = 0;
			grid[# LEVEL, i] = 0;
			grid[# DEFENCE, i] = 0;
		}
		if (grid[# TYPE, i] == itemtype.vegetable){
			grid[# MAXSTACK, i] = 20;
			grid[# LEVEL, i] = 0;
			grid[# DAMAGE, i] = 0;
			grid[# DEFENCE, i] = 0;
		}
		if (grid[# TYPE, i] == itemtype.melee){
			grid[# MAXSTACK, i] = 1;
			grid[# HP, i] = 0;
			grid[# DEFENCE, i] = 0;
		}
		if (grid[# TYPE, i] == itemtype.clothing){
			grid[# MAXSTACK, i] = 1;
		}
		if (grid[# TYPE, i] == itemtype.pants){
			grid[# MAXSTACK, i] = 1;
		}
		if (grid[# TYPE, i] == itemtype.boots){
			grid[# MAXSTACK, i] = 1;
		}
		if (grid[# TYPE, i] == itemtype.hat){
			grid[# MAXSTACK, i] = 1;
		}
	}
}