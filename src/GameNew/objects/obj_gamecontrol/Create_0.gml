//MAKRA

//EKWIPUNEK
#macro ITEM 0
#macro AMOUNT 1
#macro TYPE 2
#macro MAXSTACK 3
#macro HP 4
#macro STAMINA 5
#macro LEVEL 6
#macro DAMAGE 7
#macro DEFENCE 8
#macro EFFECT1 9
#macro EFFECT2 10
#macro EFFECT3 11
//
//EFEKTY
#macro EFFECT 0
#macro DURATION 1
#macro AMPLIFIER 2
#macro TIMER 3
//
//
randomize();

guiWidth = display_get_gui_width();
guiHeight = display_get_gui_height();

alpha = 0;

newRoom = -1;
newX = 0;
newY = 0;
doTransition = false;
oldfacing = -1;

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
	attacking_range = 4,
	
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
global.playerTorso = "classic_hoodie";
global.playerLegs = "classic_jeans";
global.playerBoots = "classic_boots";
global.playerHands = "short";
global.playerHat = "none";
global.playerEyewear = "none";

global.hp = 100;
global.maxhp = 100;

global.stamina = 100;
global.maxstamina = 100;

global.time = 0;
minutes = 0;
hours = 0;
global.daycycletime = 0;