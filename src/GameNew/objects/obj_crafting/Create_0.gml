show_crafting = false;

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

craft_slot_width = sprite_get_width(spr_crafting_hud);
craft_slot_height = sprite_get_height(spr_crafting_hud);

craft_slot_x = (gui_width/2) - ((craft_slot_width/2));
craft_slot_y = (gui_height/2) - ((craft_slot_height/2));

slots_x = craft_slot_x;
slots_y = craft_slot_y;
mouse_slotx = 0;
mouse_sloty = 0;

selected_slot = -1;

craft_slots = 84 * 2;
craft_slots_width = 12;
craft_slots_height = 7;

cell_size = 24;

spr_inv_items = spr_inventory_items;
spr_inv_slot_nonexistent = spr_item_slot_nonexistent;
spr_inv_slot_none = spr_item_slot_none;
spr_inv_slot_selected = spr_item_slot_selected;

spr_craft_items_columns = sprite_get_width(spr_crafting_hud)/cell_size;
spr_craft_items_rows = sprite_get_height(spr_crafting_hud)/cell_size;

page = 0;

global.recipes = ds_grid_create(2, 1);

enum recipe_type{
	none = 0,
	cooking = 1,
	resources = 2,
}

value1 = 0;
value2 = 0;

ds_result_info = ds_grid_create(11, item.height);

var recipe_ss = ds_grid_create(2, 1);
recipe_ss[# ITEM, 0] = item.none;
recipe_ss[# AMOUNT, 0] = 0;
recipe_add(recipe_ss, item.none, 0, recipe_type.none);


var recipe_one = ds_grid_create(2, 4);
recipe_one[# ITEM, 0] = item.lemon;
recipe_one[# AMOUNT, 0] = 1;
recipe_one[# ITEM, 1] = item.apple;
recipe_one[# AMOUNT, 1] = 2;
recipe_one[# ITEM, 2] = item.strawberry;
recipe_one[# AMOUNT, 2] = 3;
recipe_one[# ITEM, 3] = item.orange;
recipe_one[# AMOUNT, 3] = 4;
recipe_add(recipe_one, item.bull_energy_drink, 1, recipe_type.cooking);

var recipe_two = ds_grid_create(2, 1);
recipe_two[# ITEM, 0] = item.log;
recipe_two[# AMOUNT, 0] = 4;
recipe_add(recipe_two, item.stick, 4, recipe_type.resources);

var recipe_three = ds_grid_create(2, 3);
recipe_three[# ITEM, 0] = item.orange;
recipe_three[# AMOUNT, 0] = 2;
recipe_three[# ITEM, 1] = item.apple;
recipe_three[# AMOUNT, 1] = 2;
recipe_three[# ITEM, 2] = item.strawberry;
recipe_three[# AMOUNT, 2] = 2;
recipe_add(recipe_three, item.mango_salsa, 1, recipe_type.cooking);

var recipe_four = ds_grid_create(2, 2);
recipe_four[# ITEM, 0] = item.stick;
recipe_four[# AMOUNT, 0] = 2;
recipe_four[# ITEM, 1] = item.stone;
recipe_four[# AMOUNT, 1] = 4;
recipe_add(recipe_four, item.sword, 1, recipe_type.resources);