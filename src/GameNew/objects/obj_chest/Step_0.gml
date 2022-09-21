

if (ami_clicked(4)) 
&& (!obj_inventory.show_inventory) 
&& (!global.inDialogue)
&& (!global.inCutscene)
&& (!global.inConsole){
	opened = true;
	var idd = id;
				
	with(obj_amadix){
		facing = checkFacing(real(idd));
		scr_setPlayerFacingAnim(facing);
	}
}

if (show_container){
	if (keyboard_check_pressed(ord("E"))){
		if (inhand == -1){
			global.inChest = false;
			ready = false;
			show_container = false;	
			canUseContainter = false;
			obj_inventory.show_slots = true;
			opened = false;
		}
	}
}
if (opened){
	if (!ready){
		if (anim_frame >= anim_frame_num - 0.9){
			anim_frame = anim_frame_num - 0.9;
			ready = true;
		}else{
			anim_frame += anim_speed;
		}
	}
}else{
	if (anim_frame <= 0.9){
		anim_frame = 0;
	}else{
		anim_frame -= anim_speed;
	}
}

if (ready){
	global.inChest = true;
	show_container = true;	
	alarm[0] = 2;	
	ready = false;
}

event_inherited();