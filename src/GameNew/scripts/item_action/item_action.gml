function item_action(){
	var amount =		obj_inventory.ds_inventory[# AMOUNT, obj_inventory.mouse_slotx_second];
	var type =			obj_inventory.ds_inventory[# TYPE, obj_inventory.mouse_slotx_second];
	var hp =			obj_inventory.ds_inventory[# HP, obj_inventory.mouse_slotx_second];
	var stamina =		obj_inventory.ds_inventory[# STAMINA, obj_inventory.mouse_slotx_second];
	var level =			obj_inventory.ds_inventory[# LEVEL, obj_inventory.mouse_slotx_second];
	var damage =		obj_inventory.ds_inventory[# DAMAGE, obj_inventory.mouse_slotx_second];
	var defence =		obj_inventory.ds_inventory[# DEFENCE, obj_inventory.mouse_slotx_second];
	var effect1 =		obj_inventory.ds_inventory[# EFFECT1, obj_inventory.mouse_slotx_second];
	var effect2 =		obj_inventory.ds_inventory[# EFFECT2, obj_inventory.mouse_slotx_second];
	var effect3 =		obj_inventory.ds_inventory[# EFFECT3, obj_inventory.mouse_slotx_second];
	//Prawy przycisk wscisniety
	if (mouse_check_button_pressed(mb_right)){
		if instance_exists(obj_amadix){
			if (type == itemtype.food) || (type == itemtype.fruit) || (type == itemtype.vegetable) || (type == itemtype.dish){
				if (amount > 0){
					if (obj_amadix.actionstate != player_state_action.eating){
						var iitem = obj_inventory.ds_inventory[# 0, obj_inventory.mouse_slotx_second];
						with (obj_amadix){
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
						obj_inventory.ds_inventory[# AMOUNT, obj_inventory.mouse_slotx_second] -= 1;
					}
				}else{
					slot_remove(obj_inventory.mouse_slotx_second);
					obj_inventory.text_alpha = 0;
				}
			}else
			if (type == itemtype.drink){
				if (amount > 0){
					if (obj_amadix.actionstate != player_state_action.drinking){
						var iitem = obj_inventory.ds_inventory[# 0, obj_inventory.mouse_slotx_second];
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
							alarm[0] = 56;
						}
						if (hp > 0){global.hp += hp;}
						if (stamina > 0){global.stamina += stamina;}
						obj_inventory.ds_inventory[# AMOUNT, obj_inventory.mouse_slotx_second] -= 1;
					}
				}else{
					slot_remove(obj_inventory.mouse_slotx_second);
					obj_inventory.text_alpha = 0;
				}
			}
		}
	}
	
	//Lewy przycisk wscisniety
	if (mouse_check_button_pressed(mb_left))  && (!inslots){
		if (type == itemtype.melee){
			if (amount > 0){
				if (obj_amadix.actionstate != player_state_action.attacking_melee){
					var iitem = obj_inventory.ds_inventory[# 0, obj_inventory.mouse_slotx_second];
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
	}
	
}