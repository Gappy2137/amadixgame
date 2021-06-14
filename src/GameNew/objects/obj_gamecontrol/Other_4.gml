
if (newRoom == -1) exit;
if !instance_exists(obj_amadix) instance_create_layer(0, 0, "Instances", obj_amadix);
if instance_exists(obj_amadix){
	obj_amadix.x = newX+8;
	obj_amadix.y = newY;
	obj_amadix.facing = oldfacing;
	with (obj_amadix){
		switch(facing){
			case dirc.right: scr_setPlayerFacingAnim(index_facing.right);		break;	
			case dirc.left: scr_setPlayerFacingAnim(index_facing.left);			break;	
			case dirc.up: scr_setPlayerFacingAnim(index_facing.up);				break;	
			case dirc.down: scr_setPlayerFacingAnim(index_facing.down);			break;	
			case -1: scr_setPlayerFacingAnim(index_facing.right);				break;	
		}
		
	}
}