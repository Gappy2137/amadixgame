function refresh_text_elements(){
    text_elements = [];
	choice_elements = [];
    
    //Set all the Scribble t
	var _x = textX;
    var _y = textY;
	
	var _typist_speed = 0.5;
    
    //Iterate over all the content strings
    var _i = 0;
    repeat(ChatterboxGetContentCount(chatterbox)){
        //Cache a new text element using the content text Chatterbox found
        var _element = scribble(ChatterboxGetContent(chatterbox, _i));
        
        //Create a new typist for the text element, and tell it to start typing in
        
        
		if (boxType == 3){
			var _typist = scribble_typist().skip();
		}else{
			var _typist = scribble_typist().in(_typist_speed, 0);
		}
		
        //Store our new text element and typist
        array_push(text_elements, {
            x: _x,
            y: _y,
            element: _element,
            typist: _typist
        });
		

        
        //Move down a bit to make each content string look like a paragraph
        _y += _element.get_height(_element);
        ++_i;
    }
    
    //Ident our options slightly
    _x = choicebox2_x + 4;
    
    //Space out the options from the content a little too
    //_y -= 32;
    
    if (ChatterboxIsWaiting(chatterbox)){

    }else{
		
        var _i = 0;
        repeat(ChatterboxGetOptionCount(chatterbox)){
			
            //Start formatting our string with some colour!
            switch(_i){
                case 0: var _string = "[#FFFFFF]"; break;
                case 1: var _string = "[#FFFFFF]"; break;
                case 2: var _string = "[#FFFFFF]"; break;
                case 3: var _string = "[#FFFFFF]"; break;
            }
            
            //Add a number prompt
            _string += string(_i+1) + ") ";
            
            //aaaand add the actual option string too
            _string += ChatterboxGetOption(chatterbox, _i);
            
            //Cache a new text element using our formatted string
            var _element = scribble(_string);
            
            //Create a new typist for the text element, and tell it to start typing in
            var _typist = scribble_typist().skip();
            
            //Store our new text element and typist
            array_push(choice_elements, {
                x: _x,
                y: _y,
                element: _element,
                typist: _typist
            });
            
            //Move down a bit to visually separate each option
            _y += _element.get_height();
            ++_i;
        }
    }
}