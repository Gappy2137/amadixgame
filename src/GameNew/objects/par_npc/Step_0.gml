// Inherit the parent event
event_inherited();

if (npcBehaviour == 1){
	if (npcLookAt != -1){
		if (instance_exists(npcLookAt))
			anim_frame = checkFacing(npcLookAt);
	}
}

if (canTalkTo){
	canClickAt = true;
	clickRadius = 6;
}else{
	canClickAt = false;
	clickRadius = 6;
}

if ((canTalkTo) && (mouse_over_me(clickRadius)) && (!global.inDialogue)){
	
	cursorChange = true;

	if (input_check_pressed("mouseRight")){
	
		if (instance_exists(obj_amadix))
			anim_frame = checkFacing(obj_amadix);
	
		instance_create_layer(x, y, "Important", obj_chatterbox, {
			dialogueName: dialogue
		});
	}
}else{
	cursorChange = false;
}