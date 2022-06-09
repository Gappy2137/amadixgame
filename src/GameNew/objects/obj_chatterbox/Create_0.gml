

//show_message(filename_dir(dialogueName));

//Set the default font for Scribble to use
scribble_font_set_default("font_dialogue");

//Load in our source file from Chatterbox
ChatterboxLoadFromFile(dialogueName);

scribble_typists_add_event("speaker", speaker_change);

//Create a new chatterbox and jump to the Start node
chatterbox = ChatterboxCreate(dialogueName, false);
ChatterboxJump(chatterbox, "Start");

//Update our text elements
refresh_text_elements();

myPortrait = -1;

myEmotion = -1;

myName = -1;

dialboxX = 145;
dialboxY = 200;
dialbox_width = 192;
dialbox_height = 64;

portraitboxX = 112;
portraitbox_wh = 64;

textX = dialboxX + 4;
textY = dialboxY + 8;
/*
//Emocje
enum dialogueEmotion{
	normal		= 0,
	happy		= 1,
	angry		= 2,
	sad			= 3
}