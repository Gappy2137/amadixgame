
if (isbounded(x, camera_get_view_x(view_camera[0]) - INSTANCE_LOAD_DISTANCE, camera_get_view_width(view_camera[0]) + INSTANCE_LOAD_DISTANCE*2))
&& (isbounded(y, camera_get_view_y(view_camera[0]) - INSTANCE_LOAD_DISTANCE/32, camera_get_view_height(view_camera[0]) + INSTANCE_LOAD_DISTANCE*3)){
	notActive = false;
}else{
	notActive = true;	
	angle = 0;
}

// Regeneration logic
if (flag) && (itemRegTime != -1){
	if (timer == 0){
		if (notActive){
			pickedup = false;
			canclick = true;
			itemNum++;
			timer = itemRegTime;
			if (itemNum == 0){
				flag = false;
			}
			if (itemNum > itemNumMax){
				itemNum = itemNumMax;	
				flag = false;	
			}
		}
	}else{
		timer--;	
	}
}

if (notActive){exit;}

if (itemOverlay != -1){
	if (itemNum <= itemNumMax){
		itemOverlayState = itemNum;	
	}else{
		itemOverlayState = itemNumMax;
	}
}

event_inherited();
if (canBeHurtByPlayer){
	if (instance_exists(obj_amadix)){
		var damageSource = instance_place(x, y, obj_damage);

		if (damageSource){
			if (damageSource.source == obj_amadix)
			&& (damageSource.damageType == damageTypeE.melee){
				var amadixFacing = obj_amadix.facing;
				
				if (canBeDestroyedByPlayer){
					event_user(10);
				}
				
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
			hitangle = approach(hitangle, 0, acc);	
		}
	}
}

function canPickup(){
	if instance_exists(obj_amadix){
		if (obj_amadix.actionstate == player_state_action.none){
			if (!global.inDialogue) || (!pickedup){
				return true;
			}
		}else{
			if (instance_exists(obj_gun_logic)){
				if (obj_amadix.actionstate == player_state_action.handgun){
					if ((obj_gun_logic.state == gunState.reloading)
					|| (obj_gun_logic.state == gunState.shooting)
					|| (obj_gun_logic.state == gunState.reloading_empty)){
						if (!global.inDialogue) || (!pickedup){
							return true;
						}
					}else{
						return false;	
					}
				}
			}

		}
	}else{
		return false;	
	}
}

if (canPickup()){
	canClickAt = true;
}else{
	canClickAt = false;
}

if (canClickAt){
if (mouse_over_me(clickRadius)){
	
	if (!pickedup){
		cursorChange = true;
	}else{
		cursorChange = false;
	}

	if (input_check_pressed("mouseRight")) && (!pickedup){
		if (global.cursorSpr == cursorState.pickup){
			if (canclick){
					switch(type){
						case 0:
								if (rotate){isanim = true;}
								if (itemDrop != -1) && (itemDrop != 0) && (itemNum != 0){
									item_add(-1, itemDrop, amount, level, capacity);
									itemNum--;
									flag = true;
								}
						break;
						case 1:
								if (rotate){isanim = true;}
								if (itemDrop != -1) && (itemDrop != 0) && (itemNum != 0){
									item_add(-1, itemDrop, amount, level, capacity);
									itemNum--;
									flag = true;
								}
						break;
						case 2:
								if (rotate){isanim = true;}
								if (itemDrop != -1) && (itemDrop != 0) && (itemNum == itemNumMax){
									item_add(-1, itemDrop, amount, level, capacity);
									itemNum = 0;
									flag = true;
								}
						break;
						case 3:
								if (rotate){isanim = true;}
								if (itemDrop != -1) && (itemDrop != 0) && (itemNum != 0){
									item_add(-1, itemDrop, amount, level, capacity);
									itemNum--;
									flag = true;
								}
						break;
						case 4:
								if (rotate){isanim = true;}
								if (itemDrop != -1) && (itemDrop != 0) && (itemNum == itemNumMax){
									item_add(-1, itemDrop, amount, level, capacity);
									itemNum = 0;
									flag = true;
								}
						break;
						case 5:
							item_add(-1, itemDrop, amount, level, capacity);
							instance_destroy();
						break;
						case 6:
				
							if (canPickup()){
									
								if (itemRegTime != -1){
									flag = true;	
								}
									
								var idrop = itemDrop;
								var im = amount;
								var lvl = level;
								var cap = capacity;
								var idd = id;
				
								with (obj_inventory){
									if (item_exists(item.none, false)){
										with (obj_amadix){
											actionstate = player_state_action.pickup;
											itemeaten = idrop;
											itemamount = im;
											pickupid = idd;
											itemlvl = lvl;
											itemcap = cap;
											oneStepEvent[0] = true;
											oneStepEvent[1] = true;
											anim_frame_action = 0;
											anim_frame = 0;
											moving = false;
											hsp = 0;
											vsp = 0;
											facing = checkFacing(real(idd));
											scr_setPlayerFacingAnim(facing);
											stopEatingTimer = time_source_create(time_source_game, 28, time_source_units_frames, 
											function (){
												event_user(0);	
											}
											, [], 1);
								
											time_source_start(stopEatingTimer);
										}
									}
								}
							canclick = false;
							}


						break;
					}
			}
		}
	}

}else{
	cursorChange = false;	
}
}








//clamp(itemNum, 0, itemNumMax);


/*
en = instance_place(x, y, par_entity);
if (en){
	collision = true;
}else{
	collision = false;	
}
	
if (rotoncol){
	if (collision){
		var left_collision = collision_rectangle(bbox_left, bbox_top, bbox_right - 8, bbox_bottom, en, true, true);
		var right_collision = collision_rectangle(bbox_left + 8, bbox_top, bbox_right, bbox_bottom, en, true, true);
	
		if (left_collision){
			angle = approach(angle, -25, acc);	
		}else if (right_collision){
			angle = approach(angle, 25, acc);
		}else{
			angle = approach(angle, 0, acc);	
		}
	
	}else{
		angle = approach(angle, 0, acc);
	}
}
*/

finalangle = clamp((angle + windangle + angle2 + hitangle), -75, 75);

if (resetAngle){
	angle = approach(angle, 0, acc);
}

// Obrot przy klikaniu
if (rotate){
	event_user(0);	
}

if (pickedup){exit;}

#region Wind Effects

if (enableWind){
	resetAngleTimer--;
	if (resetAngleTimer == 0){
		resetAngleTimer = 10;	
		resetAngle = true;
	}

	windTimer += 0.01 * rnd;
	if (windTimer >= 1){
		windTimer = 0;
	}

	var wnd = global.windStr/100;
	var wndir = global.windDir;
	var tmr = windTimer;

	var curveAsset = curve_wind_anim;
	var curveSpdPos = wnd;



	var curveSpdStruct = animcurve_get(curveAsset);
	var curveSpdChannel = animcurve_get_channel(curveSpdStruct, "spd");

	var curveSpdValue = animcurve_channel_evaluate(curveSpdChannel, curveSpdPos);



	var curveRotPos = tmr;

	var curveRotStruct = animcurve_get(curveAsset);
	var curveRotChannel = animcurve_get_channel(curveRotStruct, "rot");

	var curveRotValue = animcurve_channel_evaluate(curveRotChannel, curveRotPos);



	var curveRot2Pos = tmr;

	var curveRot2Struct = animcurve_get(curveAsset);
	var curveRot2Channel = animcurve_get_channel(curveRot2Struct, "rot2");

	var curveRot2Value = animcurve_channel_evaluate(curveRot2Channel, curveRot2Pos);


	
	if ((wnd*100) > 5){
		anim_speed = curveSpdValue;
	}else{
		anim_speed = 0;	
	}
	
	
	if ((wnd*100) > 10) && ((wnd*100) < 60){
		windangle = approach(windangle, (curveRotValue * (wnd * 50 * wndir)), 1);
	}else if ((wnd*100) >= 60){
		windangle = approach(windangle, (curveRot2Value * (wnd * 50 * wndir)), 1);
	}else{
		windangle = lerp(windangle, 0, 0.1);
	}
		
	if (anim_enable){
		
		anim_frame += anim_speed;
	
		if (anim_frame > anim_frame_num){
			anim_frame = 0;
		}
	
	}
	
}

#endregion



// Potrzas
if (shake){
	if (ami_clicked(clickRadius)){
		if (canclick){
			shakex = random_range(-2, 2);
			shakeflag = true;
		}
	}
	if (shakeflag){
		shaketimer--;	
	}
	if (shaketimer <= 0){
		shaketimer = 15;
		shakex = 0;
		shakeflag = false;
	}
}