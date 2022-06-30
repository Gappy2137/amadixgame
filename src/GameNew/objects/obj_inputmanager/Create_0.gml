/*
//--------------------
// 0 - no input
// 1 - main game screen
// 2 - inventory screen
// 3 - console
//--------------------
inputPriority = 1;

// Player
input_default_key(ord("W"), "up");
input_default_key(ord("S"), "down");
input_default_key(ord("A"), "left");
input_default_key(ord("D"), "right");

input_default_key(vk_shift, "run");

// Inventory
input_default_key(ord("E"), "inventoryAccess");
input_default_key(ord("1"), "inventory_1");
input_default_key(ord("2"), "inventory_2");
input_default_key(ord("3"), "inventory_3");
input_default_key(ord("4"), "inventory_4");
input_default_key(ord("5"), "inventory_5");
input_default_key(ord("6"), "inventory_6");
input_default_key(ord("7"), "inventory_7");
input_default_key(ord("8"), "inventory_8");
input_default_key(ord("9"), "inventory_9");
input_default_key(ord("0"), "inventory_0");
input_default_key(vk_hyphen, "inventory_-");
input_default_key(vk_equals, "inventory_=");
input_default_key(vk_shift, "shift");


// Gun logic
input_default_key(ord("R"), "reload");

// Console
input_default_key(vk_bslash, "console");

// General
input_default_mouse_button(mb_left, "mouseLeft");
input_default_mouse_button(mb_right, "mouseRight");
input_default_mouse_button(mb_middle, "mouseMiddle");

// Keyboard and mouse
input_player_source_set(INPUT_SOURCE.KEYBOARD_AND_MOUSE);
