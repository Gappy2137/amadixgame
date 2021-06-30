/*var i_num = instance_number(par_objectdepth);
var depthgrid = ds_depthsort;

if ds_grid_height(ds_depthsort) != i_num{
	ds_grid_resize(depthgrid, 2, i_num);
}

//Dodaje instancje do siatki
var yy = 0;
with(par_objectdepth){
	depthgrid[# 0, yy] = id;
	depthgrid[# 1, yy] = y + yorigin + zaxis;
	yy += 1;
}

//Sortuje instancje po kolei od gory
ds_grid_sort(depthgrid, 1, true);

var ins; yy = 0; repeat(i_num){
	ins = depthgrid[# 0, yy];
	with (ins){
		event_perform(ev_draw, 0);	
	}
	
	yy += 1;
}
*/
var grid = ds_depthsort;
var inst_num = instance_number(par_objectdepth);
ds_grid_resize(grid, 3, inst_num);

var yy = 0; 
with (par_objectdepth){
	grid[# 0, yy] = id;
	grid[# 1, yy] = y + yorigin + zaxis;
	grid[# 2, yy] = x + sprite_get_xoffset(sprite_index);
	yy++;
}

ds_grid_sort(grid, 1, true);

/*
yy = 0;
with (par_objectdepth){
		if (yy > 0){
			if (grid[# 1, yy] == grid[# 1, yy + 1]){
				grid[# 2, yy] = 0;
			}
		}
	yy++;
}
*/

var inst;
yy = 0;
repeat(inst_num){
	inst = grid[# 0, yy];
	with(inst){
		event_perform(ev_draw, 0);		
	}
	
	yy++;
}