function item_attrib_grid(){
	var grid = obj_inventory.ds_item_all;
	
	//Nic
	grid[# INVTYPE, item.none] = -1;
	grid[# MAXSTACK, item.none] = 0;
	grid[# INVHP, item.none] = 0;
	grid[# INVSTAMINA, item.none] = 0;
	grid[# INVLEVEL, item.none] = 0;
	grid[# INVDAMAGE, item.none] = 0;
	grid[# INVDEFENCE, item.none] = 0;
	grid[# INVEFFECT1, item.none] = 0;
	grid[# INVEFFECT2, item.none] = 0;
	grid[# INVEFFECT3, item.none] = 0;

	//Jablko
	grid[# INVTYPE, item.apple] = itemtype.fruit;
	grid[# INVHP, item.apple] = 5;
	grid[# INVSTAMINA, item.apple] = 5;
	
	//Wiadro
	grid[# INVTYPE, item.bucket] = itemtype.tool;
	grid[# INVDAMAGE, item.bucket] = 0;
	grid[# INVSTAMINA, item.bucket] = 0;
	
	//Kamien
	grid[# INVTYPE, item.stone] = itemtype.resource;
	
	//Miecz
	grid[# INVTYPE, item.sword] = itemtype.melee;
	grid[# INVSTAMINA, item.sword] = 0;
	grid[# INVLEVEL, item.sword] = 1;
	grid[# INVDAMAGE, item.sword] = 5;
	
	//Byczek
	grid[# INVTYPE, item.bull_energy_drink] = itemtype.drink;
	grid[# INVHP, item.bull_energy_drink] = 5;
	grid[# INVSTAMINA, item.bull_energy_drink] = 25;
	
	//Mangosalsa
	grid[# INVTYPE, item.mango_salsa] = itemtype.dish;
	grid[# INVHP, item.mango_salsa] = 25;
	grid[# INVSTAMINA, item.mango_salsa] = 10;
	
	//Patyk
	grid[# INVTYPE, item.stick] = itemtype.resource;
	
	//Kloda
	grid[# INVTYPE, item.log] = itemtype.resource;
	
	//Gruszka
	grid[# INVTYPE, item.pear] = itemtype.fruit;
	grid[# INVHP, item.pear] = 7;
	grid[# INVSTAMINA, item.pear] = 7;
	
	//Truskawka
	grid[# INVTYPE, item.strawberry] = itemtype.fruit;
	grid[# INVHP, item.strawberry] = 5;
	grid[# INVSTAMINA, item.strawberry] = 5;
	
	//Cytryna
	grid[# INVTYPE, item.lemon] = itemtype.fruit;
	grid[# INVHP, item.lemon] = 5;
	grid[# INVSTAMINA, item.lemon] = 10;
	
	//Pomarancza
	grid[# INVTYPE, item.orange] = itemtype.fruit;
	grid[# INVHP, item.orange] = 10;
	grid[# INVSTAMINA, item.orange] = 5;
	
	//Kurtka amadixa
	grid[# INVTYPE, item.classic_jacket] = itemtype.clothing;
	
	//Jeansy
	grid[# INVTYPE, item.jeans] = itemtype.pants;
	
	//Trampki
	grid[# INVTYPE, item.sneakers] = itemtype.boots;
	
	//Kapelusz maklowicza
	grid[# INVTYPE, item.panama_hat] = itemtype.hat;
	
	//Sprawdzenie typow
	for (var i = 0; i <= item.height; i++){
		if (grid[# INVTYPE, i] == itemtype.dish){
			grid[# MAXSTACK, i] = 20;
			grid[# INVLEVEL, i] = 0;
			grid[# INVDAMAGE, i] = 0;
			grid[# INVDEFENCE, i] = 0;
		}
		if (grid[# INVTYPE, i] == itemtype.drink){
			grid[# MAXSTACK, i] = 20;
			grid[# INVLEVEL, i] = 0;
			grid[# INVDAMAGE, i] = 0;
			grid[# INVDEFENCE, i] = 0;
		}
		if (grid[# INVTYPE, i] == itemtype.food){
			grid[# MAXSTACK, i] = 20;
			grid[# INVLEVEL, i] = 0;
			grid[# INVDAMAGE, i] = 0;
			grid[# INVDEFENCE, i] = 0;
		}
		if (grid[# INVTYPE, i] == itemtype.fruit){
			grid[# MAXSTACK, i] = 20;
			grid[# INVLEVEL, i] = 0;
			grid[# INVDAMAGE, i] = 0;
			grid[# INVDEFENCE, i] = 0;
		}
		if (grid[# INVTYPE, i] == itemtype.resource){
			grid[# MAXSTACK, i] = 99;
			grid[# INVHP, i] = 0;
			grid[# INVSTAMINA, i] = 0;
			grid[# INVLEVEL, i] = 0;
			grid[# INVDAMAGE, i] = 0;
			grid[# INVDEFENCE, i] = 0;
		}
		if (grid[# INVTYPE, i] == itemtype.tool){
			grid[# MAXSTACK, i] = 1;
			grid[# INVHP, i] = 0;
			grid[# INVLEVEL, i] = 0;
			grid[# INVDEFENCE, i] = 0;
		}
		if (grid[# INVTYPE, i] == itemtype.vegetable){
			grid[# MAXSTACK, i] = 20;
			grid[# INVLEVEL, i] = 0;
			grid[# INVDAMAGE, i] = 0;
			grid[# INVDEFENCE, i] = 0;
		}
		if (grid[# INVTYPE, i] == itemtype.melee){
			grid[# MAXSTACK, i] = 1;
			grid[# INVHP, i] = 0;
			grid[# INVDEFENCE, i] = 0;
		}
		if (grid[# INVTYPE, i] == itemtype.clothing){
			grid[# MAXSTACK, i] = 1;
		}
		if (grid[# INVTYPE, i] == itemtype.pants){
			grid[# MAXSTACK, i] = 1;
		}
		if (grid[# INVTYPE, i] == itemtype.boots){
			grid[# MAXSTACK, i] = 1;
		}
		if (grid[# INVTYPE, i] == itemtype.hat){
			grid[# MAXSTACK, i] = 1;
		}
	}
}