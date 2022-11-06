// Inherit the parent event
event_inherited();

if (defence < 0){
	defence = 0;	
}

var damageSource = instance_place(x, y, obj_damage);

if (damageSource){
	if (damageSource.source == obj_amadix){
		if (canBeHurtByPlayer) && (!hurt){
			hp -= ceil( (damageSource.damage * (1 / (1 + (power(defence, 2) / 1000)))) );
			hurt = true;
		}
	}
}

if (hurt){
	if (invisFrame <= 0){
		invisFrame = invisFrames;	
		hurt = false;
		
		colorBlend = baseColor;
		
	}else{
		invisFrame--;
		
		colorBlend = merge_color(baseColor, hurtColor, (invisFrame / invisFrames / 2));
		
	}
}




if (hp > maxhp){
	hp = maxhp;	
}
if (hp < 0){
	hp = 0;
}

if (hp == 0){instance_destroy();}


	var _list = ds_list_create();
	var _num = instance_place_list(x, y, par_grass, _list, false);
	var _id = id;
	
	if (_num != noone){
		var __i = 0;
		repeat(_num){
			with (_list[| __i]){
				var left_collision = collision_rectangle(bbox_left, bbox_top, bbox_right - (bbox_right-bbox_left)/2, bbox_bottom, _id, false, true);
				var right_collision = collision_rectangle(bbox_left + (bbox_right-bbox_left)/2, bbox_top, bbox_right, bbox_bottom, _id, false, true);
	
				if (left_collision){
					angle = approach(angle, -25, acc);	
				}else if (right_collision){
					angle = approach(angle, 25, acc);
				}else{
					angle = approach(angle, 0, acc);	
				}
		
				resetAngle = false;

			}
			__i++;
		}
		ds_list_destroy(_list);
	}
	
	var _list = ds_list_create();
	var _num = instance_place_list(x, y, par_collectible, _list, false);
	var _id = id;
	
	if (_num != noone){
		var __i = 0;
		repeat(_num){
			if (variable_instance_exists(_list[| __i], "rotoncol")){
				if (_list[| __i].rotoncol == true){
					with (_list[| __i]){
						var left_collision = collision_rectangle(bbox_left, bbox_top, bbox_right - (bbox_right-bbox_left)/2, bbox_bottom, _id, false, true);
						var right_collision = collision_rectangle(bbox_left + (bbox_right-bbox_left)/2, bbox_top, bbox_right, bbox_bottom, _id, false, true);
	
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
			__i++;
		}
		ds_list_destroy(_list);
	}





/*
var grassCollision = instance_place(x, y, par_grass);

if (grassCollision){
	with (grassCollision){
		var left_collision = collision_rectangle(bbox_left, bbox_top, bbox_right - (bbox_right-bbox_left)/2, bbox_bottom, other, false, true);
		var right_collision = collision_rectangle(bbox_left + (bbox_right-bbox_left)/2, bbox_top, bbox_right, bbox_bottom, other, false, true);
	
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
*/

/*
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

*/


var stairs = instance_place(x, y, obj_stairs16);

if (stairs){
	if (running > 0){
		vsp /= 1.25;
	}else{
		vsp /= 1.75;
	}
}


// Ground fx timer
groundFxTimer--;
if (groundFxTimer < 0){
	groundFxTimer = 15;
}
scr_groundtype_fx();


if (object_index != obj_amadix){
	var water = instance_place(x, y, obj_shallowwater16);
	var deepwater = instance_place(x, y, obj_water16);

	if (water){
		if (running > 0){
			vsp /= 1.5;
		}else{
			vsp /= 2;
		}
	}	
	
	

	if (deepwater){
		if (running > 0){
			vsp /= 2.5;
		}else{
			vsp /= 3;
		}
	}	
}