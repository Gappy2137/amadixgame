text = file_text_open_read("lang.json");
root = json_decode(text);
global.lang_map = ds_map_find_value(root, "English");

