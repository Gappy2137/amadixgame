function recipe_add(ingredients, result, amount, type){
	
	var recipe = ds_map_create();
	recipe[? "result"] = result;
	recipe[? "amount"] = amount;
	
	ds_grid_sort(ingredients, 0, true);
	
	recipe[? "ingredients"] = ingredients;
	
	var i = ds_grid_height(global.recipes);
	
	ds_grid_resize(global.recipes, 2, i + 1);	
	
	ds_grid_add(global.recipes, 0, i - 1, recipe);
	
	global.recipes[# 1, i - 1] = type;
	
}