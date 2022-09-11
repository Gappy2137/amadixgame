if (loopingAudio_1 != noone){
	//if (!audio_is_playing(loopingAudio_1)){
		//if (loopingAudio_1 != loopingAudio_1_prev){
			
			audio_play_sound(loopingAudio_1, 20, true, loopingAudioVolume);
			audio_play_sound(loopingAudio_1_prev, 20, true, loopingAudioVolume);
			
			if (loopingAudio_1_prev != noone){
				audio_sound_gain(loopingAudio_1_prev, 0, 500);
			}
			
			audio_sound_gain(loopingAudio_1, loopingAudioVolume, 200);
		//}
	//}
}