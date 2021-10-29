var i = 0;

switch(choice){
	case -1:
		//0 tekst
		mes[i] = "Text."
		message_next[i] = 1;
		myPortrait[i] = spr_portrait_test;
		myEmotion[i] = dialogueEmotion.normal;
		myName[i] = "[pin_center]Gościu";
		
		//1 tekst
		i++;
		mes[i] = "Text 2."
		message_next[i] = 2;
		myPortrait[i] = spr_portrait_test;
		myEmotion[i] = dialogueEmotion.happy;
		myName[i] = "[pin_center]Gościu";
		
		//2 tekst
		i++;
		mes[i] = "Text 3."
		message_next[i] = -1;
		myPortrait[i] = spr_portrait_test;
		myEmotion[i] = dialogueEmotion.sad;
		myName[i] = "[pin_center]Gościu";
	break;
}