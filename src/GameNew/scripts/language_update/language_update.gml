function language_update(language){
	

	switch (language){
		case lang.english:
			itemName = load_csv(working_directory + "/language/itemName_en.csv");
			itemDesc = load_csv(working_directory + "/language/itemDesc_en.csv");
			itemType = load_csv(working_directory + "/language/itemType_en.csv");
		break;
		case lang.polish:
			itemName = load_csv(working_directory + "itemName_pl.csv");
			itemDesc = load_csv(working_directory + "itemDesc_pl.csv");
			itemType = load_csv(working_directory + "itemType_pl.csv");
		break;
	}
	

	

	
	
	
	#region itemName
	
	var height = ds_grid_height(itemName);

	repeat(height){
		var i = 0;
		itemNameNone					 = itemName[# 0, i];
	    itemNameApple					 = itemName[# 0, ++i];
		itemNameBucket					 = itemName[# 0, ++i];
		itemNameStone					 = itemName[# 0, ++i];
		itemNameSword					 = itemName[# 0, ++i];
		itemNameBullEnergyDrink			 = itemName[# 0, ++i];
		itemNameMangoSalsa				 = itemName[# 0, ++i];
		itemNameStick					 = itemName[# 0, ++i];
		itemNameLog						 = itemName[# 0, ++i];
		itemNamePear					 = itemName[# 0, ++i];
		itemNameStrawberry				 = itemName[# 0, ++i];
		itemNameLemon					 = itemName[# 0, ++i];
		itemNameOrange					 = itemName[# 0, ++i];
	}
	#endregion
	
	#region itemDesc

	var heightD = ds_grid_height(itemDesc);

	repeat(heightD){
		var i = 0;
		itemDescNone					= itemDesc[# 0, i];
	    itemDescApple					= itemDesc[# 0, ++i];
		itemDescBucket					= itemDesc[# 0, ++i];
		itemDescStone					= itemDesc[# 0, ++i];
		itemDescSword					= itemDesc[# 0, ++i];
		itemDescBullEnergyDrink			= itemDesc[# 0, ++i];
		itemDescMangoSalsa				= itemDesc[# 0, ++i];
		itemDescStick					= itemDesc[# 0, ++i];
		itemDescLog						= itemDesc[# 0, ++i];
		itemDescPear					= itemDesc[# 0, ++i];
		itemDescStrawberry				= itemDesc[# 0, ++i];
		itemDescLemon					= itemDesc[# 0, ++i];
		itemDescOrange					= itemDesc[# 0, ++i];
	
	}
	#endregion
	
	#region itemType

	var heightT = ds_grid_height(itemType);

	repeat(heightT){
		var i = 0;
		itemTypeResource	 = itemType[# 0, i];
	    itemTypeFood		 = itemType[# 0, ++i];
		itemTypeDrink		 = itemType[# 0, ++i];
		itemTypeWeapon		 = itemType[# 0, ++i];
		itemTypeTool		 = itemType[# 0, ++i];
		itemTypeFruit		 = itemType[# 0, ++i];
		itemTypeVegetable	 = itemType[# 0, ++i];
		itemTypeDish		 = itemType[# 0, ++i];
	
	}
	#endregion
}