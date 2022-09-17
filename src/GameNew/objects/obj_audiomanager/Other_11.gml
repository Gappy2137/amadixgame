///@description Start playing

if (audio_sound_get_gain(loopAudioSound[0]) == 0){
	

	if (loopAudioPrev[0] != loopAudioIndex[0]){
		loopAudioState[0] = audioState.fadein;
		loopAudioSound[0] = audio_play_sound(loopAudioIndex[0], 20, true, 0.01);
		audio_sound_gain(loopAudioSound[0], loopAudioVolume[0], fadeTime);
	}
}else{
	alarm[0] = 1;
}