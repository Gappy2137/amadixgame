//event_inherited();

collision = false;

angle = 0;

windangle = 0;

finalangle = 0;

acc = 2;

yorigin = 31;

angleTreshold = 2;

shadowOriginY = 2;
shadowOriginX = 0;
shadowSizeX = 0.7;
shadowSizeY = 0.8;
shadowStyle = spr_shadow_small;
shadowAlpha = 0.2;

shadowEnable = true;

wind_enable = true;
anim_enable = false;
isWind = false;
anim_frame_num = 4;
anim_frame = image_index;
anim_speed = 0;


randomWindPattern = irandom_range(0, 9);

resetAngle = true;
resetAngleTimer = 10;
wtr = false;

canBeHurtByPlayer = true;

hitangle = 0;

zaxis = 0;

var zf = instance_place(x, y, par_zfloor);
if (zf){
	zaxis = zf.zflr;	
}else{
	zaxis = 0;	
}

shallowwater = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_shallowwater16, false, true);
if (shallowwater){
	wtr = true;
	shadowEnable = false;
	//yorigin -=2 ;
	//yorigin = 30;
	//y += 4;
}

cull = 2;

alarm[0] = 1;
alarm[11] = 1;
alarm[5] = 10;