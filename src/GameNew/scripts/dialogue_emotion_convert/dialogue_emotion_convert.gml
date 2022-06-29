function dialogue_emotion_convert(_emotion){
	if (_emotion == "-1")					return -1;
	if (_emotion == "emotion_normal")		return 0;
	if (_emotion == "emotion_happy")		return 1;
	if (_emotion == "emotion_sad")			return 2;
	if (_emotion == "emotion_angry")		return 3;
}