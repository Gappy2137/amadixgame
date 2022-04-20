function item_action(){
	var amount =		obj_inventory.ds_inventory[# INVAMOUNT, obj_inventory.mouse_slotx_second];
	var type =			obj_inventory.ds_inventory[# INVTYPE, obj_inventory.mouse_slotx_second];
	var hp =			obj_inventory.ds_inventory[# INVHP, obj_inventory.mouse_slotx_second];
	var stamina =		obj_inventory.ds_inventory[# INVSTAMINA, obj_inventory.mouse_slotx_second];
	var level =			obj_inventory.ds_inventory[# INVLEVEL, obj_inventory.mouse_slotx_second];
	var damage =		obj_inventory.ds_inventory[# INVDAMAGE, obj_inventory.mouse_slotx_second];
	var defence =		obj_inventory.ds_inventory[# INVDEFENCE, obj_inventory.mouse_slotx_second];
	var effects =		obj_inventory.ds_inventory[# INVEFFECTS, obj_inventory.mouse_slotx_second];
	
	if (instance_exists(obj_amadix)){
		

	if (!inslots){
		if (type == itemtype.handgun){
			if (amount > 0){
					var iitem = obj_inventory.ds_inventory[# INVITEM, obj_inventory.mouse_slotx_second];
					if (!instance_exists(obj_gun_logic)){instance_create_layer(obj_amadix.x, obj_amadix.y, "Instances", obj_gun_logic);}
					with (obj_gun_logic){
						//ammo itd	
					}
					with (obj_amadix){
						itemeaten = iitem;
						actionstate = player_state_action.handgun;
						var face = 0;
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
						scr_setPlayerFacingAnim(face);
					}
			}else{
				slot_remove(obj_inventory.mouse_slotx_second);
				obj_inventory.text_alpha = 0;
			}
		}else if ((type == itemtype.food) || (type == itemtype.fruit) || (type == itemtype.vegetable) || (type == itemtype.dish)){
			if (obj_amadix.actionstate == player_state_action.handgun) obj_amadix.actionstate = player_state_action.none;
			if (mouse_check_button_pressed(mb_right)){
				if (!obj_amadix.stuffed){
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
								canmove = false;
								moving = false;
								running = false;
								hsp = 0;
								vsp = 0;
								facing = dirc.down;
								scr_setPlayerFacingAnim(index_facing.down);
								alarm[0] = 55;
							}
							if (hp > 0){global.hp += hp;}
							if (stamina > 0){global.stamina += stamina;}
						}
					}else{
						slot_remove(obj_inventory.mouse_slotx_second);
						obj_inventory.text_alpha = 0;
					}
				}
			}
		}else if (type == itemtype.drink) || (type == itemtype.alcohol){
			if (obj_amadix.actionstate == player_state_action.handgun) obj_amadix.actionstate = player_state_action.none;
			if (mouse_check_button_pressed(mb_right)){
				if (!obj_amadix.stuffed){
					if (amount > 0){
						if (obj_amadix.actionstate != player_state_action.drinking){
							var iitem = obj_inventory.ds_inventory[# INVITEM, obj_inventory.mouse_slotx_second];
							with (obj_amadix){
								itemeaten = iitem;
								actionstate = player_state_action.drinking;
								anim_frame_action = 0;
								anim_speed_action = 0.16;
								anim_frame = 0;
								canmove = false;
								moving = false;
								running = false;
								hsp = 0;
								vsp = 0;
								facing = dirc.down;
								scr_setPlayerFacingAnim(index_facing.down);
								alarm[0] = 65;
							}
							if (hp > 0){global.hp += hp;}
							if (stamina > 0){global.stamina += stamina;}
							if (type == itemtype.alcohol){
								global.alcoholPoisoning += level;
							}
						}
					}else{
						slot_remove(obj_inventory.mouse_slotx_second);
						obj_inventory.text_alpha = 0;
					}
				}
			}
		}else if (type == itemtype.melee){

			
			if (obj_amadix.actionstate == player_state_action.handgun) obj_amadix.actionstate = player_state_action.none;
			if (mouse_check_button_pressed(mb_left)){
			if (amount > 0){
				if (obj_amadix.actionstate != player_state_action.attacking_melee){
					var iitem = obj_inventory.ds_inventory[# INVITEM, obj_inventory.mouse_slotx_second];
					with (obj_amadix){
						oneStepEvent[0] = true;
						oneStepEvent[1] = true;
						itemeaten = iitem;
						actionstate = player_state_action.attacking_melee;
						anim_frame_action = 0;
						anim_speed_action = 0.4;
						anim_frame = 0;
						canmove = false;
						moving = false;
						hsp = 0;
						vsp = 0;
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
				}
			}else{
				slot_remove(obj_inventory.mouse_slotx_second);
				obj_inventory.text_alpha = 0;
			}
			}
		}else{
			obj_amadix.actionstate = player_state_action.none;
			with(obj_amadix){
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
			}
			
		}
	}
	
	
	}
}