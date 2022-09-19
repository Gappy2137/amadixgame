if (keyboard_check_pressed(ord("L"))){
	langlistID ++;
	if (langlistID > 1){
		langlistID = 0;	
	}
	file_text_close(text);
	global.lang = langlist[| langlistID];
	language_update(langlistID);
}