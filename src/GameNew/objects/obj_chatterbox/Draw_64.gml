/*
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

*/


if (ChatterboxIsStopped(chatterbox))
{
    //If we've stopped we should say so
    //In a real game you'd close the dialogue system and permit user interaction again
    instance_destroy();
}
else
{
	
	// Draw dialogue box
	scr_draw_gui_box_stretch(spr_dialoguebox, dialboxX, dialboxY, dialboxX + dialbox_width, dialboxY + dialbox_height);
	
	if ((myPortrait != -1) && (myEmotion != -1)){
		if (myPortrait == "spr_portrait_amadix"){
			scr_draw_gui_box_stretch(spr_dialoguebox, dialboxX - portraitbox_width, dialboxY, dialboxX, dialboxY + dialbox_height);
			draw_sprite(spr_portrait_amadix,
			real(myEmotion),
			dialboxX - portraitbox_width, dialboxY);
			scr_draw_gui_box_stretch(spr_dialoguebox_edge, dialboxX - portraitbox_width, dialboxY, dialboxX, dialboxY + dialbox_height);
		}else{
			scr_draw_gui_box_stretch(spr_dialoguebox, dialboxX + dialbox_width, dialboxY, dialboxX + dialbox_width + portraitbox_width, dialboxY + dialbox_height);
			draw_sprite(asset_get_index(myPortrait),
			real(myEmotion),
			dialboxX + dialbox_width, dialboxY);
			scr_draw_gui_box_stretch(spr_dialoguebox_edge, dialboxX + dialbox_width, dialboxY, dialboxX + dialbox_width + portraitbox_width, dialboxY + dialbox_height);
		}
	}
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
		
		var _scale = 0.75;
        
        //Draw the text element
		_element.transform(_scale, _scale, 0);
		_element.wrap((text_width * 1/_scale), (text_height * 1/_scale), false);
		//_element.scale_to_box((text_width * 1/_scale), (text_height * 1/_scale));
       
	    _element.blend(c_white, 0.5);
		_element.starting_format("font_dialogue", shadowColor);
		_element.draw(_x + .5, _y + .5, _typist);
		
		_element.blend(c_white, 1);
		_element.starting_format("font_dialogue", textColor);
		_element.draw(_x, _y, _typist);
		
		if (mySound != -1)
			_typist.sound(asset_get_index(mySound), 10, 1, 1);
		
        
        //Break out of the loop if this text element hasn't finished fading in
        if (_typist.get_state() < 1.0) break;
        //Autotype will only happen when you actually draw the text element
        //This means if we don't want to fade text in we can just... not draw it
        
        ++_i;
    }
	/*
	if (ChatterboxIsWaiting(chatterbox)){
		draw_sprite(spr_dialoguebox_arrow, 0, dialboxX + dialbox_width - 4, dialboxY + dialbox_height - 4);
	}
	*/
}