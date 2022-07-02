//global.daycycletime += 0.00001;
if global.daycycletime < 0{global.daycycletime = 1;}
if global.daycycletime > 1{global.daycycletime = 0;}
global.daycycletime = clamp(global.daycycletime, 0, 1);

var time = global.daycycletime;
var hour		= string_format(floor(time * 24), 0, 0);
hour			= (string_length(hour) == 1) ? "0" + hour : hour;
var minute		= string_format(time * 24 * 59.5 mod 59.5, 0, 0);
minute			= (string_length(minute) == 1) ? "0" + minute : minute;

hours = hour;
minutes = minute;


if (global.alcoholPoisoning > global.maxAlcoholPoisoning){
	global.alcoholPoisoning = lerp(global.alcoholPoisoning, 0, 0.001);
}else{
	global.alcoholPoisoning = lerp(global.alcoholPoisoning, 0, 0.0001);
}


refTimer += 0.01;
if (refTimer >= 1){
	refTimer = 0;	
}


if (instance_exists(obj_chatterbox)){
	global.inDialogue = true;	
}else{
	global.inDialogue = false;	
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

//instance_deactivate_layer("Instances");
//instance_deactivate_layer("Invisible");



