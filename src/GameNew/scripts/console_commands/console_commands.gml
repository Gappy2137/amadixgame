#region rgb
function sh_rgb(args) {
	
	obj_daycycle.enableChange = false;
	
	obj_daycycle.color_mix[0] = args[1]/255;
	obj_daycycle.color_mix[1] = args[2]/255;
	obj_daycycle.color_mix[2] = args[3]/255;
	
	obj_daycycle.con_sat_brt_mix[0] = args[4];
	obj_daycycle.con_sat_brt_mix[1] = args[5];
	obj_daycycle.con_sat_brt_mix[2] = args[6];
	
	obj_daycycle.con_sat_brt_mix[3] = args[7];
	obj_daycycle.con_sat_brt_mix[4] = args[8];
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
		arguments: ["1/0"],
		hidden: false
	}
}
#endregion
#region time scale
function sh_timescale(arg) {
	obj_daynightclock.timescale = real(arg[1]);
}

function meta_timescale() {
	return {
		description: "Changes time scale",
		arguments: ["timescale"],
		hidden: false
	}
}
#endregion
#region time set
function sh_time_set(args) {
	obj_daynightclock.rot = ((real(args[1])/24)*360)+((real(args[2])/60)*15);
}

function meta_time_set() {
	return {
		description: "Changes time",
		arguments: ["hour", "minute"],
		hidden: false
	}
}
#endregion
#region time stop
function sh_time_stop() {
	obj_daynightclock.rotval = 0;
}

function meta_time_stop() {
	return {
		description: "Stops time",
		arguments: [],
		hidden: false
	}
}
#endregion
#region time resume
function sh_time_resume() {
	obj_daynightclock.rotval = CLOCKTICK;
}

function meta_time_resume() {
	return {
		description: "Resumes time",
		arguments: [],
		hidden: false
	}
}
#endregion
#region give item amount
function sh_give_amount(args) {
	
	var _item = real(args[1]);
	
	if (_item) >= item.invalid{
		_item = item.invalid;
	}
	item_add(-1, _item, real(args[2]), 0, -1);
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
#region give item
function sh_give_item(args) {
	
	var _item = args[1];
	var _item_str = 0;

	
	switch (_item){
		case "apple": _item_str = item.apple; break;
		case "bucket": _item_str = item.bucket; break;
		case "stone": _item_str = item.stone; break;
		case "sword": _item_str = item.sword; break;
		case "bull_energy_drink": _item_str = item.bull_energy_drink; break;
		case "mango_salsa": _item_str = item.mango_salsa; break;
		case "stick": _item_str = item.stick; break;
		case "log": _item_str = item.log; break;
		case "pear": _item_str = item.pear; break;
		case "strawberry": _item_str = item.strawberry; break;
		case "lemon": _item_str = item.lemon; break;
		case "orange": _item_str = item.orange; break;
		case "classic_jacket": _item_str = item.classic_jacket; break;
		case "jeans": _item_str = item.jeans; break;
		case "sneakers": _item_str = item.sneakers; break;
		case "panama_hat": _item_str = item.panama_hat; break;
		case "m1911": _item_str = item.m1911; break;
		case "m1911mag": _item_str = item.m1911mag; break;
		case "bullet45acp": _item_str = item.bullet45acp; break;
		case "vodka": _item_str = item.vodka; break;
		case "sawedoff": _item_str = item.sawedoff; break;
		case "cat_ears": _item_str = item.cat_ears; break;
		case "dandelion": _item_str = item.dandelion; break;
		default: _item_str = item.invalid; break;
	}
	
	item_add(-1, _item_str, real(args[2]), 0, obj_inventory.ds_item_all[# MAXCAP, _item_str]);
}

function meta_give_item() {
	return {
		description: "Gives player the provided item",
		arguments: ["item_id", "amount"],
		hidden: false
	}
}
#endregion
#region give effect
function sh_give_effect(args) {
	effect_add(real(args[1]), real(args[2]), real(args[3]));
}

function meta_give_effect() {
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
#region health set
function sh_health_set(arg) {
	global.hp = real(arg[1]);
}

function meta_health_set() {
	return {
		description: "Sets player's health",
		arguments: ["health"],
		hidden: false
	}
}
#endregion
#region stamina set
function sh_stamina_set(arg) {
	global.stamina = real(arg[1]);
}

function meta_stamina_set() {
	return {
		description: "Sets player's stamina",
		arguments: ["stamina"],
		hidden: false
	}
}
#endregion
#region sound ambient play
function sh_ambient_play(args) {
	with (obj_audiomanager){triggerFadeOut = true; triggerFadeIn = false;
			newAudio = asset_sound(args[1]);
		}
}

function meta_ambient_play() {
	return {
		description: "",
		arguments: ["asset"],
		hidden: false
	}
}
#endregion
#region sound ambient stop
function sh_ambient_stop(arg) {
	with (obj_audiomanager){alarm[3] = 1;}
}

function meta_ambient_stop() {
	return {
		description: "",
		arguments: ["index"],
		hidden: false
	}
}
#endregion
#region debug bbox
function sh_show_bbox(arg) {
	if (real(arg[1]) == 1){
		global.debugBbox = true;
	}
	if (real(arg[1]) == 0){
		global.debugBbox = false;
	}
}

function meta_show_bbox() {
	return {
		description: "",
		arguments: ["1/0"],
		hidden: false
	}
}
#endregion
#region goto room
function sh_room_enter(arg) {
	room_goto(asset_get_index(arg[1]));
}

function meta_room_enter() {
	return {
		description: "",
		arguments: ["room"],
		hidden: false
	}
}
#endregion
#region weather set
function sh_weather_set(arg) {
	global.prevweather = global.weather;
	global.weather = real(arg[1]);
	obj_weather.wch = true;
	obj_weather.weatherTrigger = true;
	weather_update();
}

function meta_weather_set() {
	return {
		description: "",
		arguments: ["weather"],
		hidden: false
	}
}
#endregion