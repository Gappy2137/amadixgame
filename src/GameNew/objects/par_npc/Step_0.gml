// Inherit the parent event
event_inherited();

if (npcBehaviour == 1){
	if (npcLookAt != -1){
		if (instance_exists(npcLookAt))
			anim_frame = checkFacing(npcLookAt);
	}
}

if (ami_clicked()) && (!global.inDialogue){
	
	if (instance_exists(obj_amadix))
		anim_frame = checkFacing(obj_amadix);
	
	instance_create_layer(x, y, "Important", obj_chatterbox, {
		dialogueName: dialogue
	});
}