// Inherit the parent event
event_inherited();

if ami_clicked(){
	
	if (instance_exists(obj_amadix))
		anim_frame = checkFacing(obj_amadix);
	
	instance_create_layer(x, y, "Important", obj_chatterbox, {
		dialogueName: "test_en.yarn"
	});
}