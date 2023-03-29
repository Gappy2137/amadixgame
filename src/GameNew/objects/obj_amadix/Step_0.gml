event_inherited();

if (global.pause){exit;}

if (keyboard_check(ord("G"))){
	speedEffect -= 0.01;	
}
if (keyboard_check(ord("H"))){
	speedEffect += 0.01;	
}


if (instance_exists(obj_inventory)){
	iteminhand = obj_inventory.ds_inventory[# INVITEM, obj_inventory.mouse_slotx_second];
	iteminhandType = obj_inventory.ds_inventory[# INVTYPE, obj_inventory.mouse_slotx_second];
}
//Fizyka i poruszanie
scr_player_movement();

//HP i energia
scr_player_stats();
global.stamina += (stamina_drain * -1);

//Animacja jedzenia i picia
if (actionstate != player_state_action.none){
	scr_player_action_animation();
}else{
	itemUsedX = 0;
	itemUsedY = 0;
	itemUsedAngle = 0;
	itemUsedSx = 0;
	itemUsedYscale = 1;	
	if (instance_exists(meleeID)){instance_destroy(meleeID);}
	if (instance_exists(dmgID)){instance_destroy(dmgID);}
}

//Przejscie do innego pokoju
var rm_trans = instance_place(x, y, obj_room_transition);
if (rm_trans != noone){
	with (obj_gamecontrol){
		if (!doTransition){
			if (instance_exists(obj_amadix)){
				newRoom = rm_trans.targetRoom;	
				newX = rm_trans.targetX;
				newY = rm_trans.targetY;
				doTransition = true;
				oldfacing = obj_amadix.facing;
				oldrunning = obj_amadix.running;
			}
			
		}
	}
}

// Hurt
if (hurt){
	if (invisFrame <= 0){
		invisFrame = invisFrames;	
		hurt = false;
	}else{
		invisFrame--;
	}
}


// Kontrola cutscenek

var _scene = instance_place(x, y, obj_cutscene_trigger);

if (_scene){
	if (_scene.active){
		_scene.active = false;
		_scene.triggered = true;
		_scene._trigNow = true;
	}
}

// Pozycja czapki
if (hat_index != spr_item_none){
	scr_updateHatY();
}

// Chodzenie z bronia biala
scr_player_melee_walk();



// Crafting stations

var craftCollision = instance_place(x, y, obj_crafting_station);

if (craftCollision){
	crafting_station = craftCollision.stationType;
}else{
	crafting_station = craftingStation.none;
}

// Water ripples
if (state == player_state.wading)
|| (state == player_state.wading_idle)
|| (state == player_state.swimming)
|| (state == player_state.swimming_idle){
	
	if (obj_gamecontrol.refTimer == 0.3)
	|| (obj_gamecontrol.refTimer == 0.9){
		if (chance(80)){
			instance_create_layer(x, y + 31, "Instances", obj_water_ripple);
		}
	}

	
}


// Cienie
if (running != 2){
	if (floor(anim_frame) == 0){shadowSizeX = 0; shadowSizeY = 0;}
	if (floor(anim_frame) == 1){shadowSizeX = 0; shadowSizeY = 0;}
	if (floor(anim_frame) == 2){shadowSizeX = 0; shadowSizeY = 0;}
	if (floor(anim_frame) == 3){shadowSizeX = 0; shadowSizeY = 0;}
}else{
	if (floor(anim_frame) == 0){shadowSizeX = 0; shadowSizeY = 0;}
	if (floor(anim_frame) == 1){shadowSizeX = 1; shadowSizeY = 1;}
	if (floor(anim_frame) == 2){shadowSizeX = 2; shadowSizeY = 2;}
	if (floor(anim_frame) == 3){shadowSizeX = 2; shadowSizeY = 2;}
	if (floor(anim_frame) == 4){shadowSizeX = 2; shadowSizeY = 2;}
	if (floor(anim_frame) == 5){shadowSizeX = 1; shadowSizeY = 1;}
	if (floor(anim_frame) == 6){shadowSizeX = 0; shadowSizeY = 0;}
	if (floor(anim_frame) == 7){shadowSizeX = 1; shadowSizeY = 1;}
	if (floor(anim_frame) == 8){shadowSizeX = 2; shadowSizeY = 2;}
	if (floor(anim_frame) == 9){shadowSizeX = 2; shadowSizeY = 2;}
	if (floor(anim_frame) == 10){shadowSizeX = 2; shadowSizeY = 2;}
	if (floor(anim_frame) == 11){shadowSizeX = 1; shadowSizeY = 1;}
}
if (actionstate = player_state_action.handgun){
	oneStepEvent[2] = 2;
}else{
	if (oneStepEvent[2] > 0) oneStepEvent[2]--;
}

if (oneStepEvent[2] == 2){
	switch(facing){
		case index_facing.down:
			scr_setPlayerFacingAnim(index_facing.down);
		break;
		case index_facing.left:
			scr_setPlayerFacingAnim(index_facing.left);
		break;
		case index_facing.right:
			scr_setPlayerFacingAnim(index_facing.right);
		break;
		case index_facing.up:
			scr_setPlayerFacingAnim(index_facing.up);
		break;
	}
}

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
					if (angle < 2) && (angle > -2){
						angle = 0;	
					}else{
						angle = approach(angle, 0, acc);	
					}	
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
							if (angle < 2) && (angle > -2){
								angle = 0;	
							}else{
								angle = approach(angle, 0, acc);	
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

if (keyboard_check_pressed(ord("X"))) && (global.debugMode) && (!global.inConsole){
	game_set_speed(5, gamespeed_fps);	
}
if (keyboard_check_pressed(ord("C"))) && (global.debugMode) && (!global.inConsole){
	game_set_speed(GAMESPEED, gamespeed_fps);	
}


depth = -(bbox_bottom - (sprite_height - yorigin) + zaxis);