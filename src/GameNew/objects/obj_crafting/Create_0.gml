show_crafting = false;


craftingUISlotbackX = 113;
craftingUISlotbackY = 68;


craftingUIArrowX = 161;
invUIArrowX = 407;
craftingUIArrowY[0] = 54;
craftingUIArrowY[1] = 218;

invUISlotbackX = 386;
invUISlotbackY = 67;

craftingUItabX = 42;
craftingUItabY[0] = 64;
craftingUItabY[1] = 88;
craftingUItabY[2] = 112;
craftingUItabY[3] = 136;
craftingUItabY[4] = 160;
craftingUItabActive[0] = true;
craftingUItabActive[1] = false;
craftingUItabActive[2] = false;
craftingUItabActive[3] = false;
craftingUItabActive[4] = false;

craftButtonX = 296;
craftButtonY = 196;
craftButtonActive = false;

invUIX = 388;
invUIY = 72;

craftUIX = 117;
craftUIY = 72;

craftRow = 0;
craftSlots = 0;
craftSlotsWidth = 4;
craftSlotsHeight = 6;
craftSlotsOnPage = 24;

invRow = 0;
invSlots = obj_inventory.inv_slots - 4;
invSlotsWidth = 3;
invSlotsHeight = 6;
invSlotsOnPage = 18;

cell_size = 24;

spr_inv_items_columns = sprite_get_width(spr_inventory_items)/cell_size;

selected_slot_craft = -1;
selected_slot_eq = -1;

mousex = 0;
mousey = 0;

mouse_slotx = 0;
mouse_sloty = 0;

/*
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

craft_slots = 84 * 2;
craft_slots_width = 12;
craft_slots_height = 7;

spr_inv_items = spr_inventory_items;
spr_inv_slot_nonexistent = spr_item_slot_nonexistent;
spr_inv_slot_none = spr_item_slot_none;
spr_inv_slot_selected = spr_item_slot_selected;

spr_craft_items_columns = sprite_get_width(spr_crafting_hud)/cell_size;
spr_craft_items_rows = sprite_get_height(spr_crafting_hud)/cell_size;

page = 0;
*/
global.recipes = ds_grid_create(4, 1);

enum recipe_type{
	none = 0,
	resources = 1,
	clothes = 2,
	cooking = 3,
	tools = 4
}

var recipeOne = [
	[item.lemon, 1],
	[item.apple, 2],
	[item.strawberry, 1]
];
recipe_add(recipeOne, item.mango_salsa, 1, recipe_type.cooking);

var recipeTwo = [
	[item.stick, 2],
	[item.log, 1]
];
recipe_add(recipeTwo, item.sword, 1, recipe_type.tools);