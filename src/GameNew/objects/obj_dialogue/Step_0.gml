//Zakoncz tekst po przeczytaniu wszystkich wiadomosci
if (mouse_check_button_pressed(mb_left)){
	
	if (write.get_typewriter_state() < 1){
		write.typewriter_skip();
	}
	if (write.get_typewriter_state() == 1){
		/*
		if (message_current < message_end - 1){
			write.typewriter_reset();
			message_current++;
		}else{
			write.typewriter_reset();
			instance_destroy();
		}
		*/
		var xx = message_current;
		if (message_next[xx] == -1){
			write.typewriter_reset();
			instance_destroy();	
		}else{
			write.typewriter_reset();
			message_current = message_next[xx];
		}
		
		
		
	}
}

//nextchoice = myChoice[message_current];

if (timer >= 10){timer = 10;}else{timer++;}