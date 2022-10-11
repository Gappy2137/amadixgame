depth = -10000;

//EKWIPUNEK
#macro INVITEM 0
#macro INVAMOUNT 1
#macro INVTYPE 2
#macro MAXSTACK 3
#macro INVHP 4
#macro INVSTAMINA 5
#macro INVLEVEL 6
#macro INVDAMAGE 7
#macro INVDEFENCE 8
#macro INVEFFECTS 9
#macro INVTEMPERATURE 10
#macro INVCAP 11
#macro MAXCAP 12
//
//EFEKTY
#macro EF_EFFECT 0
#macro EF_DURATION 1
#macro EF_AMPLIFIER 2
#macro EF_TIMER 3
//
//CRAFTING
#macro C_ING 0
#macro C_RES 1
#macro C_RESAM 2
#macro C_TYPE 3
//
//
//CZCIONKI
global.font_itemnum = font_add_sprite(spr_font_item_num, ord("0123456789-.%"), false, 1);
//
#macro GAMESPEED 60
#macro INSTANCE_LOAD_DISTANCE 164
#macro GAMEWIDTH 480
#macro GAMEHEIGHT 270

game_set_speed(GAMESPEED, gamespeed_fps);

#macro CLOCKTICK 0.004

// New seed
randomize();

guiWidth = display_get_gui_width();
guiHeight = display_get_gui_height();

alpha = 0;

newRoom = -1;
newX = 0;
newY = 0;
doTransition = false;
oldfacing = -1;
oldrunning = 0;

enum dirc{
	right = 0,
	up = 90,
	left = 180,
	down = 270,
}

enum index_facing{
	right = 0,
	up = 1,
	left = 2,
	down = 3,
}

enum player_state{
	idle = 0,
	moving = 1,
	wading = 2,
	swimming = 3,
	wading_idle = 4,
	swimming_idle = 5,
	hurt = 6,
	ladder = 7,
}

enum player_state_action{
	none = 0,
	eating = 1,
	drinking = 2,
	attacking_melee = 3,
	handgun = 4,
	pickup = 5,
}

enum lang{
	english = 0,
	polish =  1,
	custom =  2,
}

enum effect{
	none = 0,
	speed_ef = 1,
	stuffed =  2,
	regeneration =  3,
}

enum collectible_type{
	col_nostage		= 0,
	col_overlay		= 1,
	col_stage		= 2,
	nocol_overlay	= 3,
	nocol_stage		= 4,
	col_delete		= 5,
	nocol_delete	= 6
}

global.playerTorso = item.classic_jacket;
global.playerLegs = item.jeans;
global.playerBoots = item.sneakers;
global.playerHands = "short";
global.playerHat = item.none;
global.playerEyewear = item.none;

global.hp = 100;
global.maxhp = 100;

global.stamina = 100;
global.maxstamina = 100;

global.alcoholPoisoning = 0;
global.maxAlcoholPoisoning = 60;


global.time = 0;
minutes = 0;
hours = 0;
global.daycycletime = 0;

global.inDialogue = false;
global.pickUp = false;
global.inEq = false;
global.inConsole = false;
global.eqSlots = true;
global.inChest = false;
global.inChestAnim = false;
global.debugMode = false;
global.debugBbox = false;

refTimer = 0;


global.savingRoom = false;

global.mainTimer = 0;
alarm[1] = GAMESPEED;

alarm[0] = 5;



//room data
global.roomData = {
	devroom_3 : 0,
	devroom_b : 0,
}