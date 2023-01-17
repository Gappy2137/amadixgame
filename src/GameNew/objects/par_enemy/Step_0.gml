// Inherit the parent event
event_inherited();

// Detection


var entityXCoord = 0;
var entityYCoord = 0;
					
var myxCoord = bbox_left + ((bbox_right - bbox_left) / 2);
var myyCoord = bbox_top + ((bbox_bottom - bbox_top) / 2);
	
var dist = 1;

if (instance_exists(lookingFor)){
	entityXCoord = lookingFor.bbox_left + ((lookingFor.bbox_right - lookingFor.bbox_left) / 2);
	entityYCoord = lookingFor.bbox_top + ((lookingFor.bbox_bottom - lookingFor.bbox_top) / 2);
					
	myxCoord = bbox_left + ((bbox_right - bbox_left) / 2);
	myyCoord = bbox_top + ((bbox_bottom - bbox_top) / 2);
	
	dist = point_distance(myxCoord, myyCoord, entityXCoord, entityYCoord);
		
}

if (dist <= 0) dist = 1;
	
// If in detection range
if (dist < detectionRange){
			
	if (!detected){
		
		var n = (detectionLines * 2) + 1;
		var _i = 0;
		
		repeat(n){
			
			var fovX = 0;
			var fovY = 0;
			
			if (_i > ((n - 1) / 2)){
				
				fovX = lengthdir_x(detectionRange, facing * (90 - (_i - ((n - 1) / 2)) * detectionSpacing));
				fovY = lengthdir_y(detectionRange, facing * (90 - (_i - ((n - 1) / 2)) * detectionSpacing));
				
			}else{
				
				fovX = lengthdir_x(detectionRange, facing * (90 + _i * detectionSpacing));
				fovY = lengthdir_y(detectionRange, facing * (90 + _i * detectionSpacing));
				
			}
			
			testx[_i] = myxCoord + fovX;
			testy[_i] = myyCoord + fovY;
			
			var col_list = ds_list_create();
			var col_num = collision_line_list(myxCoord, myyCoord, myxCoord + fovX, myyCoord + fovY, par_objectdepth, false, true, col_list, true);
			var col_z = ds_grid_create(2, 1);
			var passList = ds_list_create();

			if (col_num > 0){
		
				var i = 0;
				var nn = ds_list_size(col_list);
			
				ds_grid_resize(col_z, 2, nn);
			
				repeat(nn){
					
					if (col_list[| i] == lookingFor.id){
					
						var j = 0;
					
						repeat(nn){
					
							if ((variable_instance_exists(col_list[| j], "zaxis"))
							&&  (variable_instance_exists(col_list[| j], "zheight"))){
							
								col_z[# 0, j] = col_list[| j].zaxis;
								col_z[# 1, j] = col_list[| j].zheight;
							
							}else{
							
								col_z[# 0, j] = 0;
								col_z[# 1, j] = 0;
							
							}
					
							j++;
					
						}
					
						j = 0;
					
						repeat(i){
						
							if (zaxis + eyeHeight >= col_z[# 0, j] + col_z[# 1, j]){
							
								passList[| j] = 0;
							
							}else{
							
								passList[| j] = 1;
							
							}
						
							j++;
						}
					
						j = 0;
					
						var sum = 0;
					
						repeat(i){
						
							sum += passList[| j];

							j++;
						}
					
						j = 0;
					
						if (sum < 1){
						
							if (dist < 32){
							
								detectionMeter += detectionSpeed * 4;
							
							}else{
							
								if ((variable_instance_exists(lookingFor.id, "spd"))){

									detectionMeter += (( detectionSpeed * detectionSpeedMultiplier ) + ( detectionSpeed / (dist / detectionRange) * 0.175 )) * lookingFor.id.spd;
							
								}else{
						
									detectionMeter += (( detectionSpeed * detectionSpeedMultiplier ) + ( detectionSpeed / (dist / detectionRange) * 0.175 ));
						
								}
							
							}
						

						
						
						
						}
					
					}
					
					i++;
				}
		
			}
		
			ds_list_destroy(col_list);
			ds_list_destroy(passList);
			ds_grid_destroy(col_z);
			
			_i++;
		}
		

		
	}
			
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