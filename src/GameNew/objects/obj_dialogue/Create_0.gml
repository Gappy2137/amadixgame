if (instance_number(obj_dialogue) > 1){instance_destroy(); exit;}

mes[0] = -1;



message_next[0] = -1;

myPortrait[0] = -1;

myEmotion[0] = -1;

myName[0] = -1;

myChoice = -1;

choice = -1;

write = 0; 

timer = 0;

message_current = 0;

nextchoice = -1;

dialboxX = 145;
dialboxY = 200;
dialbox_width = 192;
dialbox_height = 64;

portraitboxX = 112;
portraitbox_wh = 64;

depth = -2;

alarm[0] = 1;

//Emocje
enum dialogueEmotion{
	normal		= 0,
	happy		= 1,
	angry		= 2,
	sad			= 3
}