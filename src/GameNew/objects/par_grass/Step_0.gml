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

var wnd = global.windStr/100;
var curveRotValue = obj_weather.curveRotValue[randomWindPattern];
var curveRot2Value = obj_weather.curveRot2Value[randomWindPattern];
var curveSpdValue = obj_weather.curveSpdValue;

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
		windangle = approach(windangle, (curveRotValue * (wnd * 50 * global.windDir)), 1);
	}else if ((wnd*100) >= 60){
		windangle = approach(windangle, (curveRot2Value * (wnd * 50 * global.windDir)), 1);
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