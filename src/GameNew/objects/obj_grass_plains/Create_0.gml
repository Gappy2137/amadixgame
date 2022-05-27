event_inherited();

collision = false;

angle = 0;

acc = 2;

yorigin = 30;

en = -1;

shadowOriginY = 2;
shadowOriginX = 0;
shadowStyle = spr_shadow_player;
shadowAlpha = 0.6;

shadowEnable = true;

anim_enable = true;
anim_frame_num = 4;
anim_frame = 0;
anim_speed = 0;
if (anim_enable){
	anim_frame = random(anim_frame_num);
	anim_speed = 0.1;
}
/*
_spr = sprite_index;

_texture = sprite_get_texture(_spr, anim_frame);


_width = sprite_get_width(_spr);
_height = sprite_get_height(_spr);

done = false;
