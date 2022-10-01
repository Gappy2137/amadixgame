
// Load all audio groups
audio_group_load(audiogroup_sfx);
audio_group_load(audiogroup_ambient);
audio_group_load(audiogroup_default);


enum audioState {
	stopped = 0,
	fadein = 1,
	fadeout = 2,
	playing = 3
}

fadeTime = 50;

loopAudioIndex[0] = noone;
loopAudioVolume[0] = 0.5;
loopAudioSound[0] = noone;
loopAudioState[0] = audioState.stopped;
loopAudioPrev[0] = noone;

//loopAudioIndex[1] = snd_none;
//loopAudioVolume[1] = 0.5;
//loopAudioSound[1] = noone;

if (instance_exists(obj_levelcontrol)){
	loopAudioIndex[0] = snd_none;
	//loopAudioIndex[1] = obj_levelcontrol.loopAudio[1];
	
	event_user(1);
}