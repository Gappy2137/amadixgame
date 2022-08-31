#region rgb
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
#endregion
#region debug mode
function sh_debug(arg) {
	if (real(arg[1]) == 1){
		global.debugMode = true;
	}
	if (real(arg[1]) == 0){
		global.debugMode = false;
	}
}

function meta_debug() {
	return {
		description: "Enables debug mode",
		arguments: ["true/false"],
		hidden: false
	}
}
#endregion
#region time speed
function sh_set_rot_val(arg) {
	obj_daynightclock.rotval = real(arg[1]);
}

function meta_set_rot_val() {
	return {
		description: "Changes time speed",
		arguments: ["timeSpeed"],
		hidden: false
	}
}
#endregion
#region time set
function sh_time_set(args) {
	obj_daynightclock.rotval = ((real(args[1])/24)*360)+((real(args[2])/60)*15);
}

function meta_time_set() {
	return {
		description: "Changes time",
		arguments: ["hour", "minute"],
		hidden: false
	}
}
#endregion
#region give item amount
function sh_give_amount(args) {
	item_add(-1, real(args[1]), real(args[2]), 0, -1);
}

function meta_give_amount() {
	return {
		description: "Gives player the provided item",
		arguments: ["item_id", "amount"],
		hidden: false
	}
}
#endregion
#region give item capacity
function sh_give_cap(args) {
	item_add(-1, real(args[1]), 1, 0, real(args[2]));
}

function meta_give_cap() {
	return {
		description: "Gives player the provided item with capacity",
		arguments: ["item_id", "capacity"],
		hidden: false
	}
}
#endregion
#region cast effect
function sh_cast_effect(args) {
	effect_add(real(args[1]), real(args[2]), real(args[3]));
}

function meta_cast_effect() {
	return {
		description: "Casts provided effect upon the player",
		arguments: ["effect_id", "duration", "amplifier"],
		hidden: false
	}
}
#endregion
#region wind set strength
function sh_wind_set_str(arg) {
	global.windStr = real(arg[1]);
}

function meta_wind_set_str() {
	return {
		description: "Sets wind's strength",
		arguments: ["str"],
		hidden: false
	}
}
#endregion
#region wind set direction
function sh_wind_set_dir(arg) {
	global.windDir = real(arg[1]);
}

function meta_wind_set_dir() {
	return {
		description: "Sets wind's direction (-1 / 1)",
		arguments: ["dir"],
		hidden: false
	}
}
#endregion