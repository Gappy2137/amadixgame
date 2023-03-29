// Inherit the parent event
event_inherited();

image_speed = 0;

yorigin = 20;

shadowOriginX = 16;
shadowOriginY = 32;
shadowStyle = spr_shadow_big;
shadowAlpha = 0.3;

shadowEnable = true;

depth = -(bbox_bottom - (sprite_height - yorigin) + zaxis);
