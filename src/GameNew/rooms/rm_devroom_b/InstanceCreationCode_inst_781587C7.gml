var i = 0;

switch(choice){
	case -1:
		//0 tekst
		mes[i] = "Plagiat. Plagiat...";
		myPortrait[i] = spr_portrait_test2;
		myEmotion[i] = dialogueEmotion.normal;
		myName[i] = "[pin_center]Sobierajski";
		message_next[i] = 1;
		myChoice[i] = -1;
		
		//1 tekst
		i++;
		mes[i] = "[shake]Kolejny plagiat![/shake]";
		myPortrait[i] = spr_portrait_test2;
		myEmotion[i] = dialogueEmotion.angry;
		myName[i] = "[pin_center]Sobierajski";
		message_next[i] = 2;
		myChoice[i] = -1;
		
		//2 tekst
		i++;
		mes[i] = "Ściąganie i udostępnianie całego kodu lub jego fragmentu jest naruszeniem regulaminu studiów i kwalifikuje się na [shake]Komisję Dyscyplinarną.[/shake]";
		myPortrait[i] = spr_portrait_test2;
		myEmotion[i] = dialogueEmotion.normal;
		myName[i] = "[pin_center]Sobierajski";
		message_next[i] = -1;
		myChoice[i] = -1;
	break;
}