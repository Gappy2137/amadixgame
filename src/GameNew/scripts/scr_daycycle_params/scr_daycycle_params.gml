function scr_daycycle_params(){
	var grid = obj_daycycle.ds_daycycle_info;
	//var list = obj_daycycle.ds_daycycle_hours;
	#region Weather Sun
	//------------------------------------------
	//00:00
	grid[# 0, 0][| 0] = 127;
	grid[# 0, 0][| 1] = 127;
	grid[# 0, 0][| 2] = 127;
	
	grid[# 0, 0][| 3] = 1.00;
	grid[# 0, 0][| 4] = 1.00;
	grid[# 0, 0][| 5] = -0.00;
	grid[# 0, 0][| 6] = 1.000;
	grid[# 0, 0][| 7] = 1.00;
	//------------------------------------------
	#endregion
}