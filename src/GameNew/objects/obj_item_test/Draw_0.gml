/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
var sx = (4 mod obj_inventory.spr_inv_items_columns) * 24;
var sy = (4 div obj_inventory.spr_inv_items_columns) * 24;
draw_sprite_general(spr_inventory_items, 0, sx, sy, 24, 24, x, y, 1, 1, image_angle, c_white, c_white, c_white, c_white, 1);