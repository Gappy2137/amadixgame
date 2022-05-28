//MAKRA

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
//
//EFEKTY
#macro EF_EFFECT 0
#macro EF_DURATION 1
#macro EF_AMPLIFIER 2
#macro EF_TIMER 3
//
//
//CZCIONKI
global.font_itemnum = font_add_sprite(spr_font_item_num, ord("0123456789-.%"), false, 1);
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
	handgun = 4,
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

refTimer = 0;