event_inherited();

draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, angle, c_white, 1);

if (itemOverlay != -1){
	draw_sprite_ext(itemOverlay, itemOverlayState, x, y, 1, 1, angle, c_white, 1);
}
/*
shadowOriginX = 0;
shadowOriginY = 0;
shadowStyle = spr_shadow_big;
shadowAlpha = 0.6;

shadowEnable = true;