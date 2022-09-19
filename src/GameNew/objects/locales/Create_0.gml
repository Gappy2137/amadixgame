text = file_text_open_read(working_directory + "language/langs.json");
root = json_decode(text);

langlist = ds_list_create();
ds_list_add(langlist, "english", "polish");
langlistID = 0;
global.lang = langlist[| langlistID];


global.lang_map = ds_map_find_value(root, string(global.lang));