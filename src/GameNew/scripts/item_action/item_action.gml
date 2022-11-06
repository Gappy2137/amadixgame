function item_action(){
	var amount =		obj_inventory.ds_inventory[# INVAMOUNT, obj_inventory.mouse_slotx_second];
	var type =			obj_inventory.ds_inventory[# INVTYPE, obj_inventory.mouse_slotx_second];
	var hp =			obj_inventory.ds_inventory[# INVHP, obj_inventory.mouse_slotx_second];
	var stamina =		obj_inventory.ds_inventory[# INVSTAMINA, obj_inventory.mouse_slotx_second];
	var level =			obj_inventory.ds_inventory[# INVLEVEL, obj_inventory.mouse_slotx_second];
	var damage =		obj_inventory.ds_inventory[# INVDAMAGE, obj_inventory.mouse_slotx_second];
	var defence =		obj_inventory.ds_inventory[# INVDEFENCE, obj_inventory.mouse_slotx_second];
	var effects =		obj_inventory.ds_inventory[# INVEFFECTS, obj_inventory.mouse_slotx_second];
	var cap		=		obj_inventory.ds_inventory[# INVCAP, obj_inventory.mouse_slotx_second];
	
	if (instance_exists(obj_amadix)){
		

	function canUseConsume() {
		
		if (obj_amadix.state != player_state.swimming)
		&& (obj_amadix.state != player_state.swimming_idle)
		&& (obj_amadix.state != player_state.hurt)
		&& (obj_amadix.state != player_state.ladder)
		&& (global.cursorSpr != cursorState.dialogue)
		&& (global.cursorSpr != cursorState.pickup)
		&& (!obj_amadix.skid)
		&& (!obj_amadix.stuffed)
		{
			return true;	
		}else{
			return false;
		}
	}
	
		
	function itemActionGun(){
		if (obj_amadix.state == player_state.idle)
		|| (obj_amadix.state == player_state.moving) 
		|| (obj_amadix.state == player_state.wading_idle) 
		|| (obj_amadix.state == player_state.wading){
			var amount =		obj_inventory.ds_inventory[# INVAMOUNT, obj_inventory.mouse_slotx_second];
			var type =			obj_inventory.ds_inventory[# INVTYPE, obj_inventory.mouse_slotx_second];
			var face = 0;
			if (amount > 0){
					var iitem = obj_inventory.ds_inventory[# INVITEM, obj_inventory.mouse_slotx_second];
					with (obj_amadix){
						itemeaten = iitem;
						actionstate = player_state_action.handgun;
						
						if (running != 2){
							if isLooking(index_facing.up){
								face = index_facing.up;
							}else
							if isLooking(index_facing.left){
								face = index_facing.left;
							}else
							if isLooking(index_facing.down){
								face = index_facing.down;
							}else{
								face = index_facing.right;
							}
						}else{
							face = facing;	
						}
						if (actionstate != player_state_action.pickup)
							scr_setPlayerFacingAnim(face);
					}
			}else{
				slot_remove(obj_inventory.mouse_slotx_second);
				obj_inventory.text_alpha = 0;
			}
		}
	}
	
	function itemActionNone(){
		if (obj_amadix.actionstate != player_state_action.pickup){
			with (obj_amadix){actionstate = player_state_action.none;}
				with(obj_amadix){
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
				}
		}

	}
	
	function itemActionEat(){
		
		if (obj_amadix.state != player_state.swimming)
		&& (obj_amadix.state != player_state.swimming_idle)
		&& (global.cursorSpr != cursorState.dialogue)
		&& (global.cursorSpr != cursorState.pickup)
		&& (!obj_amadix.skid)
		&& (!obj_amadix.stuffed)
		&& (
			   (obj_amadix.state == player_state.idle)
			|| (obj_amadix.state == player_state.moving) 
			|| (obj_amadix.state == player_state.wading_idle) 
			|| (obj_amadix.state == player_state.wading)
		){
			var amount =		obj_inventory.ds_inventory[# INVAMOUNT, obj_inventory.mouse_slotx_second];
			var hp =			obj_inventory.ds_inventory[# INVHP, obj_inventory.mouse_slotx_second];
			var stamina =		obj_inventory.ds_inventory[# INVSTAMINA, obj_inventory.mouse_slotx_second];
			var type =			obj_inventory.ds_inventory[# INVTYPE, obj_inventory.mouse_slotx_second];
	
					if (amount > 0){
						if (obj_amadix.actionstate != player_state_action.eating){
							var iitem = obj_inventory.ds_inventory[# INVITEM, obj_inventory.mouse_slotx_second];
							with (obj_amadix){
								oneStepEvent[0] = true;
								itemeaten = iitem;
								actionstate = player_state_action.eating;
								anim_frame_action = 0;
								anim_speed_action = 0.12;
								anim_frame = 0;
								moving = false;
								running = false;
								hsp = 0;
								vsp = 0;
								facing = index_facing.down;
								scr_setPlayerFacingAnim(index_facing.down);
								
								stopEatingTimer = time_source_create(time_source_game, 55, time_source_units_frames, 
								function (){
									event_user(0);	
								}
								, [], 1);
								
								time_source_start(stopEatingTimer);
								
							}
							if (hp > 0){global.hp += hp;}
							if (stamina > 0){global.stamina += stamina;}
						}
					}else{
						obj_inventory.text_alpha = 0;
					}
		}
	}
	
	function itemActionDrink(){
		
		if (obj_amadix.state != player_state.swimming)
		&& (obj_amadix.state != player_state.swimming_idle)
		&& (global.cursorSpr != cursorState.dialogue)
		&& (global.cursorSpr != cursorState.pickup)
		&& (!obj_amadix.skid)
		&& (!obj_amadix.stuffed)
		&& (
			   (obj_amadix.state == player_state.idle)
			|| (obj_amadix.state == player_state.moving) 
			|| (obj_amadix.state == player_state.wading_idle) 
			|| (obj_amadix.state == player_state.wading)
		){
			var amount =		obj_inventory.ds_inventory[# INVAMOUNT, obj_inventory.mouse_slotx_second];
			var hp =			obj_inventory.ds_inventory[# INVHP, obj_inventory.mouse_slotx_second];
			var stamina =		obj_inventory.ds_inventory[# INVSTAMINA, obj_inventory.mouse_slotx_second];
			var level =			obj_inventory.ds_inventory[# INVLEVEL, obj_inventory.mouse_slotx_second];
			var type =			obj_inventory.ds_inventory[# INVTYPE, obj_inventory.mouse_slotx_second];
			var cap =			obj_inventory.ds_inventory[# INVCAP, obj_inventory.mouse_slotx_second];
			
				if ((amount > 0) && ((type != itemtype.drink) && (type != itemtype.alcohol)))
				|| ((cap > 0) && ((type == itemtype.drink) || (type == itemtype.alcohol))){
					if (obj_amadix.actionstate != player_state_action.drinking){
						var iitem = obj_inventory.ds_inventory[# INVITEM, obj_inventory.mouse_slotx_second];
						with (obj_amadix){
							itemeaten = iitem;
							actionstate = player_state_action.drinking;
							anim_frame_action = 0;
							anim_speed_action = 0.16;
							anim_frame = 0;
							running = false;
							hsp = 0;
							vsp = 0;
							facing = index_facing.down;
							scr_setPlayerFacingAnim(index_facing.down);
							
							stopEatingTimer = time_source_create(time_source_game, 55, time_source_units_frames, 
							function (){
								event_user(0);	
								if (iteminhandType == itemtype.alcohol){
									global.alcoholPoisoning += alcohol_read_power(iteminhand);
								}
							}
							, [type, iitem], 1);
								
							time_source_start(stopEatingTimer);
							
						}
						if (hp > 0){global.hp += hp;}
						if (stamina > 0){global.stamina += stamina;}
					}
				}else{
					if ((type != itemtype.drink) && (type != itemtype.alcohol)){
						slot_remove(obj_inventory.mouse_slotx_second);
						obj_inventory.text_alpha = 0;
					}
				}
		}
	}
	
	function itemActionSword(){
		
		if (obj_amadix.state == player_state.idle)
		|| (obj_amadix.state == player_state.moving) 
		|| (obj_amadix.state == player_state.wading_idle) 
		|| (obj_amadix.state == player_state.wading){
			var amount =		obj_inventory.ds_inventory[# INVAMOUNT, obj_inventory.mouse_slotx_second];
			var spd =			obj_inventory.ds_inventory[# INVDEFENCE, obj_inventory.mouse_slotx_second];
			var type =			obj_inventory.ds_inventory[# INVTYPE, obj_inventory.mouse_slotx_second];
			if (amount > 0){
				if (obj_amadix.actionstate != player_state_action.attacking_melee){
					var iitem = obj_inventory.ds_inventory[# INVITEM, obj_inventory.mouse_slotx_second];
					with (obj_amadix){
						running = 0;
						skid = false;
						skidTimer = skidTime;
						oneStepEvent[0] = true;
						oneStepEvent[1] = true;
						itemeaten = iitem;
						actionstate = player_state_action.attacking_melee;
						anim_frame_action = 0;
						anim_speed_action = spd;
						anim_frame = 0;
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
				}
			}else{
				slot_remove(obj_inventory.mouse_slotx_second);
				obj_inventory.text_alpha = 0;
			}
		}
		

			
	}
	




	if (!inslots){
		
		
		switch(type){
			case itemtype.handgun:
				if (!global.inDialogue)
				&& (!global.inCutscene){
					itemActionGun();
				}else{
					itemActionNone();	
				}
			break;
			case itemtype.shotgun:
				if (!global.inDialogue)
				&& (!global.inCutscene){
					itemActionGun();
				}else{
					itemActionNone();	
				}
			break;
			case itemtype.magazine:
				itemActionNone();
			break;
			case itemtype.food:
				if (mouse_check_button_pressed(mb_right)){
						itemActionEat();
				}else{
					if (obj_amadix.actionstate != player_state_action.eating)
					itemActionNone();
				}
			break;
			case itemtype.dish:
				if (mouse_check_button_pressed(mb_right)){
						itemActionEat();
				}else{
					if (obj_amadix.actionstate != player_state_action.eating)
					itemActionNone();
				}
			break;
			case itemtype.fruit:
				if (mouse_check_button_pressed(mb_right)){
						itemActionEat();
				}else{
					if (obj_amadix.actionstate != player_state_action.eating)
					itemActionNone();
				}
			break;
			case itemtype.vegetable:
				if (mouse_check_button_pressed(mb_right)){
						itemActionEat();
				}else{
					if (obj_amadix.actionstate != player_state_action.eating)
					itemActionNone();
				}
			break;
			case itemtype.drink:
				if (mouse_check_button_pressed(mb_right)){
						itemActionDrink();
				}else{
					if (obj_amadix.actionstate != player_state_action.drinking)
					itemActionNone();
				}
			break;
			case itemtype.alcohol:
				if (mouse_check_button_pressed(mb_right)){
						itemActionDrink();
				}else{
					if (obj_amadix.actionstate != player_state_action.drinking)
					itemActionNone();
				}
			break;
			case itemtype.resource:
				if (obj_inventory.ds_inventory[# INVITEM, obj_inventory.mouse_slotx_second] == item.stick){
					if (mouse_check_button_pressed(mb_left)){
						if (obj_amadix.state != player_state.swimming)
						&& (obj_amadix.state != player_state.swimming_idle)
						&& (!global.inCutscene)
						&& (!global.inEq)
						&& (!global.inChest)
						&& (!global.inDialogue){
							itemActionSword();
						}
					}else{
						if (obj_amadix.actionstate != player_state_action.attacking_melee)
						itemActionNone();
					}
				}else{
					itemActionNone();
				}
			break;
			case itemtype.tool:
				if (obj_amadix.actionstate != player_state_action.pickup){
					itemActionNone();
				}
			break;
			case itemtype.melee:
				if (mouse_check_button_pressed(mb_left)){
					if (obj_amadix.state != player_state.swimming)
					&& (obj_amadix.state != player_state.swimming_idle)
					&& (!global.inCutscene)
					&& (!global.inEq)
					&& (!global.inChest)
					&& (!global.inDialogue){
						itemActionSword();
					}
				}else{
					if (obj_amadix.actionstate != player_state_action.attacking_melee)
					itemActionNone();
				}
			break;
			case itemtype.hat:
				if (obj_amadix.actionstate != player_state_action.pickup){
					itemActionNone();
				}
			break;
			case itemtype.clothing:
				if (obj_amadix.actionstate != player_state_action.pickup){
					itemActionNone();
				}
			break;
			case itemtype.pants:
				if (obj_amadix.actionstate != player_state_action.pickup){
					itemActionNone();
				}
			break;
			case itemtype.boots:
				if (obj_amadix.actionstate != player_state_action.pickup){
					itemActionNone();
				}
			break;
			default:
				if (obj_amadix.actionstate != player_state_action.pickup){
					itemActionNone();
				}
			break;
		}
		
		
		
		/*
		
		if (type == itemtype.handgun) || (type == itemtype.shotgun){

		}else if ((type == itemtype.food) || (type == itemtype.fruit) || (type == itemtype.vegetable) || (type == itemtype.dish)){
			if (obj_amadix.actionstate == player_state_action.handgun) obj_amadix.actionstate = player_state_action.none;

		}else if (type == itemtype.drink) || (type == itemtype.alcohol){
			if (obj_amadix.actionstate == player_state_action.handgun) obj_amadix.actionstate = player_state_action.none;

		}else if (type == itemtype.melee){

			
			if (obj_amadix.actionstate == player_state_action.handgun) obj_amadix.actionstate = player_state_action.none;

		}else{
			obj_amadix.actionstate = player_state_action.none;
			with(obj_amadix){
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
			}
			
		}
		
		*/
		
		
	}
	
	
	
	
	}
}