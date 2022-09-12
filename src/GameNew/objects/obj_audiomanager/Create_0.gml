
// Load all audio groups
audio_group_load(audiogroup_sfx);
audio_group_load(audiogroup_ambient);

timeFadeIn = round(100/5);
timeFadeOut = round(100);
timer = timeFadeIn;
timer2 = timeFadeOut;

loopAudioIndex[0] = snd_none;
loopAudioVolume[0] = 0.5;
loopAudioSound[0] = noone;

loopAudioIndex[1] = snd_none;
loopAudioVolume[1] = 0.5;
loopAudioSound[1] = noone;

triggerFadeIn = false;
triggerFadeOut = false;

newAudio = noone;

event_user(0);
alarm[2] = 3;