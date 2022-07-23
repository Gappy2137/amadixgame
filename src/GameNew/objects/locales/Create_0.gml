text = file_text_open_read(working_directory + "language/langs.json");
root = json_decode(text);


global.lang = language.english;

enum language{
	english = 0,
	polish = 1
}

global.lang_map = ds_map_find_value(root, string(global.lang));