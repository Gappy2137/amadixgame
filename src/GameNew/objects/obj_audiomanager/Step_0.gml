if (instance_exists(obj_amadix)){
	with(obj_amadix){
		audio_listener_position(x, y, 0);
		audio_listener_orientation(0, 0, 0, lengthdir_x(1, dir), lengthdir_y(1, dir), 0);
	}
}




if (triggerFadeOut){
	if (timer2 == 0){
		timer2 = timeFadeIn;	
		triggerFadeOut = false;
	}else{
		timer2--;
	}
}else{
	if (triggerFadeIn){
		if (timer == 0){
			timer = timeFadeOut;
			triggerFadeIn = false;
		}else{
			timer--;
		}
	}
}

if (triggerFadeOut){
	audio_sound_gain(loopAudioSound[0], 0, timeFadeIn);
	//audio_sound_gain(loopAudioSound[1], 0, time);
	
	if (audio_sound_get_gain(loopAudioSound[0]) <= 0){
		audio_stop_sound(loopAudioSound[0]);
		loopAudioIndex[0] = newAudio;
		alarm[2] = 2;
		triggerFadeOut = false;
		timer2 = timeFadeIn;	
	}
}else if (triggerFadeIn) && (!triggerFadeOut){
	audio_sound_gain(loopAudioSound[0], loopAudioVolume[0], timeFadeIn);
	
}else if (!triggerFadeIn) && (!triggerFadeOut){
	audio_sound_gain(loopAudioSound[0], loopAudioVolume[0], timeFadeIn);
	//audio_sound_gain(loopAudioSound[1], loopAudioVolume[1], 1);
}