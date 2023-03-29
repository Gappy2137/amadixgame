//event_inherited();

if (canBeHurtByPlayer){
	if (instance_exists(obj_amadix)){
		var damageSource = instance_place(x, y, obj_damage);

		if (damageSource){
			if (damageSource.source == obj_amadix)
			&& (damageSource.damageType == damageTypeE.melee){
				var amadixFacing = obj_amadix.facing;
				
				event_user(10);
				
				switch (amadixFacing){
					case index_facing.down:
						hitangle = approach(hitangle, 25 + rnd*5, acc*2);
					break;
					case index_facing.left:
						hitangle = approach(hitangle, 25 + rnd*5, acc*2);
					break;
					case index_facing.right:
						hitangle = approach(hitangle, -25 - rnd*5, acc*2);
					break;
					case index_facing.up:
						hitangle = approach(hitangle, -25 - rnd*5, acc*2);
					break;
				}
			}
		}else{
			if (hitangle < 1) && (hitangle > -1){
				hitangle = 0;	
			}else{
				hitangle = approach(hitangle, 0, 0.1);	
			}
		}
	}
}
resetAngleTimer--;
if (resetAngleTimer == 0){
	resetAngleTimer = 10;	
	resetAngle = true;
}

timer += 0.01 * rnd;
if (timer >= 1){
	timer = 0;
}

var wnd = global.windStr/100;
var wndir = global.windDir;
var tmr = timer;

var curveSpdValue = 0;
var curveRotValue = 0;
var curveRot2Value = 0;

if (obj_gamecontrol.refTimer2 == 0){

	var curveAsset = curve_wind_anim;
	var curveSpdPos = wnd;



	var curveSpdStruct = animcurve_get(curveAsset);
	var curveSpdChannel = animcurve_get_channel(curveSpdStruct, "spd");

	 curveSpdValue = animcurve_channel_evaluate(curveSpdChannel, curveSpdPos);



	var curveRotPos = tmr;

	var curveRotStruct = animcurve_get(curveAsset);
	var curveRotChannel = animcurve_get_channel(curveRotStruct, "rot");

	 curveRotValue = animcurve_channel_evaluate(curveRotChannel, curveRotPos);



	var curveRot2Pos = tmr;

	var curveRot2Struct = animcurve_get(curveAsset);
	var curveRot2Channel = animcurve_get_channel(curveRot2Struct, "rot2");

	 curveRot2Value = animcurve_channel_evaluate(curveRot2Channel, curveRot2Pos);

}

if (wnd >= 0){
	if (wind_enable)
		isWind = true;
}else{
	isWind = false;
}

if (isWind){
	
	if ((wnd*100) > 5){
		anim_speed = curveSpdValue;
	}else{
		anim_speed = 0;	
	}
	
	if ((wnd*100) > 10) && ((wnd*100) < 60){
		if (obj_gamecontrol.refTimer2 == 0)
			windangle = approach(windangle, (curveRotValue * (wnd * 50 * wndir)), 1);
	}else if ((wnd*100) >= 60){
		if (obj_gamecontrol.refTimer2 == 0)
			windangle = approach(windangle, (curveRot2Value * (wnd * 50 * wndir)), 1);
	}else{
		if (windangle < 1) && (windangle > -1){
			windangle = 0;	
		}else{
			windangle = approach(windangle, 0, 0.1);	
		}
	}
	
	if (anim_enable){
		anim_frame += anim_speed;
	
		if (anim_frame > anim_frame_num){
			anim_frame = 0;
		}
	}
}

finalangle = clamp((angle + windangle + hitangle), -75, 75);

if (resetAngle){
	if (angle < 1) && (angle > -1){
		angle = 0;	
	}else{
		angle = approach(angle, 0, acc);	
	}
}

if (obj_gamecontrol.refTimer2 == 0)
	depth = -(bbox_bottom - (sprite_height - yorigin) + zaxis);