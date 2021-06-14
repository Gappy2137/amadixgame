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
*/
type = 0;
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
anim_frame = 0;
anim_speed = 0.05;
anim_frame_num = 1;

alarm[0] = 5;