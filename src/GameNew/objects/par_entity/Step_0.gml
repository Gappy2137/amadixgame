// Inherit the parent event
event_inherited();

if ((hsp != 0) && (vsp != 0)){
	depth = -(bbox_bottom - (sprite_height - yorigin) + zaxis);
}

if (defence < 0){
	defence = 0;	
}

var damageSource = instance_place(x, y, obj_damage);

if (damageSource){
	if (damageSource.source == obj_amadix){
		if (canBeHurtByPlayer) && (!hurt){
			hp -= ceil( (damageSource.damage * (1 / (1 + (power(defence, 2) / 1000)))) );
			hurt = true;
			
			if (damageSource.knockback > 0){
				var amadixXCoord = obj_amadix.bbox_left + ((obj_amadix.bbox_right - obj_amadix.bbox_left) / 2);
				var amadixYCoord = obj_amadix.bbox_top + ((obj_amadix.bbox_bottom - obj_amadix.bbox_top) / 2);
					
				var myxCoord = bbox_left + ((bbox_right - bbox_left) / 2);
				var myyCoord = bbox_top + ((bbox_bottom - bbox_top) / 2);
					
				var dist = point_distance(myxCoord, myyCoord, amadixXCoord, amadixYCoord);
				var dir = point_direction(myxCoord, myyCoord, amadixXCoord, amadixYCoord);
					
				knockbackHsp = -round_to4(lengthdir_x(dist, dir) / (32 / damageSource.knockback));
				knockbackVsp = -round_to4(lengthdir_y(dist, dir) / (32 / damageSource.knockback));
				
			}
		}
	}
}

if !( (knockbackHsp == 0) || (knockbackVsp == 0) ){
	if (knockbackFrame <= 0){
		knockbackFrame = knockbackFrames;	
	}else{
		knockbackFrame--;
	}
}

if (knockbackFrame < knockbackFrames){
	hsp = knockbackHsp;	
	vsp = knockbackVsp;	
}else{
	knockbackHsp = lerp(knockbackHsp, 0, 0.5);
	knockbackVsp = lerp(knockbackVsp, 0, 0.5);		
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


	scr_player_unstuck();
	
	//var hor_collision = instance_place(x + hsp, y, par_collision);
	//var ver_collision = instance_place(x, y + vsp, par_collision);
	
	var hor_list = ds_list_create();
	var hor_num = instance_place_list(x + hsp, y, par_collision, hor_list, false);
	
	if (hor_num != noone){
		var __i = 0;
		repeat(hor_num){
			if (variable_instance_exists(hor_list[| __i], "cancollide")){
								var yplus = 0;

								//can we go above?
								while (instance_place_3d(x + hsp, y - yplus, zaxis, par_collision) && yplus <= abs(hsp)) yplus += 1;
								if ((!instance_place_3d(x + hsp, y - yplus, zaxis, par_collision)) && !(vsp > 0)) {
									//if you can go up, then go up
									y -= yplus;
								} else {
									//we can't go above it   
									//can we go below?
									while (instance_place_3d(x + hsp, y + yplus, zaxis, par_collision) && yplus <= abs(hsp)) yplus += 1;
									if ((!instance_place_3d(x + hsp, y + yplus, zaxis, par_collision)) && !(vsp < 0)) {
									    //if we can go down, then we'll go down
									    y += yplus;
									} else {
									    //we can't go below it
									    //we get as close as we can to the wall and stop
									    while (!instance_place_3d(x + sign(hsp), y, zaxis, par_collision))
									        x += sign(hsp);
									    hsp = 0;
									}
								}
			}
			__i++;
		}
		ds_list_destroy(hor_list);
	}

	if (!hurt)
		x += hsp;	


	var ver_list = ds_list_create();
	var ver_num = instance_place_list(x, y + vsp, par_collision, ver_list, false);
	
	if (ver_num != noone){
		var __i = 0;
		repeat(ver_num){
			if (variable_instance_exists(ver_list[| __i], "cancollide")){
				if (ver_list[| __i].cancollide == true){
								var xplus = 0;

								//can we go to the left?
								while (instance_place_3d(x - xplus, y + vsp, zaxis, par_collision) && xplus <= abs(vsp)) xplus += 1;
								if ((!instance_place_3d(x - xplus, y + vsp, zaxis, par_collision)) && !(hsp > 0)) {
								    //if you can go to the left, then go to the left
								    x -= xplus;
								} else {
								    //we can't go to the left   
								    //can we go to the right?
								    while (instance_place_3d(x + xplus, y + vsp, zaxis, par_collision) && xplus <= abs(vsp)) xplus += 1;
								    if ((!instance_place_3d(x + xplus, y + vsp, zaxis, par_collision)) && !(hsp < 0)) {
								        //if we can go to the right, then we'll go right
								        x += xplus;
								    } else {
								        //we can't go right
								        //we get as close as we can to the wall and stop
								        while (!instance_place_3d(x, y + sign(vsp), zaxis, par_collision))
								            y += sign(vsp);
								        vsp = 0;
								    }
								}
				}
			}
			__i++;
		}
		ds_list_destroy(ver_list);
	}
	if (!hurt)
		y += vsp;	
	
	
	scr_player_unstuck();





if (hp > maxhp){
	hp = maxhp;	
}
if (hp < 0){
	hp = 0;
}

if (hp == 0){event_user(14);}


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
					angle = lerp(angle, -25, acc);	
					resetAngle = false;
				}else if (right_collision){
					angle = lerp(angle, 25, acc);
					resetAngle = false;
				}

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
							angle = lerp(angle, -25, acc);	
						}else if (right_collision){
							angle = lerp(angle, 25, acc);
						}else{
							if (angle < angleTreshold) && (angle > -angleTreshold){
								angle = 0;
							}else{
								angle = lerp(angle, 0, acc);
							}
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