draw_sprite_general(spr_inventory_items, 0, x_frame*24, y_frame*24, 24, 24, newItemX - x_offset + 16, newItemY - y_offset, 1, 1, 0, c_white, c_white, c_white, c_white, alpha);
draw_set_font(global.font_itemnum);
draw_text_transformed_color(newItemX + 22, newItemY, newItemAmount, .5, .5, 0, c_white, c_white, c_white, c_white, alpha);