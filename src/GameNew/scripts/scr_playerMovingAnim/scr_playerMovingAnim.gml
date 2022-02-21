function scr_playerMovingAnim() {

	if (actionstate == player_state_action.eating) || (actionstate == player_state_action.drinking) || (actionstate == player_state_action.attacking_melee){
		anim_frame_action += anim_speed_action;
		if anim_frame_action > (anim_frame_action_num + .9){
			anim_frame_action = anim_frame_action_num;
		}
	}else{
		anim_frame += anim_speed;
		if anim_frame > anim_frame_num{
			anim_frame = 0;
		}
	}


	if (actionstate == player_state_action.none){
		if (key_right){ 
			scr_setPlayerFacingAnim(index_facing.right);
			facing = dirc.right;
		}
		if (key_left){
			scr_setPlayerFacingAnim(index_facing.left);
			facing = dirc.left;
		}
		if (key_up){
			scr_setPlayerFacingAnim(index_facing.up);
			facing = dirc.up;
		}
		if (key_down){
			scr_setPlayerFacingAnim(index_facing.down);
			facing = dirc.down;
		}
	}




	if ((hsp == 0) && (vsp == 0)){
		scr_setPlayerFacing();
	}


	if obj_gamecontrol.doTransition == false{
		if ((hsp == 0) && (vsp == 0)){
			scr_setPlayerFacing();
		}
	}

	var slippery = collision_rectangle(bbox_left + 4, bbox_bottom, bbox_right - 4, bbox_bottom, obj_ice16, true, true);
	
	if (!moving){
		if (movingfix){
			anim_frame = 1;
			movingfix = false;
		}else{
			anim_frame = 0;
		}
		anim_speed = 0;
	}else{
		movingfix = true;
	}

	if (((key_right) || (key_left) || (key_up) || (key_down)) && (!collision_rectangle(bbox_left - 1, bbox_top - 1, bbox_right + 1, bbox_bottom + 1, par_collision, true, true))){
		if !(anim_fix){
			anim_frame = 1;
			anim_fix = true;
		}
	}


	if (!scr_playerPressingKeys()){
		anim_speed = 0;
		if (!running){
			anim_frame = 0;	
		}
		anim_fix = false;
		scr_setPlayerFacing();
	}
	
	//Naprawa animacji biegania
	if (key_run){
		if (runningfix) && (moving){
			anim_frame = 1;
			anim_speed = 0;
			runningfix = false;
		}
	}else{
		runningfix = true;	
	}

	//Shadow fix
	if (state = player_state.wading) || (state = player_state.swimming) || (state = player_state.swimming_idle) || (state = player_state.wading_idle){
		shadowEnable = false;
	}else{
		shadowEnable = true;	
	}
	
	if (running){
		anim_frame_num = 12;	
	}else{
		anim_frame_num = 4;	
	}
	
	//Z axis
	var zfloorm4 = instance_place(x, y, obj_floor_m4);
	var zfloorm16 = instance_place(x, y, obj_floor_m16);
	var zfloor16 = instance_place(x, y, obj_floor_16);
	
	if (zfloorm4){zfloor = zfloorm4.zflr;}
	else if(zfloorm16){zfloor = zfloorm16.zflr;}
	else if(zfloor16){zfloor = zfloor16.zflr;}
	else{zfloor = 0;}
}
