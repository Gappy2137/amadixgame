function language_update(language){
	
	with (locales){
		text = file_text_open_read(working_directory + "language/langs.json");
		root = json_decode(text);
		global.lang_map = ds_map_find_value(root, global.lang);
	}
	with (obj_inventory){
		event_perform(ev_alarm, 0);	
	}
}