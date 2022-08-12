function scr_playerPressingKeys() {
	if (!canmove){exit;}
	if (global.inChest)||(global.inConsole)||(global.inEq){exit;}
	if ((key_left) || (key_right) || (key_up) || (key_down))
	return true;

}
