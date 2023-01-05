// Inherit the parent event
event_inherited();

// Detection

if (!detected){
	
	if (instance_exists(lookingFor)){
	
		if (point_distance(x, y, lookingFor.x, lookingFor.y) < detectionRange){
			
			var px = lengthdir_x(detectionRange, facing);
			var py = lengthdir_y(detectionRange, facing);
			
			var detLine1 = collision_line_first(x, y, x + px, y + py, lookingFor, false, true);
			
			if (detLine1 == lookingFor){
				
				detectionMeter += detectionSpeed * detectionSpeedMultiplier;
				
			}
			
			
		}
	
	}

	if (detectionMeter >= detectionMeterMax){
		
		detected = true;
		
	}

}

