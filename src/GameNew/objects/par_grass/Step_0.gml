//event_inherited();




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
	
	if ((wnd * 100) > 5){
		anim_speed = curveSpdValue;
	}else{
		anim_speed = 0;	
	}
	
	if ((wnd*100) > 10) && ((wnd*100) < 60){
		
		if (obj_gamecontrol.refTimer2 == 0)
			windangle = lerp(windangle, (curveRotValue * (wnd * 50 * global.windDir)), 1);
		
	}else 
	if ((wnd*100) >= 60){
		
		if (obj_gamecontrol.refTimer2 == 0)
			windangle = lerp(windangle, (curveRot2Value * (wnd * 50 * global.windDir)), 1);
		
	}else{
		
		if (windangle < angleTreshold) && (windangle > -angleTreshold){
			
			windangle = 0;	
			
		}else{
			
			windangle = lerp(windangle, 0, 0.1);
			
		}
		
	}
	
	if (anim_enable){
		anim_frame += anim_speed;
	
		if (anim_frame > anim_frame_num){
			anim_frame = 0;
		}
	}
}



finalangle = angle + windangle + hitangle;

if (finalangle >= 75)
	finalangle = 75;
if (finalangle <= -75)
	finalangle = -75;

resetAngleTimer--;
if (resetAngleTimer == 0){
	resetAngleTimer = 10;	
	resetAngle = true;
}

if (resetAngle){
	if (angle < angleTreshold) && (angle > -angleTreshold){
		angle = 0;	
	}else{
		angle = approach(angle, 0, acc);	
	}
	
	if (hitangle < angleTreshold) && (hitangle > -angleTreshold){
		hitangle = 0;	
	}else{
		hitangle = approach(hitangle, 0, acc);	
	}
}