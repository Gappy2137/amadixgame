if (ChatterboxIsStopped(chatterbox)){
    //If we've stopped we should say so
    //In a real game you'd close the dialogue system and permit user interaction again
    instance_destroy();
}else{
	
if (!show)exit;
	
	switch(boxType){
		case 0:
			
			
			// Main dialoguebox
			scr_draw_gui_box_stretch(spr_dialoguebox, dialboxX_amadix, dialboxY, dialboxX_amadix + dialbox_width, dialboxY + dialbox_height);
			
			// Namebox
			scr_draw_gui_box_stretch(spr_dialoguebox, portraitboxX_amadix, nameboxY, portraitboxX_amadix + portraitbox_width, nameboxY + namebox_height);
			
			// Name
			var _name = scribble(myName);
			var name_scale = .75;
			var nameX = portraitboxX_amadix + portraitbox_width/2;
			var nameY = nameboxY + namebox_height/2;
			
			_name.transform(name_scale, name_scale, 0);
			_name.starting_format("font_dialogue", textColor);
			_name.fit_to_box( ( (portraitboxX_amadix + portraitbox_width - 4) * 1/name_scale), ( (nameboxY + namebox_height) * 1/name_scale), true);
			_name.align(fa_center, fa_middle);
			
			_name.blend(c_white, 0.5);
			_name.starting_format("font_dialogue", shadowColor);
			_name.draw(nameX + .5, nameY + .5);
			
			_name.blend(c_white, 1);
			_name.starting_format("font_dialogue", textColor);
			_name.draw(nameX, nameY);
			
			// Portraitbox
			scr_draw_gui_box_stretch(spr_dialoguebox, portraitboxX_amadix, dialboxY, portraitboxX_amadix + portraitbox_width, dialboxY + dialbox_height);
			
			// Portrait
			draw_sprite(spr_portrait_amadix,
			real(myEmotion),
			portraitboxX_amadix, dialboxY);
			
			// Portrait edge
			scr_draw_gui_box_stretch(spr_dialoguebox_edge, portraitboxX_amadix, dialboxY, portraitboxX_amadix + portraitbox_width, dialboxY + dialbox_height);
			
			if (waitArrow){
				draw_sprite(spr_dialoguebox_arrow, 0, dialboxX_amadix + dialbox_width, dialboxY + dialbox_height);	
			}
			
		break;
		case 1:
			
			// Main dialoguebox
			scr_draw_gui_box_stretch(spr_dialoguebox, dialboxX, dialboxY, dialboxX + dialbox_width, dialboxY + dialbox_height);
			
			// Namebox
			scr_draw_gui_box_stretch(spr_dialoguebox, portraitboxX, nameboxY, portraitboxX + portraitbox_width, nameboxY + namebox_height);
			
			// Name
			var _name = scribble(myName);
			var name_scale = .75;
			var nameX = portraitboxX + portraitbox_width/2;
			var nameY = nameboxY + namebox_height/2;
			
			_name.transform(name_scale, name_scale, 0);
			_name.starting_format("font_dialogue", textColor);
			_name.fit_to_box( ( (portraitboxX + portraitbox_width - 4) * 1/name_scale), ( (nameboxY + namebox_height) * 1/name_scale), true);
			_name.align(fa_center, fa_middle);
			
			_name.blend(c_white, 0.5);
			_name.starting_format("font_dialogue", shadowColor);
			_name.draw(nameX + .5, nameY + .5);
			
			_name.blend(c_white, 1);
			_name.starting_format("font_dialogue", textColor);
			_name.draw(nameX, nameY);
			
			// Portraitbox
			scr_draw_gui_box_stretch(spr_dialoguebox, portraitboxX, dialboxY, portraitboxX + portraitbox_width, dialboxY + dialbox_height);
			
			// Portrait
			draw_sprite(asset_get_index(myPortrait),
			real(myEmotion),
			portraitboxX, dialboxY);
			
			// Portrait edge
			scr_draw_gui_box_stretch(spr_dialoguebox_edge, portraitboxX, dialboxY, portraitboxX + portraitbox_width, dialboxY + dialbox_height);
			
			if (waitArrow){
				draw_sprite(spr_dialoguebox_arrow, 0, dialboxX + dialbox_width, dialboxY + dialbox_height);	
			}
		break;
		case 2:
			
			scr_draw_gui_box_stretch(spr_dialoguebox, dialboxX_empty, dialboxY, dialboxX_empty + dialbox_width, dialboxY + dialbox_height);	
		
			if (waitArrow){
				draw_sprite(spr_dialoguebox_arrow, 0, dialboxX_empty + dialbox_width, dialboxY + dialbox_height);	
			}
		break;
		case 3:
		
			if (choiceAnim){

				
				
				// Portraitbox
				scr_draw_gui_box_stretch(spr_dialoguebox, choiceport_x, dialboxY, choiceport_x + portraitbox_width, dialboxY + dialbox_height);
			
				// Portrait
				if ((choiceAnimMid) || (choiceAnimDone)){
					draw_sprite(spr_portrait_amadix,
					0,
					choiceport_x, dialboxY);
				}else{
					draw_sprite(asset_get_index(myPortrait),
					real(myEmotion),
					choiceport_x, dialboxY);
				}
				// Portrait edge
				scr_draw_gui_box_stretch(spr_dialoguebox_edge, choiceport_x, dialboxY, choiceport_x + portraitbox_width, dialboxY + dialbox_height);
				
				
				// Main dialoguebox
				scr_draw_gui_box_stretch(spr_dialoguebox, choicebox1_x, dialboxY, choicebox1_x + dialbox_width, dialboxY + dialbox_height);	
				
				// Choicebox
				scr_draw_gui_box_stretch(spr_dialoguebox, choicebox2_x, dialboxY, choicebox2_x + dialbox_width, dialboxY + dialbox_height);	


				
			}else{
				// Main dialoguebox
				scr_draw_gui_box_stretch(spr_dialoguebox, dialboxX_choice, dialboxY, dialboxX_choice + dialbox_width, dialboxY + dialbox_height);	
			
				// Choicebox
				scr_draw_gui_box_stretch(spr_dialoguebox, choiceboxX, dialboxY, choiceboxX + dialbox_width, dialboxY + dialbox_height);	
			
				// Portraitbox
				scr_draw_gui_box_stretch(spr_dialoguebox, portraitboxX_choice, dialboxY, portraitboxX_choice + portraitbox_width, dialboxY + dialbox_height);
			
				// Portrait
				draw_sprite(spr_portrait_amadix,
				0,
				portraitboxX_choice, dialboxY);
			
				// Portrait edge
				scr_draw_gui_box_stretch(spr_dialoguebox_edge, portraitboxX_choice, dialboxY, portraitboxX_choice + portraitbox_width, dialboxY + dialbox_height);
			}

		break;
	}
	
	var _i = 0;
	
    repeat(array_length(text_elements)){
        //Get our text element and position
        var _struct = text_elements[_i];
        var _x       = _struct.x;
        var _y       = _struct.y;
        var _element = _struct.element;
        var _typist  = _struct.typist;
		
		var _scale = 0.75;
		
		
        //Draw the text element
		_element.transform(_scale, _scale, 0);
		_element.wrap((text_width * 1/_scale), (text_height * 1/_scale) + 4, false);
		//_element.scale_to_box((text_width * 1/_scale), (text_height * 1/_scale));
       
	    _element.blend(c_white, 0.5);
		_element.starting_format("font_dialogue", shadowColor);
		if (choiceAnim)
			_element.draw(choicebox1_x + 4 + .5, _y + .5, _typist);	
		else
			_element.draw(_x + .5  - textfix, _y + .5, _typist);	
		
		
		_element.blend(c_white, 1);
		_element.starting_format("font_dialogue", textColor);
		if (choiceAnim)
			_element.draw(choicebox1_x + 4, _y, _typist);
		else
			_element.draw(_x - textfix, _y, _typist);
		
		
		if (mySound != -1)
			_typist.sound(asset_get_index(mySound), 10, 1, 1);
		
        
        //Break out of the loop if this text element hasn't finished fading in
        if (_typist.get_state() < 1.0) break;
        //Autotype will only happen when you actually draw the text element
        //This means if we don't want to fade text in we can just... not draw it
        
        ++_i;
    }

}
draw_text(128, 128, choiceAnim);
draw_text(128, 148, boxType);