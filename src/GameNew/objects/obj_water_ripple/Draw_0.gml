if (!instance_exists(obj_wateroverlay)){exit;}

surface_set_target(obj_wateroverlay.rippleSurface);

draw_sprite_ext(spr_water_ripple_single, 0, x, y, scale, scale, 0, c_white, alpha);

surface_reset_target();