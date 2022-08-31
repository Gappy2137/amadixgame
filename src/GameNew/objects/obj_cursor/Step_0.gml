

if (!global.inEq)
&& (!global.inChest)
&& (!global.inCutscene){
	var col = instance_place(x, y, par_collectible);
	var npc = instance_place(x, y, par_npc);
	if (col) && (col.cursorChange){
		global.cursorSpr = cursorState.pickup;
		timer = 10;
	}else
	if (npc) && (npc.cursorChange){
		global.cursorSpr = cursorState.dialogue;
		timer = 10;
	}else{
		timer--;
		if (timer <= 0){timer = 0;}
		if (timer < 1){
			if (instance_exists(obj_amadix)){
				if (obj_amadix.actionstate = player_state_action.handgun){
					global.cursorSpr = cursorState.handgun;
				}else{
					global.cursorSpr = cursorState.normal;
				}
			}else{
				global.cursorSpr = cursorState.normal;
			}
		}
	}
}else{
	if (global.inEq){
		if (instance_exists(obj_inventory)){
			if (obj_inventory.selected_slot != -1) || (obj_inventory.inhand != -1){
				global.cursorSpr = cursorState.point;
			}else{
				global.cursorSpr = cursorState.normal;	
			}
		}
	}else if (global.inChest){
		if (instance_exists(obj_amadix)){
			var _inst = instance_nearest(obj_amadix.x, obj_amadix.y, par_container);
			if (instance_exists(_inst)){
				if !((_inst.selected_slot == -1) && ((_inst.selected_slot_eq == -1))){
					global.cursorSpr = cursorState.point;
				}else{
					if (_inst.inhand == -1)
						global.cursorSpr = cursorState.normal;	
				}
			}
		}
	}else{
		global.cursorSpr = cursorState.normal;
	}
	
}


	




switch (global.cursorSpr){
	case cursorState.normal:
		cursor_sprite = spr_cursor_default;
	break;
	case cursorState.pickup:
		cursor_sprite = spr_cursor_pickup;
	break;
	case cursorState.dialogue:
		cursor_sprite = spr_cursor_dialogue;
	break;
	case cursorState.handgun:
		cursor_sprite = spr_crosshair;
	break;
	case cursorState.point:
		cursor_sprite = spr_cursor_point;
	break;
}
