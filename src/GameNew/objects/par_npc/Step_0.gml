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

if (cancollide){
	sol = instance_create_layer(bbox_left, bbox_top, "Instances", obj_solid1);
	var btop = sprite_get_bbox_top(sprite_index);
	var bleft = sprite_get_bbox_left(sprite_index);
	var bright = sprite_get_bbox_right(sprite_index);
	var bbottom = sprite_get_bbox_bottom(sprite_index);
	with (sol){
		var wi = (bright - bleft);
		var he = (bbottom - btop);
		image_xscale = wi;
		image_yscale = he;
	}
}