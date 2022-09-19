
depth = -10;

myPortrait = -1;

myEmotion = -1;

myName = -1;

mySound = -1;

dialboxX = 176;
dialboxY = 200;

dialboxX_amadix = 112;
dialboxX_empty = 144;
dialboxX_choice = 48;

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

choiceboxX = 240;
choiceboxY = 200;

textColor = #FFFFFF;
shadowColor = #000000;

waitArrow = false;
boxType = 4;

choiceStop = "0";
in = 0;

choiceAnim = false;
choiceAnimDone = false;
choiceAnimMid = false;

choicebox1_fromx = dialboxX;
choicebox1_tox = dialboxX_choice;
choicebox1_x = dialboxX;

choicebox2_fromx = 144;
choicebox2_tox = choiceboxX;
choicebox2_x = 144;


choiceport_fromx = 112;
choiceport_tox = 208;
choiceport_x = portraitboxX - 32;

show = false;

choiceboxSteps = 10;
choiceboxStep = choiceboxSteps;

alarm[0] = 8;

choiceNum = 0;
choiceboxX2[0] = choicebox2_x;
choiceboxX2[1] = choicebox2_x;
choiceboxX2[2] = choicebox2_x;
choiceboxX2[3] = choicebox2_x;
choicebox_height = 16;
onChoice[0] = 0;
onChoice[1] = 0;
onChoice[2] = 0;
onChoice[3] = 0;

choiceScroll = 0;
/*
0 - amadix
1 - inna osoba
2 - wiadomosc
3 - wybor
*/


cutsceneStep = 0;

if (global.inCutscene){
	if (!variable_instance_exists(id, "dialogueName")){
		variable_instance_set(id, "dialogueName", "test_en.yarn");
	}
	cutsceneStep = 2;
	
	//Set the default font for Scribble to use
	scribble_font_set_default("font_dialogue");

	//Load in our source file from Chatterbox
	ChatterboxLoadFromFile(dialogueName);

	scribble_typists_add_event("speaker", speaker_change);

	scribble_typists_add_event("choice", dialogue_choice);
	
	scribble_typists_add_event("giveitem", dialogue_item);

	//Create a new chatterbox and jump to the Start node
	chatterbox = ChatterboxCreate(dialogueName, false);
	ChatterboxJump(chatterbox, "Start");

	//Update our text elements
	refresh_text_elements();
}else{
	//Set the default font for Scribble to use
	scribble_font_set_default("font_dialogue");

	//Load in our source file from Chatterbox
	ChatterboxLoadFromFile(dialogueName);

	scribble_typists_add_event("speaker", speaker_change);

	scribble_typists_add_event("choice", dialogue_choice);
	
	scribble_typists_add_event("giveitem", dialogue_item);

	//Create a new chatterbox and jump to the Start node
	chatterbox = ChatterboxCreate(dialogueName, false);
	ChatterboxJump(chatterbox, "Start");

	//Update our text elements
	refresh_text_elements();

}