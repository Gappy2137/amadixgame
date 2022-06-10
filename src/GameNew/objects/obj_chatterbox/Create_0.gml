
myPortrait = -1;

myEmotion = -1;

myName = -1;

dialboxX = 145;
dialboxY = 200;
dialbox_width = 192;
dialbox_height = 64;

portraitboxX = 112;
portraitbox_width = 64;

textX = dialboxX + 4;
textY = dialboxY + 4;
text_width = dialbox_width - 6;
text_height = dialbox_height - 4;

textColor = #FFFFFF;
shadowColor = #000000;

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


/*
//Emocje
enum dialogueEmotion{
	normal		= 0,
	happy		= 1,
	angry		= 2,
	sad			= 3
}