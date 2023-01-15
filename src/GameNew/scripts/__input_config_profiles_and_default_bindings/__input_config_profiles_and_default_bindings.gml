//Input defines the default profiles as a macro called 
//This macro is parsed when Input boots up and provides the baseline bindings for your game
//
//  Please edit this macro to meet the needs of your game!
//
//The root struct called INPUT_DEFAULT_PROFILES contains the names of each default profile
//Default profiles then contain the names of verbs. Each verb should be given a binding that is
//appropriate for the profile. You can create bindings by calling one of the input_binding_*()
//functions, such as input_binding_key() for keyboard keys and input_binding_mouse() for
//mouse buttons

INPUT_DEFAULT_PROFILES = {
    
    keyboard_and_mouse:
    {
        up:    input_binding_key("W"),
        down:  input_binding_key("S"),
        left:  input_binding_key("A"),
        right: input_binding_key("D"),

		run: [input_binding_key(vk_shift)],
		sneak: [input_binding_key(vk_control)],
		
		inventoryAccess: input_binding_key("E"),
		inventory_1: input_binding_key("1"),
		inventory_2: input_binding_key("2"),
		inventory_3: input_binding_key("3"),
		inventory_4: input_binding_key("4"),
		inventory_5: input_binding_key("5"),
		inventory_6: input_binding_key("6"),
		inventory_7: input_binding_key("7"),
		inventory_8: input_binding_key("8"),
		inventory_9: input_binding_key("9"),
		inventory_0: input_binding_key("0"),
		inventory_hyphen: input_binding_key(vk_hyphen),
		inventory_equals: input_binding_key(vk_equals),
		inventory_shift: input_binding_key(vk_shift),
        
        shoot: input_binding_mouse_button(mb_left),
		reload: input_binding_key("R"),
		
		console: input_binding_key(vk_bslash),
		
		mouseLeft: input_binding_mouse_button(mb_left),
		mouseRight: input_binding_mouse_button(mb_right),
		mouseMiddle: input_binding_mouse_button(mb_middle),
    },
    
    gamepad:
    {

    },
    
};

//Names of the default profiles to use when automatically assigning profiles based on the source that a
//player is currently using. Default profiles for sources that you don't intend to use in your game do
//not need to be defined
#macro INPUT_AUTO_PROFILE_FOR_KEYBOARD     "keyboard_and_mouse"
#macro INPUT_AUTO_PROFILE_FOR_MOUSE        "keyboard_and_mouse"
#macro INPUT_AUTO_PROFILE_FOR_GAMEPAD      "gamepad"
#macro INPUT_AUTO_PROFILE_FOR_MIXED        "mixed"
#macro INPUT_AUTO_PROFILE_FOR_MULTIDEVICE  "multidevice"

//Toggles whether INPUT_KEYBOARD and INPUT_MOUSE should be considered a single source at all times
//For most PC games you'll want to tie the keyboard and mouse together but occasionally having them
//separated out is useful
#macro INPUT_ASSIGN_KEYBOARD_AND_MOUSE_TOGETHER  true

//Whether to allow default profiles (see below) to contain different verbs. Normally every profile
//should contain a reference to every verb, but for complex games this is inconvenient
#macro INPUT_ALLOW_ASSYMMETRIC_DEFAULT_PROFILES  true