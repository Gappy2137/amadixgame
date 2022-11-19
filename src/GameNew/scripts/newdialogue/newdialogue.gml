function newdialogue(_message, _portrait, _emotion, _name, _choice, _message_next){
	var text = instance_create_layer(0, 0, MAINSCR, obj_dialogue);
	
	with (text){
		for (var i = 0; i < array_length_1d(_message); i++){
			mes[i] = _message[i];	
			myPortrait[i] = _portrait[i];
			myEmotion[i] = _emotion[i];
			myName[i] = _name[i];
			//myChoice[i] = _choice[i];
			message_next[i] = _message_next[i];	
		}
	}
}