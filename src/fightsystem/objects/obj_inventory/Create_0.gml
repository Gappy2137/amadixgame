
enum item{
	sword		= 0,
	bow			= 1,
	gun			= 2,
	food_one	= 3,
	food_two	= 4,
	height		= 5
}

ds_finv = ds_grid_create(2, item.height);

ds_finv[# 0, 0] = item.sword;
ds_finv[# 1, 0] = 1;

ds_finv[# 0, 1] = item.food_one;
ds_finv[# 1, 1] = 4;