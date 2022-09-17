
if (doTransition){
	if (room != newRoom){
		alpha += 0.08;
		if (alpha >= 1){room_goto(newRoom);}
	} else {
		alpha -= 0.08;
		if (alpha <= 0){doTransition = false;}
	}
	
	draw_set_alpha(alpha);
	draw_rectangle_color(0, 0, guiWidth, guiHeight, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
}
//draw_text(64, 96, hours + ":" + minutes);

//draw_text(64, 96, global.alcoholPoisoning);

//var in = instance_count;

//draw_text(48, 48, in);

draw_set_alpha(1);
draw_text(128, 128 + 0, (obj_audiomanager.loopAudioState[0]));
draw_text(128, 128 + 8, audio_get_name(obj_audiomanager.loopAudioIndex[0]));
draw_text(128, 128 + 16, (obj_audiomanager.loopAudioVolume[0]));
draw_text(128, 128 + 24, audio_sound_get_gain(obj_audiomanager.loopAudioSound[0]));
