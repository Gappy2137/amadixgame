function sh_rgb(args) {
	obj_daycycle.color[0, 0] = args[1]/255;
	obj_daycycle.color[0, 1] = args[2]/255;
	obj_daycycle.color[0, 2] = args[3]/255;
	
	obj_daycycle.con_sat_brt[0, 0] = args[4];
	obj_daycycle.con_sat_brt[0, 1] = args[5];
	obj_daycycle.con_sat_brt[0, 2] = args[6];
	
	obj_daycycle.con_sat_brt[0, 3] = args[7];
	obj_daycycle.con_sat_brt[0, 4] = args[8];
}

function meta_rgb() {
	return {
		description: "",
		arguments: ["r", "g", "b", "con", "sat", "brt", "str", "tres"],
		hidden: false
	}
}

function sh_set_rot_val(arg) {
	obj_daynightclock.rotval = arg[1];
}

function meta_set_rot_val() {
	return {
		description: "",
		arguments: ["timeSpeed"],
		hidden: false
	}
}
