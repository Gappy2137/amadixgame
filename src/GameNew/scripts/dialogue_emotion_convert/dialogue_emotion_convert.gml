function dialogue_emotion_convert(_emotion){
	if (_emotion == "-1")					return -1;
	if (_emotion == "emotion_normal")		return 0;
	if (_emotion == "emotion_cheery")		return 1;
	if (_emotion == "emotion_happy")		return 2;
	if (_emotion == "emotion_amused")		return 3;
	if (_emotion == "emotion_sad")			return 4;
	if (_emotion == "emotion_blush")		return 5;
	if (_emotion == "emotion_angry")		return 6;
}