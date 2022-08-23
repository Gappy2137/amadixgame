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
}else{
	canClickAt = false;
}

if ((canTalkTo) && (mouse_over_me(clickRadius)) && (!global.inDialogue)){
	
	cursorChange = true;

	if (input_check_pressed("mouseRight")){
		
		if (global.cursorSpr == cursorState.dialogue){
	
			if (instance_exists(obj_amadix)){
				anim_frame = checkFacing(obj_amadix);
				
				obj_amadix.facing = checkFacing(real(id));
	
				instance_create_layer(x, y, "Important", obj_chatterbox, {
					dialogueName: dialogue
				});
			}
		}
	}
}else{
	cursorChange = false;
}