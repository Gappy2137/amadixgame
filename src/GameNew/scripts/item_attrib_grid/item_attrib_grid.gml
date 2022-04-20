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
	grid[# INVEFFECTS, item.none] = 0;
	grid[# INVTEMPERATURE, item.none] = 0;

	//Jablko
	grid[# INVTYPE, item.apple] = itemtype.fruit;
	grid[# INVHP, item.apple] = 5;
	grid[# INVSTAMINA, item.apple] = 5;
	grid[# INVTEMPERATURE, item.apple] = 5;
	
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
	grid[# INVTEMPERATURE, item.bull_energy_drink] = 0;
	var effect_1 = ds_grid_create(3, 2);
	effect_1[# EF_EFFECT, 0] = effect.speed_ef;
	effect_1[# EF_DURATION, 0] = 75;
	effect_1[# EF_AMPLIFIER, 0] = 1;
	effect_1[# EF_EFFECT, 1] = effect.stuffed;
	effect_1[# EF_DURATION, 1] = 5;
	effect_1[# EF_AMPLIFIER, 1] = 1;
	grid[# INVEFFECTS, item.bull_energy_drink] = effect_1;
	
	//Mangosalsa
	grid[# INVTYPE, item.mango_salsa] = itemtype.dish;
	grid[# INVHP, item.mango_salsa] = 25;
	grid[# INVSTAMINA, item.mango_salsa] = 10;
	grid[# INVTEMPERATURE, item.mango_salsa] = 0;
	
	//Patyk
	grid[# INVTYPE, item.stick] = itemtype.resource;
	
	//Kloda
	grid[# INVTYPE, item.log] = itemtype.resource;
	
	//Gruszka
	grid[# INVTYPE, item.pear] = itemtype.fruit;
	grid[# INVHP, item.pear] = 7;
	grid[# INVSTAMINA, item.pear] = 7;
	grid[# INVTEMPERATURE, item.pear] = 0;
	
	//Truskawka
	grid[# INVTYPE, item.strawberry] = itemtype.fruit;
	grid[# INVHP, item.strawberry] = 5;
	grid[# INVSTAMINA, item.strawberry] = 5;
	grid[# INVTEMPERATURE, item.strawberry] = 0;
	
	//Cytryna
	grid[# INVTYPE, item.lemon] = itemtype.fruit;
	grid[# INVHP, item.lemon] = 5;
	grid[# INVSTAMINA, item.lemon] = 10;
	grid[# INVTEMPERATURE, item.lemon] = 0;
	
	//Pomarancza
	grid[# INVTYPE, item.orange] = itemtype.fruit;
	grid[# INVHP, item.orange] = 10;
	grid[# INVSTAMINA, item.orange] = 5;
	grid[# INVTEMPERATURE, item.orange] = 0;
	
	//Kurtka amadixa
	grid[# INVTYPE, item.classic_jacket] = itemtype.clothing;
	grid[# INVTEMPERATURE, item.classic_jacket] = 0;
	grid[# INVDEFENCE, item.classic_jacket] = 2;
	
	//Jeansy
	grid[# INVTYPE, item.jeans] = itemtype.pants;
	grid[# INVTEMPERATURE, item.jeans] = 0;
	grid[# INVDEFENCE, item.jeans] = 1;
	
	//Trampki
	grid[# INVTYPE, item.sneakers] = itemtype.boots;
	grid[# INVTEMPERATURE, item.sneakers] = 0;
	grid[# INVDEFENCE, item.sneakers] = 1;
	
	//Kapelusz maklowicza
	grid[# INVTYPE, item.panama_hat] = itemtype.hat;
	grid[# INVTEMPERATURE, item.panama_hat] = 0;
	grid[# INVDEFENCE, item.panama_hat] = 0;
	
	//M1911
	grid[# INVTYPE, item.m1911] = itemtype.handgun;
	
	//Wodka
	grid[# INVTYPE, item.vodka] = itemtype.alcohol;
	grid[# INVHP, item.vodka] = 5;
	grid[# INVSTAMINA, item.vodka] = 25;
	grid[# INVLEVEL, item.vodka] = 5;
	
	//Sprawdzenie typow
	for (var i = 0; i <= item.height; i++){
		if (grid[# INVTYPE, i] == itemtype.dish){
			grid[# MAXSTACK, i] = 20;
			grid[# INVLEVEL, i] = 0;
			grid[# INVDAMAGE, i] = 0;
			grid[# INVDEFENCE, i] = 0;
		}
		if (grid[# INVTYPE, i] == itemtype.drink){
			grid[# MAXSTACK, i] = 5;
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
			grid[# INVTEMPERATURE, i] = 0;
		}
		if (grid[# INVTYPE, i] == itemtype.tool){
			grid[# MAXSTACK, i] = 1;
			grid[# INVHP, i] = 0;
			grid[# INVLEVEL, i] = 0;
			grid[# INVDEFENCE, i] = 0;
			grid[# INVTEMPERATURE, i] = 0;
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
			grid[# INVTEMPERATURE, i] = 0;
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
		if (grid[# INVTYPE, i] == itemtype.handgun){
			grid[# MAXSTACK, i] = 1;
		}
		if (grid[# INVTYPE, i] == itemtype.alcohol){
			grid[# MAXSTACK, i] = 5;
			grid[# INVDAMAGE, i] = 0;
			grid[# INVDEFENCE, i] = 0;
		}
	}
	
	//Overrides
	
	//M1911 mag
	grid[# INVTYPE, item.m1911mag] = itemtype.magazine;
	grid[# MAXSTACK, item.m1911mag] = 1;
	grid[# INVLEVEL, item.m1911mag] = 7;
	
	//45acp
	grid[# INVTYPE, item.bullet45acp] = itemtype.resource;
	grid[# MAXSTACK, item.bullet45acp] = 20;
}