// Inherit the parent event
event_inherited();

anim_frame = 0;
anim_speed = 0;
anim_frame_num = 0;
anim_index = 1;

facing = index_facing.down;

yorigin = 31;

cancollide = true;

shadowOriginY = 34;
shadowStyle = spr_shadow_player;
shadowAlpha = 0.5;

shadowEnable = true;

dialogue = "test_en.yarn";

canClickAt = false;
clickRadius = 6;
cursorSpr = cursorState.normal;
canTalkTo = false;
cursorChange = false;

// Zachowanie
// 0 - oglada sie po kliknieciu w strone gracza
// 1 - oglada sie w strone obiektu
npcBehaviour = 0;

npcLookAt = -1;

//right = 0,
//up = 1,
//left = 2,
//down = 3,