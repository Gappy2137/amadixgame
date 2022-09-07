event_inherited();

tenalarm++;
if (tenalarm > 10){
	tenalarm = 0;
}

//Fizyka i poruszanie
scr_player_movement();

//HP i energia
scr_player_stats();
global.stamina += (stamina_drain * -1);

//Animacja jedzenia i picia
scr_player_action_animation();

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
scr_updateHatY();



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
	game_set_speed(1, gamespeed_fps);	
}
if (keyboard_check_pressed(ord("C"))) && (global.debugMode) && (!global.inConsole){
	game_set_speed(GAMESPEED, gamespeed_fps);	
}
depth = -(bbox_bottom - (sprite_height - yorigin) + zfloor);
