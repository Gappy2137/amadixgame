var new_scale	= lerp(scale_change_start, scale_change_target, scale_change_timer/scale_change_speed);
image_xscale	= new_scale;
image_yscale	= new_scale;
scale_change_timer++;