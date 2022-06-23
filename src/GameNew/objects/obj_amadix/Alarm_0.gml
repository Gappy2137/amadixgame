switch(actionstate){
	case player_state_action.eating:
		obj_inventory.ds_inventory[# INVAMOUNT, obj_inventory.mouse_slotx_second] -= 1;	
		actionstate = player_state_action.none;
		canmove = true;
		item_add_effect(itemeaten);
		itemeaten = -1;
	break;
	case player_state_action.drinking:
		obj_inventory.ds_inventory[# INVAMOUNT, obj_inventory.mouse_slotx_second] -= 1;	
		actionstate = player_state_action.none;
		canmove = true;
		item_add_effect(itemeaten);
		itemeaten = -1;
	break;
	case player_state_action.attacking_melee:
		actionstate = player_state_action.none;
		canmove = true;
		itemeaten = -1;
	break;
	case player_state_action.pickup:
		actionstate = player_state_action.none;
		canmove = true;
		item_add(-1, itemeaten, itemamount);
		itemeaten = -1;
		itemamount = 0;
		pickupid = -1;
		pickupTrigger = false;
	break;
}

attackSpeedFix = false;