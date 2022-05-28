event_inherited();
en = instance_place(x, y, par_entity);
if (en){
	collision = true;
}else{
	collision = false;	
}

if (collision){
	var left_collision = collision_rectangle(bbox_left, bbox_top, bbox_right - 8, bbox_bottom, en, true, true);
	var right_collision = collision_rectangle(bbox_left + 8, bbox_top, bbox_right, bbox_bottom, en, true, true);
	
	if (left_collision){
		angle = approach(angle, -25, acc);	
	}else if (right_collision){
		angle = approach(angle, 25, acc);
	}else{
		angle = approach(angle, 0, acc);	
	}
	
}else{
	angle = approach(angle, 0, acc);
}

/*
if (instance_place(x, y, obj_melee_attack)){
	if (chance(0.075)) && (other.image_index < 5){
		instance_destroy();	
	}else{
		angle = approach(angle, -25, acc);
	}
}
*/

timer += 0.01 * rnd;
if (timer >= 1){
	timer = 0;
}

var wnd = global.windStr/100;
var wndir = global.windDir;
var tmr = timer;

var curveAsset = curve_wind_anim;
var curveSpdPos = wnd;



var curveSpdStruct = animcurve_get(curveAsset);
var curveSpdChannel = animcurve_get_channel(curveSpdStruct, "spd");

var curveSpdValue = animcurve_channel_evaluate(curveSpdChannel, curveSpdPos);



var curveRotPos = tmr;

var curveRotStruct = animcurve_get(curveAsset);
var curveRotChannel = animcurve_get_channel(curveRotStruct, "rot");

var curveRotValue = animcurve_channel_evaluate(curveRotChannel, curveRotPos);



var curveRot2Pos = tmr;

var curveRot2Struct = animcurve_get(curveAsset);
var curveRot2Channel = animcurve_get_channel(curveRot2Struct, "rot2");

var curveRot2Value = animcurve_channel_evaluate(curveRot2Channel, curveRot2Pos);


if (wnd >= 0){
	anim_enable = true;
}else{
	anim_enable = false;
}

if (anim_enable){
	
	if ((wnd*100) > 5){
		anim_speed = curveSpdValue;
	}else{
		anim_speed = 0;	
	}
	
	
	if ((wnd*100) > 10) && ((wnd*100) < 60){
		windangle = approach(windangle, (curveRotValue * (wnd * 50 * wndir)), 1);
	}else if ((wnd*100) >= 60){
		windangle = approach(windangle, (curveRot2Value * (wnd * 50 * wndir)), 1);
	}else{
		windangle = lerp(windangle, 0, 0.1);
	}
	
	anim_frame += anim_speed;
	
	if (anim_frame > anim_frame_num){
		anim_frame = 0;
	}
}

finalangle = clamp((angle + windangle), -75, 75);