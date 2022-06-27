// Inherit the parent event
event_inherited();

var grassCollision = instance_place(x, y, par_grass);

if (grassCollision){
	with (grassCollision){
		var left_collision = collision_rectangle(bbox_left, bbox_top, bbox_right - (sprite_width/2), bbox_bottom, other, false, true);
		var right_collision = collision_rectangle(bbox_left + (sprite_width/2), bbox_top, bbox_right, bbox_bottom, other, false, true);
	
		if (left_collision){
			angle = approach(angle, -25, acc);	
		}else if (right_collision){
			angle = approach(angle, 25, acc);
		}else{
			angle = approach(angle, 0, acc);	
		}
		
		resetAngle = false;

	}
}



var collectibleCollision = instance_place(x, y, par_collectible);

if (collectibleCollision){
	if (collectibleCollision.rotoncol){
		with (collectibleCollision){
			var left_collision = collision_rectangle(bbox_left, bbox_top, bbox_right - (sprite_width/2), bbox_bottom, other, false, true);
			var right_collision = collision_rectangle(bbox_left + (sprite_width/2), bbox_top, bbox_right, bbox_bottom, other, false, true);
	
			if (left_collision){
				angle = approach(angle, -25, acc);	
			}else if (right_collision){
				angle = approach(angle, 25, acc);
			}else{
				angle = approach(angle, 0, acc);	
			}
		
			resetAngle = false;

		}
	}
}




var stairs = instance_place(x, y, obj_stairs16);

if (stairs){
	if (running > 0){
		vsp /= 1.25;
	}else{
		vsp /= 2;
	}
}