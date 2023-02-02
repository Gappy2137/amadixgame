function recipe_add(ingredients, result, type, station){
	
	var i = ds_grid_height(global.recipes);
	
	ds_grid_resize(global.recipes, 4, i + 1);
	
	global.recipes[# C_ING, i] = ingredients;
	
	global.recipes[# C_RES, i] = result;
	
	global.recipes[# C_TYPE, i] = type;
	
	global.recipes[# C_STATION, i] = station;
	
	ds_grid_sort(global.recipes, C_TYPE, true);
	
}