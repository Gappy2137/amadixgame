if (cutsceneStep <= 0){cutsceneStep = 0;}else{cutsceneStep--;}
if (cutsceneStep != 0){exit;}

choiceNum = (ChatterboxGetOptionCount(chatterbox));

#region Work out if all of our text elements have stopped fading in

var _complete = true;
var _i = 0;
repeat(array_length(text_elements))
{
    if (text_elements[_i].typist.get_state() < 1.0)
    {
        _complete = false;
        break;
    }
    
    ++_i;
}

#endregion

if (ChatterboxGetOptionCount(chatterbox)){
        var _i = 0;
        repeat(array_length(text_elements)){
            text_elements[_i].typist.skip();
            ++_i;
        }
}

if (_complete){
    //If all of the text element have faded in, allow for user input
    
    if (ChatterboxIsWaiting(chatterbox)){
		waitArrow = true;
		
        if (mouse_check_button_pressed(mb_left)){
		    ChatterboxContinue(chatterbox);
		    refresh_text_elements();
        }
    }else if (ChatterboxGetOptionCount(chatterbox)){
		
		
		var _index = undefined;
		
		#region Sprawdz czy mysz jest nad odpowiedzia 
		
		var mousex = device_mouse_x_to_gui(0);
		var mousey = device_mouse_y_to_gui(0);

		if (isbounded(mousex, choiceboxX, choiceboxX + dialbox_width - 6)) && (isbounded(mousey, choiceboxY, choiceboxY + choicebox_height)){
			onChoice[0] = 1;
			onChoice[1] = 0;
			onChoice[2] = 0;
			onChoice[3] = 0;
			if (mouse_check_button_pressed(mb_left)) && (choiceNum >= 1) _index = 0 + choiceScroll;
		}else
		if (isbounded(mousex, choiceboxX, choiceboxX + dialbox_width - 6)) && (isbounded(mousey, choiceboxY + 16, choiceboxY + choicebox_height + 16)){
			onChoice[0] = 0;
			onChoice[1] = 1;
			onChoice[2] = 0;
			onChoice[3] = 0;
			if (mouse_check_button_pressed(mb_left)) && (choiceNum >= 2) _index = 1 + choiceScroll;
		}else
		if (isbounded(mousex, choiceboxX, choiceboxX + dialbox_width - 6)) && (isbounded(mousey, choiceboxY + 32, choiceboxY + choicebox_height + 32)){
			onChoice[0] = 0;
			onChoice[1] = 0;
			onChoice[2] = 1;
			onChoice[3] = 0;
			if (mouse_check_button_pressed(mb_left)) && (choiceNum >= 3) _index = 2 + choiceScroll;
		}else
		if (isbounded(mousex, choiceboxX, choiceboxX + dialbox_width - 6)) && (isbounded(mousey, choiceboxY + 48, choiceboxY + choicebox_height + 48)){
			onChoice[0] = 0;
			onChoice[1] = 0;
			onChoice[2] = 0;
			onChoice[3] = 1;
			if (mouse_check_button_pressed(mb_left)) && (choiceNum >= 4) _index = 3 + choiceScroll;
		}else{
			onChoice[0] = 0;
			onChoice[1] = 0;
			onChoice[2] = 0;
			onChoice[3] = 0;
		}
		#endregion
		
		#region Scroll
		
		if (choiceNum > 4){
			
			if (choiceScroll < 0)
				choiceScroll = 0;
				
			if (choiceScroll > choiceNum)
				choiceScroll = choiceNum;
			
			if (mouse_wheel_up()) && (choiceScroll > 0){
				choiceScroll--;
				refresh_text_options();
			}
			
			if (mouse_wheel_down()) && (choiceScroll < choiceNum - 4){
				choiceScroll++;
				refresh_text_options();
			}
		}
		
		#endregion
		in = _index;
		waitArrow = false;
        if (_index != undefined){
			in = _index;
			choiceScroll = 0;
			choiceAnim = false;
			choiceAnimDone = true;
			boxType = 4;
			//choiceAnimMid = false;
            //If the player pressed a number key, choose the corresponding option
            ChatterboxSelect(chatterbox, _index);
            //Always update your text elements after advancing chatterbox!
            refresh_text_elements();
        }
    }else{
		waitArrow = false;	
	}
}else{
	waitArrow = false;
	
    //If the text elements *haven't* all finished fading in...
    if (mouse_check_button_pressed(mb_left)){
        //...and the player has pressed space then tell our Scribble typisy to skip the fade in and just display all the text
        var _i = 0;
        repeat(array_length(text_elements)){
            text_elements[_i].typist.skip();
            ++_i;
        }
    }
}

switch(myPortrait){
	case "-1":
		if (choiceNum == 0){
			boxType = 2;
			textfix = 32;
			choiceAnim = false;
			choiceAnimDone = false;
		}else{
			boxType = 3;
			choiceAnim = true;
		}
	break;
	case "spr_portrait_amadix":
		boxType = 0;	
		textfix = 64;
		choiceAnim = false;
		choiceAnimDone = false;
	break;
	default:
		if (choiceNum == 0){
			boxType = 1;	
			textfix = 0;
			choiceAnim = false;
			choiceAnimDone = false;
		}else{
			boxType = 3;
			choiceAnim = true;
		}
	break;
}



var _mid = 16;

if (choiceAnim){
	
	if (choiceboxStep <= 0){
		choiceboxStep = 0;	
	}else{
		choiceboxStep--;
	}
	
	choicebox1_x = lerp(choicebox1_x, choicebox1_tox, .3);
	choicebox2_x = lerp(choicebox2_x, choicebox2_tox, .3);
	choiceport_x = lerp(choiceport_x, choiceport_tox, .3);
	
	choiceboxX2[0] = lerp(choiceboxX2[0], choicebox2_tox, .45);
	choiceboxX2[1] = lerp(choiceboxX2[1], choicebox2_tox, .4);
	choiceboxX2[2] = lerp(choiceboxX2[2], choicebox2_tox, .35);
	choiceboxX2[3] = lerp(choiceboxX2[3], choicebox2_tox, .3);
	
	//if ((round(choicebox1_x) >= choicebox1_tox + _mid) && (round(choicebox1_x) <= choicebox1_tox + _mid + 8)){
	//	choiceAnimMid = true;	
	//}
	if (round(choicebox1_x) == choicebox1_tox){

		choicebox1_x = choicebox1_fromx;
		choicebox2_x = choicebox2_fromx;
		choiceport_x = choiceport_fromx;
		choiceboxX2[0] = choicebox2_fromx;
		choiceboxX2[1] = choicebox2_fromx;
		choiceboxX2[2] = choicebox2_fromx;
		choiceboxX2[3] = choicebox2_fromx;
	
		choiceAnimDone = true;
		//choiceAnimMid = false;
		choiceAnim = false;
	}
	
}
if (choiceAnimDone){
	choiceboxStep = choiceboxSteps;
	choicebox1_x = choicebox1_fromx;
	choicebox2_x = choicebox2_fromx;
	choiceport_x = choiceport_fromx;
	choiceboxX2[0] = choicebox2_fromx;
	choiceboxX2[1] = choicebox2_fromx;
	choiceboxX2[2] = choicebox2_fromx;
	choiceboxX2[3] = choicebox2_fromx;
	choiceAnim = false;
	//choiceAnimMid = true;
	textfix = 128;	
}