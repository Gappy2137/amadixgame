/// @description scr_draw_slot_none(x, y, alpha, blend)
function scr_draw_slot_none(argument0, argument1, argument2, argument3) {
	if argument3 == false{
		draw_sprite_ext(spr_inv_slot_nonexistent, 0, argument0, argument1, scale, scale, 0, c_white, argument2);
	}else{
		gpu_set_blendmode(bm_add);
		draw_sprite_ext(spr_inv_slot_nonexistent, 0, argument0, argument1, scale, scale, 0, c_white, argument2);
		gpu_set_blendmode(bm_normal);
	}


}
