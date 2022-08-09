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

timer += 0.01 * rnd;
if (timer >= 1){
	timer = 0;
}

var wnd = global.windStr/100;
var wndir = global.windDir;
var tmr = timer;


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