function scr_daycycle_params(){
	var grid = obj_daycycle.ds_daycycle_info;
	//var list = obj_daycycle.ds_daycycle_hours;
	#region Weather Sun
	//------------------------------------------
	//00:00
	grid[# 0, 0][| 0] = 060.00;
	grid[# 0, 0][| 1] = 120.00;
	grid[# 0, 0][| 2] = 220.00;
	
	grid[# 0, 0][| 3] = 0.30;
	grid[# 0, 0][| 4] = 0.70;
	grid[# 0, 0][| 5] = -0.43;
	grid[# 0, 0][| 6] = 0.50;
	grid[# 0, 0][| 7] = 0.60;
	//------------------------------------------
	#endregion
}