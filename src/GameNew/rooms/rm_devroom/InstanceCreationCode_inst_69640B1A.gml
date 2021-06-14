var i = 0;

//choice = nextchoice;

switch(choice){
	case -1:
		//0 tekst
		mes[i] = "Mój stary to [shake]fanatyk wędkarstwa[/shake].";
		myPortrait[i] = spr_portrait_test;
		myEmotion[i] = dialogueEmotion.normal;
		myName[i] = "[pin_center]Gościu";
		message_next[i] = 1;
		myChoice[i] = -1;
		
		//1 tekst
		i++;
		mes[i] = "Mój też.";
		myPortrait[i] = spr_portrait_amadix;
		myEmotion[i] = dialogueEmotion.normal;
		myName[i] = "[pin_center]Gościu";
		message_next[i] = 2;
		myChoice[i] = -1;
		
		//2 tekst
		i++;
		mes[i] = "[wheel]O nie.[/wheel]";
		myPortrait[i] = spr_portrait_test;
		myEmotion[i] = dialogueEmotion.sad;
		myName[i] = "[pin_center]Gościu";
		message_next[i] = 3;
		myChoice[i] = -1;
		
		//3 tekst
		i++;
		mes[i] = ["[speed,0.25][wobble]O tak.[/wobble][/speed]", "Nie."];
		myPortrait[i] = spr_portrait_amadix;
		myEmotion[i] = dialogueEmotion.angry;
		myName[i] = "[pin_center]Gościu";
		message_next[i] = -1;
		myChoice[i] = 0;
	break;
	case 0:
		//0 tekst
		mes[i] = "Wybór.";
		myPortrait[i] = spr_portrait_test;
		myEmotion[i] = dialogueEmotion.normal;
		myName[i] = "[pin_center]Gościu";
		message_next[i] = 1;
		myChoice[i] = -1;
	break;
}