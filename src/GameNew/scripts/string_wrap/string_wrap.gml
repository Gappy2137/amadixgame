function string_wrap(str, max_width){
	var mod_count = dialogue_special_counter(str);
	var str_len = string_length(str) - mod_count;
	var space = 1;
	
	var count = 1;
	var substr = -1;
	
	repeat(str_len){
		substr = string_copy(str, 1, count);
		if (string_char_at(str, count) == " "){
			space = count;	
		}
		
		if (string_width(substr) > max_width){
			str = string_delete(str, space, 1);
			str = string_insert("\n", str, space);	
			count++;
		}
	
		count++;
	}
	
	return str;
}