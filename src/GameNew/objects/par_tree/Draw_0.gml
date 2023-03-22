event_inherited();

finalalpha = alpha;

draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, finalangle, c_white, finalalpha);

if (itemOverlay != -1){
	draw_sprite_ext(itemOverlay, itemOverlayState, x, y, 1, 1, finalangle, c_white, finalalpha);
}


/*
shadowOriginX = 0;
shadowOriginY = 0;
shadowStyle = spr_shadow_big;
shadowAlpha = 0.6;

shadowEnable = true;