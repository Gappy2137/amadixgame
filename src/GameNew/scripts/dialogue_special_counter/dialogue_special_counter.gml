function dialogue_special_counter(str){
	var count = 0;
	for (var i = 0; i < string_length(str); ++i) {
		if (string_char_at(mes[message_current], i) == "|"){
			count++;
		}
	}
	return count*2;
}