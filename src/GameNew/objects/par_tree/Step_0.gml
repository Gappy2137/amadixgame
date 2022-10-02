event_inherited();

if (ami_clicked(4)){
	if (canclick){
		isanim = true;
		if (itemDrop != -1) && (itemDrop != 0) && (itemNum != 0){
			item_drop(itemDrop, 1, 0, -1, false, x + choose(-16, 16, 8, -8), y - 32 + choose(4, -4, 8, 0), 40 + choose(4, -4, 8, 0));
			itemNum--;
			flag = true;
		}
	}
}

if (flag) && (itemRegTime != -1){
	timer--;
	if (timer == 0){
		itemNum++;
		timer = itemRegTime;
		if (itemNum == 0){
			flag = false;
		}
		if (itemNum > itemNumMax){
			itemNum = itemNumMax;	
			flag = false;	
		}
	}
}

if (itemOverlay != -1){
	if (itemNum <= 3){
		itemOverlayState = itemNum;	
	}else{
		itemOverlayState = 3;
	}
}

if (itemNum > itemNumMax){
	itemNum = itemNumMax;	
}

windtimer += 0.01 * rnd;
if (windtimer >= 1){
	windtimer = 0;
}

var wnd = global.windStr/100;
var wndir = global.windDir;
var tmr = windtimer;


var curveAsset = curve_wind_anim;

var curveRotPos = tmr;

var curveRotStruct = animcurve_get(curveAsset);
var curveRotChannel = animcurve_get_channel(curveRotStruct, "rot");

var curveRotValue = animcurve_channel_evaluate(curveRotChannel, curveRotPos);



var curveRot2Pos = tmr;

var curveRot2Struct = animcurve_get(curveAsset);
var curveRot2Channel = animcurve_get_channel(curveRot2Struct, "rot2");

var curveRot2Value = animcurve_channel_evaluate(curveRot2Channel, curveRot2Pos);


if ((wnd*100) > 10) && ((wnd*100) < 60){
	windangle = approach(windangle, (curveRotValue * (wnd * (1/(treeSize - .2)) *  wndir)), 1);
}else if ((wnd*100) >= 60){
	windangle = approach(windangle, (curveRot2Value * (wnd * (1/(treeSize - .2)) * wndir)), 1);
}else{
	windangle = lerp(windangle, 0, 0.1);
}

event_user(0);

finalangle = clamp((angle + windangle), -15, 15);

//
if (object_index != obj_hazel_bush)
&& (object_index != obj_oak_2_bark)
&& (object_index != obj_birch_small)
&& (object_index != obj_lilac_bush){
	var col = collision_rectangle(
		x - sprite_get_xoffset(sprite_index) - 4,
		bbox_top - sprite_get_bbox_top(sprite_index) + 4,
		x + sprite_get_xoffset(sprite_index) + 4,
		bbox_top + 1,
		obj_amadix, false, false
	);
	
	if (col){
		alpha = approach(alpha, 0.5, 0.05);	
	}else{
		if (alpha != 1){
			alpha = approach(alpha, 1, 0.05);		
		}
	}
}