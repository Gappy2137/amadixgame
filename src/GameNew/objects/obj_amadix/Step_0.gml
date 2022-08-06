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
		case dirc.down:
			scr_setPlayerFacingAnim(index_facing.down);
		break;
		case dirc.left:
			scr_setPlayerFacingAnim(index_facing.left);
		break;
		case dirc.right:
			scr_setPlayerFacingAnim(index_facing.right);
		break;
		case dirc.up:
			scr_setPlayerFacingAnim(index_facing.up);
		break;
	}
}

if (keyboard_check_pressed(vk_space)){
	item_add(-1, item.apple, 1, 0, -1);
}
if (keyboard_check_pressed(vk_enter)){
	//item_add(-1, item.m1911, 1, 0, -1);
	item_add(-1, item.apple, 22, 0, -1);
}
if (keyboard_check_pressed(ord("X"))){
	room_speed = 5;	
}
if (keyboard_check_pressed(ord("C"))){
	room_speed = 60;	
}
if (keyboard_check(ord("O"))){
	global.stamina -= 0.1;
}
if (keyboard_check(ord("P"))){
	global.stamina += 0.1;
}

depth = -(bbox_bottom - (sprite_height - yorigin) + zfloor);
