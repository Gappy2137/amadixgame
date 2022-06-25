event_inherited();

collision = false;

angle = 0;

windangle = 0;

finalangle = 0;

acc = 2;

yorigin = 30;

shadowOriginY = 2;
shadowOriginX = 0;
shadowStyle = spr_shadow_player;
shadowAlpha = 0.6;

shadowEnable = true;

anim_enable = false;
anim_frame_num = 4;
anim_frame = irandom(anim_frame_num);
anim_speed = 0;
if (anim_enable){
	anim_frame = irandom(anim_frame_num);
	anim_speed = 0.1;
}

timer = 0;

rnd = random_range(0.8, 1.3);

resetAngle = true;
resetAngleTimer = 10;
wtr = false;

shallowwater = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_shallowwater16, false, true);
if (shallowwater) wtr = true;
if (shallowwater){
	shadowEnable = false;
	yorigin = 28;	
}