// Inherit the parent event
event_inherited();

var grassCollision = instance_place(x, y, par_grass);

if (grassCollision){
	with (grassCollision){
		var left_collision = collision_rectangle(bbox_left, bbox_top, bbox_right - 8, bbox_bottom, other, false, true);
		var right_collision = collision_rectangle(bbox_left + 8, bbox_top, bbox_right, bbox_bottom, other, false, true);
	
		if (left_collision){
			angle = approach(angle, -25, acc);	
		}else if (right_collision){
			angle = approach(angle, 25, acc);
		}else{
			angle = approach(angle, 0, acc);	
		}
	}
}