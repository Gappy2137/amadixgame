
myPortrait = -1;

myEmotion = -1;

myName = -1;

mySound = -1;

dialboxX = 176;
dialboxY = 200;

dialboxX_amadix = 112;
dialboxX_empty = 144;
dialboxX_choice = 16;

dialbox_width = 192;
dialbox_height = 64;

portraitboxX = 112;
portraitboxX_amadix = 304;
portraitbox_width = 64;
portraitboxX_choice = 208;

textX = dialboxX + 4;
textY = dialboxY + 4;

textfix = 0;

text_width = dialbox_width - 6;
text_height = dialbox_height - 4;

nameboxY = 184;
namebox_height = 16;

choiceboxX = 272;
choiceboxY = 200;

textColor = #FFFFFF;
shadowColor = #000000;

waitArrow = false;
boxType = 0;

choiceStop = "0";

choiceAnim = false;
choiceAnimDone = false;
choiceAnimMid = false;

choicebox1_fromx = dialboxX;
choicebox1_tox = dialboxX_choice;
choicebox1_x = dialboxX;

choicebox2_fromx = dialboxX;
choicebox2_tox = choiceboxX;
choicebox2_x = dialboxX;


choiceport_fromx = 112;
choiceport_tox = 208;
choiceport_x = portraitboxX;

show = false;
alarm[0] = 2;

/*
0 - amadix
1 - inna osoba
2 - wiadomosc
3 - wybor
*/

//show_message(filename_dir(dialogueName));

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


/*
//Emocje
enum dialogueEmotion{
	normal		= 0,
	happy		= 1,
	angry		= 2,
	sad			= 3
}