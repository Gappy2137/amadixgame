function scr_updatePlayerAnim() {
	if (global.inChest)||(global.inConsole)||(global.inEq){exit;}
	
	if instance_exists(obj_amadix){
		with (obj_amadix) scr_setPlayerFacing();
	}


}
