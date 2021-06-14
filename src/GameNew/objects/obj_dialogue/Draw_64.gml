if (timer <= 1){exit}
message_end = array_length_1d(mes);
	
if (myPortrait[message_current] == -1){
	scr_draw_gui_box_stretch(spr_dialoguebox, dialboxX, dialboxY, dialboxX + dialbox_width, dialboxY + dialbox_height);
	var textX = dialboxX + 4;	
}else if (myPortrait[message_current] == spr_portrait_amadix){
	scr_draw_gui_box_stretch(spr_dialoguebox, portraitboxX, dialboxY, portraitboxX + dialbox_width, dialboxY + dialbox_height);
	scr_draw_gui_box_stretch(spr_dialoguebox, portraitboxX + dialbox_width, dialboxY, portraitboxX + dialbox_width + portraitbox_wh, dialboxY + portraitbox_wh);
	scr_draw_gui_box_stretch(spr_dialoguebox, portraitboxX + dialbox_width, dialboxY - 12, portraitboxX + dialbox_width + portraitbox_wh, dialboxY);
	
	var amadixname;
	amadixname = scribble("[pin_center]Amadeusz");
	amadixname.transform(.5, .5, 0);
	amadixname.starting_format("font_dialogue", c_white);
	amadixname.wrap(128, 24, false);
	amadixname.draw(portraitboxX + dialbox_width , dialboxY - 10);
	var textX = portraitboxX + 4;
}else{
	scr_draw_gui_box_stretch(spr_dialoguebox, portraitboxX + portraitbox_wh, dialboxY, portraitboxX + dialbox_width + portraitbox_wh, dialboxY + dialbox_height);
	scr_draw_gui_box_stretch(spr_dialoguebox, portraitboxX, dialboxY, portraitboxX + portraitbox_wh, dialboxY + portraitbox_wh);
	scr_draw_gui_box_stretch(spr_dialoguebox, portraitboxX, dialboxY - 12, portraitboxX + portraitbox_wh, dialboxY);
	
	var name;
	name = scribble(myName[message_current]);
	name.transform(.5, .5, 0);
	name.starting_format("font_dialogue", c_white);
	name.wrap(128, 24, false);
	name.draw(portraitboxX , dialboxY - 10);
	var textX = portraitboxX + portraitbox_wh + 4;
}
var textY = dialboxY + 8;
	
//Rysuj portret postaci
if (myPortrait[message_current] == -1){
	
}else if (myPortrait[message_current] == spr_portrait_amadix){
	draw_sprite(spr_portrait_box, 0, portraitboxX + dialbox_width, dialboxY);
	draw_sprite(myPortrait[message_current], myEmotion[message_current], portraitboxX + dialbox_width, dialboxY);
}else{
	draw_sprite(spr_portrait_box, 0, portraitboxX, dialboxY);
	draw_sprite(myPortrait[message_current], myEmotion[message_current], portraitboxX, dialboxY);
}

if (array_length_1d(mes[message_current]) != 1){
	write.draw(textX, textY);
}else{
	write.draw(textX, textY);
}