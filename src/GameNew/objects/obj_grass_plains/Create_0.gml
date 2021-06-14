event_inherited();

collision = false;

angle = 0;

acc = 2;

yorigin = 0;

en = -1;

shadowOriginY = 2;
shadowOriginX = 0;
shadowStyle = spr_shadow_player;
shadowAlpha = 0.6;

shadowEnable = true;

anim_frame = choose(0, 1);
anim_speed = 0.05;
anim_frame_num = 4;
var ins = instance_place(x, y, obj_grass_plains);
if (ins){
	if (ins.y == y){
		with (ins){
			y = y;
		}
	}
}