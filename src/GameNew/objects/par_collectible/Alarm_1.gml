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
				alarm[0] = 28;
			}
		}
	}
canclick = false;
}