
//EKWIPUNEK
#macro ADDITIONALSLOTS 4
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
#macro C_TYPE 2
#macro C_ITEM 0
#macro C_AMOUNT 1
#macro C_LVL 2
#macro C_CAP 3
#macro C_STATION 3
#macro CRAFTITEMTYPE 10000
//
//
//CZCIONKI
global.font_itemnum = font_add_sprite(spr_font_item_num, ord("0123456789-.%"), false, 1);
//
#macro GAMESPEED 60
#macro INSTANCE_LOAD_DISTANCE 164
#macro GAMEWIDTH 480
#macro GAMEHEIGHT 270

//480 270
//640 360

game_set_speed(GAMESPEED, gamespeed_fps);

#macro CLOCKTICK 0.004
#macro MAINSCR "Important"

// DEPTH HIERARCHY

#macro DEPTH_CURSOR -10009
#macro DEPTH_UI -10008

#macro DEPTH_TRANSITION -10007

#macro DEPTH_FOG -100006

#macro DEPTH_LAYERFX_1 -100005
#macro DEPTH_LAYERFX_2 -100004
#macro DEPTH_LAYERFX_3 -100003

#macro DEPTH_FOREGROUND_1 -100002
#macro DEPTH_FOREGROUND_2 -100001
#macro DEPTH_FOREGROUND_3 -100000

alarm[2] = 1;

depth = DEPTH_TRANSITION;

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

enum entityState {
	idle = 0,
	moving = 1,
	wading = 2,
	swimming = 3,
}

enum entityStateAction {
	none = 0,
	attack = 1,
	block = 2,
	
}

enum entityAiType {
	disabled = 0,
	followSimple = 1,
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

enum craftingStation {
	none = 0,
	craft_basic_1 = 1,
	craft_basic_2 = 2,
	craft_basic_3 = 3,
	cooking_1 = 4,
	cooking_2 = 5,
	cooking_3 = 6
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
refTimerPi = 0;
refTimer10 = 0;

global.savingRoom = false;

global.mainTimer = 0;
alarm[1] = GAMESPEED;

alarm[0] = 5;



//room data
global.roomData = {
	devroom_3 : 0,
	devroom_b : 0,
	devroom_c : 0,
	devroom_cave : 0
}