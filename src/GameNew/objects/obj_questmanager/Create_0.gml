
global.quests = ds_grid_create(2, 1);

enum questType {
	main = 0,
	side = 1,
	failed = 2,
	done = 3
}