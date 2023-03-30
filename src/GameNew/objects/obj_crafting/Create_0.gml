show_crafting = false;


craftingUISlotbackX = 113;
craftingUISlotbackY = 68;


craftingUIArrowX = 161;
invUIArrowX = 407;
craftingUIArrowY[0] = 54;
craftingUIArrowY[1] = 218;

pageArrowOnInv[0] = false;
pageArrowOnInv[1] = false;

pageArrowOnCraft[0] = false;
pageArrowOnCraft[1] = false;

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

y_rel = 0;

invUIX = 388;
invUIY = 72;

craftUIX = 117;
craftUIY = 72;

craftRow = 0;
craftSlots = 0;
craftSlotsWidth = 4;
craftSlotsHeight = 6;
craftSlotsOnPage = 24;
craftSlotSelected = -1;
craftSlotSelectedX = 0;
craftSlotSelectedY = 0;

invRow = 0;
invSlots = obj_inventory.inv_slots - ADDITIONALSLOTS;
invSlotsWidth = 3;
invSlotsHeight = 6;
invSlotsOnPage = 18;
inhand = -1;
multipick = 0;
cap = -1;
lvl = 0;

from = 0;
recipeAmount = 0;

cell_size = 24;

spr_inv_items_columns = sprite_get_width(spr_inventory_items)/cell_size;

selected_slot_craft = -1;
selected_slot_eq = -1;

mousex = 0;
mousey = 0;

mouse_slotx = 0;
mouse_sloty = 0;

trashSlotX = 0;
trashSlotY = 219;
trashSlotX2 = 52;
trashSlotY2 = 269;
onTrashSlot = false;

onEqUI = false;
onCraftUI = false;

canThrowOut = true;

currentStation = craftingStation.none;

stationX = 256;
stationY = 208;
stationIm = 0;

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
	
var recipeZero = [
	[item.log, 1]
];
var recipeZeroResult = [item.stick, 4, 0, -1];
	
global.recipes[# C_ING, 0] = recipeZero;
	
global.recipes[# C_RES, 0] = recipeZeroResult;
	
global.recipes[# C_TYPE, 0] = recipe_type.resources;
	
global.recipes[# C_STATION, 0] = craftingStation.none;

var recipeOne = [
	[item.strawberry, 3],
	[item.lemon, 1],
	[item.orange, 1]
];

var recipeOneResult = [item.mango_salsa, 1, 0, -1];
recipe_add(recipeOne, recipeOneResult, recipe_type.cooking, craftingStation.none);


var recipeTwo = [
	[item.stick, 2],
	[item.log, 1]
];
var recipeTwoResult = [item.sword, 1, 0, -1];
recipe_add(recipeTwo, recipeTwoResult, recipe_type.tools, craftingStation.craft_basic_1);

recipe_add([ [item.lemon, 3],[item.orange,3],[item.apple, 3],[item.stick, 1],[item.log, 3] ], [item.bull_energy_drink, 1, 0, 5], recipe_type.cooking, craftingStation.none);

recipe_add([ [item.lemon, 3],[item.orange,3],[item.apple, 3] ], [item.dandelion, 1, 0, -1], recipe_type.cooking, craftingStation.none);

recipe_add([ [item.orange,1],[item.vodka, 3] ], [item.mango_salsa, 1, 0, -1], recipe_type.cooking, craftingStation.none);

recipe_add([ [item.lemon, 3],[item.orange,3],[item.strawberry, 3] ], [item.apple, 3, 0, -1], recipe_type.cooking, craftingStation.none);
recipe_add([ [item.lemon, 3],[item.orange,3],[item.strawberry, 3] ], [item.apple, 3, 0, -1], recipe_type.cooking, craftingStation.none);
recipe_add([ [item.lemon, 3],[item.orange,3],[item.strawberry, 3] ], [item.apple, 3, 0, -1], recipe_type.cooking, craftingStation.none);
recipe_add([ [item.lemon, 3],[item.orange,3],[item.strawberry, 3] ], [item.apple, 3, 0, -1], recipe_type.cooking, craftingStation.none);
recipe_add([ [item.lemon, 3],[item.orange,3],[item.strawberry, 3] ], [item.apple, 3, 0, -1], recipe_type.cooking, craftingStation.none);
recipe_add([ [item.lemon, 3],[item.orange,3],[item.strawberry, 3] ], [item.apple, 3, 0, -1], recipe_type.cooking, craftingStation.none);
recipe_add([ [item.lemon, 3],[item.orange,3],[item.strawberry, 3] ], [item.apple, 3, 0, -1], recipe_type.cooking, craftingStation.none);
recipe_add([ [item.lemon, 3],[item.orange,3],[item.strawberry, 3] ], [item.apple, 3, 0, -1], recipe_type.cooking, craftingStation.none);
recipe_add([ [item.lemon, 3],[item.orange,3],[item.strawberry, 3] ], [item.apple, 3, 0, -1], recipe_type.cooking, craftingStation.none);
recipe_add([ [item.lemon, 3],[item.orange,3],[item.strawberry, 3] ], [item.apple, 3, 0, -1], recipe_type.cooking, craftingStation.none);
recipe_add([ [item.lemon, 3],[item.orange,3],[item.strawberry, 3] ], [item.apple, 3, 0, -1], recipe_type.cooking, craftingStation.none);
recipe_add([ [item.lemon, 3],[item.orange,3],[item.strawberry, 3] ], [item.apple, 3, 0, -1], recipe_type.cooking, craftingStation.none);
recipe_add([ [item.lemon, 3],[item.orange,3],[item.strawberry, 3] ], [item.apple, 3, 0, -1], recipe_type.cooking, craftingStation.none);
recipe_add([ [item.lemon, 3],[item.orange,3],[item.strawberry, 3] ], [item.apple, 3, 0, -1], recipe_type.cooking, craftingStation.none);
recipe_add([ [item.lemon, 3],[item.orange,3],[item.strawberry, 3] ], [item.apple, 3, 0, -1], recipe_type.cooking, craftingStation.none);
recipe_add([ [item.lemon, 3],[item.orange,3],[item.strawberry, 3] ], [item.apple, 3, 0, -1], recipe_type.cooking, craftingStation.none);
recipe_add([ [item.lemon, 3],[item.orange,3],[item.strawberry, 3] ], [item.apple, 3, 0, -1], recipe_type.cooking, craftingStation.none);
recipe_add([ [item.lemon, 3],[item.orange,3],[item.strawberry, 3] ], [item.apple, 3, 0, -1], recipe_type.cooking, craftingStation.none);
recipe_add([ [item.lemon, 3],[item.orange,3],[item.strawberry, 3] ], [item.apple, 3, 0, -1], recipe_type.cooking, craftingStation.none);
recipe_add([ [item.lemon, 3],[item.orange,3],[item.strawberry, 3] ], [item.apple, 3, 0, -1], recipe_type.cooking, craftingStation.none);
recipe_add([ [item.lemon, 3],[item.orange,3],[item.strawberry, 3] ], [item.apple, 3, 0, -1], recipe_type.cooking, craftingStation.none);
recipe_add([ [item.lemon, 3],[item.orange,3],[item.strawberry, 3] ], [item.apple, 3, 0, -1], recipe_type.cooking, craftingStation.none);
recipe_add([ [item.lemon, 3],[item.orange,3],[item.strawberry, 3] ], [item.apple, 3, 0, -1], recipe_type.cooking, craftingStation.none);
recipe_add([ [item.lemon, 3],[item.orange,3],[item.strawberry, 3] ], [item.apple, 3, 0, -1], recipe_type.cooking, craftingStation.none);
recipe_add([ [item.lemon, 3],[item.orange,3],[item.strawberry, 3] ], [item.apple, 3, 0, -1], recipe_type.cooking, craftingStation.none);
recipe_add([ [item.lemon, 3],[item.orange,3],[item.strawberry, 3] ], [item.apple, 3, 0, -1], recipe_type.cooking, craftingStation.none);
recipe_add([ [item.lemon, 3],[item.orange,3],[item.strawberry, 3] ], [item.apple, 3, 0, -1], recipe_type.cooking, craftingStation.none);
recipe_add([ [item.log,2],[CRAFTITEMTYPE + itemtype.resource,1] ], [item.stone, 1, 0, -1], recipe_type.cooking, craftingStation.none);