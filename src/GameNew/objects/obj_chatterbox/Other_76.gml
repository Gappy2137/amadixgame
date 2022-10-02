if (global.inCutscene){
	with (obj_cutscene_controller){
		
		chatterboxActive = true;
		
		var _eventType = event_data[? "event_type"];
		var _eventMessage = event_data[? "message"];
		
		if (_eventType == "sequence event"){
			with (obj_chatterbox){
				dialogueName = _eventMessage;
			
				//Set the default font for Scribble to use
				scribble_font_set_default("font_dialogue");

				//Load in our source file from Chatterbox
				ChatterboxLoadFromFile(dialogueName);

				scribble_typists_add_event("speaker", speaker_change);

				scribble_typists_add_event("choice", dialogue_choice);

				//Create a new chatterbox and jump to the Start node
				chatterbox = ChatterboxCreate(dialogueName, false);
				ChatterboxJump(chatterbox, "Start");

				//Update our text elements
				refresh_text_elements();
			}
		}
	}
}

