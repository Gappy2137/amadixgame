//global.daycycletime += 0.00001;
if (global.daycycletime < 0){global.daycycletime = 1;}
if (global.daycycletime > 1){global.daycycletime = 0;}
global.daycycletime = clamp(global.daycycletime, 0, 1);

var time = global.daycycletime;
var hour		= string_format(floor(time * 24), 0, 0);
hour			= (string_length(hour) == 1) ? "0" + hour : hour;
var minute		= string_format(time * 24 * 59.5 mod 59.5, 0, 0);
minute			= (string_length(minute) == 1) ? "0" + minute : minute;

hours = hour;
minutes = minute;

// Alcohol poisoning

if (global.alcoholPoisoning > global.maxAlcoholPoisoning){
	global.alcoholPoisoning = lerp(global.alcoholPoisoning, 0, 0.001);
}else{
	global.alcoholPoisoning = lerp(global.alcoholPoisoning, 0, 0.0001);
}

if (global.alcoholPoisoning >= 10){
	if (!instance_exists(obj_drunkscreen)){
		instance_create_layer(x, y, MAINSCR, obj_drunkscreen);	
	}
}else{
	if (instance_exists(obj_drunkscreen)){
		instance_destroy(obj_drunkscreen);
	}
}

refTimer += 0.01;
if (refTimer >= 1){
	refTimer = 0;	
}

refTimerPi += 0.025;
if (refTimerPi >= 2 * pi){
	refTimerPi = 0;	
}

refTimer10 += 1;
if (refTimer10 > 2){
	refTimer10 = 0;	
}


// Chest
if (instance_exists(par_container)){
	var _p = 0;
	var _temp = 0;
	var _t = 0;
	var i = 0;
	repeat(instance_number(par_container)){
	    _p[i] = instance_find(par_container, i);
		_temp[i] = 0;
		if (_p[i].opened == true){
			_t[i] = 1;	
		}else{
			_t[i] = 0;	
		}
		i++;
	}
	i = 0;
	repeat(array_length(_p)){
		if (_p[i].opened == true){
			global.inChestAnim = true;
		}
		if (array_equals(_t, _temp)){
			global.inChestAnim = false;
		}
		i++;
	}
}
//
if (instance_exists(obj_chatterbox)){
	if (global.inCutscene){
		if (obj_cutscene_controller.chatterboxActive){
			global.inDialogue = true;		
		}else{
			global.inDialogue = false;	
		}
	}else{
		global.inDialogue = true;	
	}
}else{
	global.inDialogue = false;	
}

if (global.inDialogue)
|| (global.inEq)
|| (global.inCutscene)
|| (global.inChest)
|| (global.inConsole){
	global.eqSlots = false;
}else{
	global.eqSlots = true;
}

if ((global.hp) > (global.maxhp)){
	global.hp = global.maxhp;	
}
if global.hp <= 0{
	global.hp = 0;	
}
if global.maxhp <= 1{
	global.maxhp = 1;	
}

if global.stamina > global.maxstamina{
	global.stamina = global.maxstamina;	
}
if global.stamina <= 0{
	global.stamina = 0;	
}
if global.maxstamina <= 1{
	global.maxstamina = 1;	
}