event_inherited();

if (global.pause){exit;}

tenalarm++;
if (tenalarm > 10){
	tenalarm = 0;
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


if (keyboard_check_pressed(ord("X"))) && (global.debugMode) && (!global.inConsole){
	game_set_speed(5, gamespeed_fps);	
}
if (keyboard_check_pressed(ord("C"))) && (global.debugMode) && (!global.inConsole){
	game_set_speed(GAMESPEED, gamespeed_fps);	
}
depth = -(bbox_bottom - (sprite_height - yorigin) + zfloor);
