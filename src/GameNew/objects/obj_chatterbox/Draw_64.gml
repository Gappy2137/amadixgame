
if (myPortrait[message_current] == -1){
	scr_draw_gui_box_stretch(spr_dialoguebox, dialboxX, dialboxY, dialboxX + dialbox_width, dialboxY + dialbox_height);
	textX = dialboxX + 4;	
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
	textX = portraitboxX + 4;
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
	textX = portraitboxX + portraitbox_wh + 4;
}
	
//Rysuj portret postaci
if (myPortrait[message_current] == -1){
	
}else if (myPortrait[message_current] == spr_portrait_amadix){
	draw_sprite(spr_portrait_box, 0, portraitboxX + dialbox_width, dialboxY);
	draw_sprite(myPortrait[message_current], myEmotion[message_current], portraitboxX + dialbox_width, dialboxY);
}else{
	draw_sprite(spr_portrait_box, 0, portraitboxX, dialboxY);
	draw_sprite(myPortrait[message_current], myEmotion[message_current], portraitboxX, dialboxY);
}




if (ChatterboxIsStopped(chatterbox))
{
    //If we've stopped we should say so
    //In a real game you'd close the dialogue system and permit user interaction again
    scribble("(Chatterbox stopped)").draw(10, 10);
}
else
{
    //Iterate over all of our text elements and draw them
    //We cache text elements for drawing in refresh_text_elements()
    var _i = 0;
    repeat(array_length(text_elements))
    {
        //Get our text element and position
        var _struct = text_elements[_i];
        var _x       = _struct.x;
        var _y       = _struct.y;
        var _element = _struct.element;
        var _typist  = _struct.typist;
        
        //Draw the text element
        _element.draw(_x, _y, _typist);
        
        //Break out of the loop if this text element hasn't finished fading in
        if (_typist.get_state() < 1.0) break;
        //Autotype will only happen when you actually draw the text element
        //This means if we don't want to fade text in we can just... not draw it
        
        ++_i;
    }
}