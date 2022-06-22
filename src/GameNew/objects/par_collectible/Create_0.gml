event_inherited();

cancollide = true;

image_speed = 0;

itemDrop = -1;

itemNum = 0;
itemNumMax = 0;

itemRegTime = -1;

itemOverlay = -1;

timer = itemRegTime;

flag = false;

canclick = true;

itemOverlayState = 0;

amount = 1;

/*
0 - zwykly (kolizja bez etapow)
1 - krzak (kolizja z overlay)
2 - krzak 2 (kolizja z etapami)
3 - krzak 3 (brak kolizji z overlay)
4 - krzak 4 (brak kolizji z etapami)
5 - przedmiot (kolizja + usuniecie)
6 - krzak 5 (bez kolizji + usuniecie)
*/

enum collectible_type{
	col_nostage		= 0,
	col_overlay		= 1,
	col_stage		= 2,
	nocol_overlay	= 3,
	nocol_stage		= 4,
	col_delete		= 5,
	nocol_delete	= 6
}

type = collectible_type.col_nostage;
shake = false;
rotate = false;
rotoncol = false;

shakex = 0;
shakeflag = false;
shaketimer = 15;

angle = 0;
angle2 = 0;

collision = false;

acc = 2;

en = -1;

isanim = false;
anim = 0;
acc2 = .75;

anim_enable = false;
anim_frame_num = 4;
anim_frame = 0;
anim_speed = 0;
if (anim_enable){
	anim_frame = irandom(anim_frame_num);
	anim_speed = 0.1;
}

enableWind = false;

windangle = 0;
finalangle = 0;

windTimer = 0;

rnd = random_range(0.8, 1.3);

resetAngle = true;
resetAngleTimer = 10;

shallowwater = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_shallowwater16, false, true);
if (shallowwater){shadowEnable = false;}

if (type == 0) || (type == 1) || (type == 2) || (type == 5){
	cancollide = true;
}else{
	cancollide = false;	
}