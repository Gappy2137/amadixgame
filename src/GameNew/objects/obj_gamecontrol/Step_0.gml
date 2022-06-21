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

instance_deactivate_layer("Instances");
instance_activate_object(obj_amadix);

instance_activate_region(
camera_get_view_x(view_camera[0]),
camera_get_view_y(view_camera[0]),
camera_get_view_width(view_camera[0]),
camera_get_view_height(view_camera[0]),
true
);
