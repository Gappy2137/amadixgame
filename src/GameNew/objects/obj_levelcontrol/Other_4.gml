if (loopingAudio_1 != noone){
	if (!audio_is_playing(loopingAudio_1)){
		loopingAudio_1_prev = loopingAudio_1;
		audio_play_sound(loopingAudio_1, 20, true, loopingAudioVolume);
	}
}