// Inherit the parent event
event_inherited();

// Detection

if (instance_exists(lookingFor)){
	var entityXCoord = lookingFor.bbox_left + ((lookingFor.bbox_right - lookingFor.bbox_left) / 2);
	var entityYCoord = lookingFor.bbox_top + ((lookingFor.bbox_bottom - lookingFor.bbox_top) / 2);
					
	var myxCoord = bbox_left + ((bbox_right - bbox_left) / 2);
	var myyCoord = bbox_top + ((bbox_bottom - bbox_top) / 2);
	
	var dist = point_distance(myxCoord, myyCoord, entityXCoord, entityYCoord);
	
	if (dist <= 0) dist = 1;
	
}else{
	var entityXCoord = 0;
	var entityYCoord = 0;
					
	var myxCoord = bbox_left + ((bbox_right - bbox_left) / 2);
	var myyCoord = bbox_top + ((bbox_bottom - bbox_top) / 2);
	
	var dist = 1;
}
	
// If in detection range
if (dist < detectionRange){
			
	if (!detected){
		
		var px = lengthdir_x(detectionRange, facing * 90);
		var py = lengthdir_y(detectionRange, facing * 90);
			
		testx = myxCoord + px;
		testy = myyCoord + py;
			
			
		var col_list = ds_list_create();
		var col_num = collision_line_list(myxCoord, myyCoord, myxCoord + px, myyCoord + py, par_objectdepth, false, true, col_list, true);
	
		if (col_num > 0){
		
			var i = 0;
			var nn = ds_list_size(col_list);
			
			repeat(nn){
					
				if (col_list[| i] == lookingFor.id){
					
					var j = 0;
					var n = i;
					
					if (n < 1){
						
						detectionMeter += ( detectionSpeed * detectionSpeedMultiplier ) + ( detectionSpeed / (dist / detectionRange) * 0.175 );
						
					}else{
						
						repeat(n){
					
							if ((variable_instance_exists(col_list[| j], "zaxis"))
							&&  (variable_instance_exists(col_list[| j], "zheight"))){
				
								if (zaxis + eyeHeight >= col_list[| j].zaxis + col_list[| j].zheight){
						
									detectionMeter += ( detectionSpeed * detectionSpeedMultiplier ) + ( detectionSpeed / (dist / detectionRange) * 0.175 );
						
								}
				
							}else{
								
								detectionMeter += ( detectionSpeed * detectionSpeedMultiplier ) + ( detectionSpeed / (dist / detectionRange) * 0.175 );
								
							}
					
							j++;
						}
						
					}
					
				}
					
				i++;
			}
			
			ds_list_destroy(col_list);
		
		}
		
	}
			
	/*
	var detLine1 = collision_line_first(myxCoord, myyCoord, myxCoord + px, myyCoord + py, all, false, true);
	
	if (detLine1){
		
		if (detLine1 == lookingFor){
			
			detectionMeter += ( detectionSpeed * detectionSpeedMultiplier ) + ( detectionSpeed / (dist / detectionRange) * 0.175 );
			
		}
				
	}else{
					
		detectionMeter = lerp(detectionMeter, 0, 0.005);
				
	}
	*/	
			
}else{
		
	detectionMeter = lerp(detectionMeter, 0, 0.01);
		
}

if (detectionMeter >= detectionMeterMax){
	detectionMeter = detectionMeterMax;
	detected = true;
}
if (detectionMeter <= detectionMeterMax / 2){
	detected = false;
}