function refresh_text_options(){
	
		choice_elements = [];
	
		var _x = textX;
	    var _y = textY - 2;
	
        var _i = choiceScroll;
        repeat(ChatterboxGetOptionCount(chatterbox)){
		
			
			_string = "";
            
            //Add a number prompt
            //_string += string(_i+1) + ") ";
            
            //aaaand add the actual option string too
			if (_i < (4 + choiceScroll))
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
			_y += 16;
            ++_i;
        }
}