// Inherit the parent event
event_inherited();

// Detection

if (instance_exists(lookingFor)){
	var entityXCoord = lookingFor.bbox_left + ((lookingFor.bbox_right - lookingFor.bbox_left) / 2);
	var entityYCoord = lookingFor.bbox_top + ((lookingFor.bbox_bottom - lookingFor.bbox_top) / 2);
					
	var myxCoord = bbox_left + ((bbox_right - bbox_left) / 2);
	var myyCoord = bbox_top + ((bbox_bottom - bbox_top) / 2);
	
	var dist = point_distance(myxCoord, myyCoord, entityXCoord, entityYCoord);
	
	if (!dist) dist = 1;
	
}else{
	var entityXCoord = 0;
	var entityYCoord = 0;
					
	var myxCoord = bbox_left + ((bbox_right - bbox_left) / 2);
	var myyCoord = bbox_top + ((bbox_bottom - bbox_top) / 2);
	
	var dist = 0.01;
}
	
// If in detection range
if (dist < detectionRange){
			
	var px = lengthdir_x(detectionRange, facing * 90);
	var py = lengthdir_y(detectionRange, facing * 90);
			
	testx = myxCoord + px;
	testy = myyCoord + py;
			
	var detLine1 = collision_line_first(myxCoord, myyCoord, myxCoord + px, myyCoord + py, lookingFor, false, true);
			
	if (detLine1){
			
		detectionMeter += ( detectionSpeed * detectionSpeedMultiplier ) + ( detectionSpeed / (dist / detectionRange) * 0.15 );
				
	}else{
					
		detectionMeter = lerp(detectionMeter, 0, 0.005);
				
	}
			
			
}else{
		
	detectionMeter = lerp(detectionMeter, 0, 0.01);
		
}

if (detectionMeter >= detectionMeterMax){
	detected = true;
}
if (detectionMeter <= detectionMeterMax / 2){
	detected = false;
}