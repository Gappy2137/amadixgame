event_inherited();

collision = false;

angle = 0;

windangle = 0;

finalangle = 0;

acc = 2;

yorigin = 31;

shadowOriginY = 2;
shadowOriginX = 0;
shadowSizeX = 2;
shadowSizeY = 1;
shadowStyle = spr_shadow_big;
shadowAlpha = 0.2;

shadowEnable = true;

wind_enable = true;
anim_enable = false;
isWind = false;
anim_frame_num = 4;
anim_frame = image_index;
anim_speed = 0;


timer = 0;

rnd = random_range(0.8, 1.3);

resetAngle = true;
resetAngleTimer = 10;
wtr = false;

var zf = instance_place(x, y, par_zfloor);
if (zf){
	zfloor = zf.zflr;	
}else{
	zfloor = 0;	
}

shallowwater = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_shallowwater16, false, true);
if (shallowwater){
	wtr = true;
	shadowEnable = false;
	//yorigin -=2 ;
	//yorigin = 30;
	//y += 4;
}

alarm[0] = 1;