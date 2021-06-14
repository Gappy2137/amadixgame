/// @description scr_draw_item(left, top, x, y, alpha)
function scr_draw_item(argument0, argument1, argument2, argument3, argument4) {
		draw_sprite_part_ext(spr_inv_items, 0, argument0, argument1, cell_size, cell_size, argument2, argument3, scale, scale, c_white, argument4);
}
