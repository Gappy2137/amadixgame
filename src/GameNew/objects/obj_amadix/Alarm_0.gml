if (actionstate == player_state_action.eating){
	actionstate = player_state_action.none;
	canmove = true;
	item_add_effect(itemeaten);
	itemeaten = -1;
}else if (actionstate == player_state_action.drinking){
	actionstate = player_state_action.none;
	canmove = true;
	item_add_effect(itemeaten);
	itemeaten = -1;
}else if (actionstate == player_state_action.attacking_melee){
	actionstate = player_state_action.none;
	canmove = true;
	itemeaten = -1;
}
attackSpeedFix = false;