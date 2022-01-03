depth = -1;

scale = 1;

//Glowne eq
show_inventory = false;

//Pierwszy rzad slotow poza glownym eq
show_slots = true;
slots_position_up = false;

//Wartosci do obliczania pozycji calosci eq
x_rel = 0;
y_rel = 0;

canUseInventory = true;

page = 0;
pages = 2;

inv_slots = 84 * (pages + 1);
inv_slots_width = 12;
inv_slots_height = 7;

selected_slot = 0;
picked_slot = -1;
onepicked_slot = 0;
multipick = 0;
inhand = -1;
pick = -1;


multipick_2 = -1;
multipick_3 = -1;
multipick_4 = -1;
multipick_5 = -1;
multipick_6 = -1;
multipick_7 = -1;
multipick_8 = -1;
multipick_9 = -1;
multipick_10 = -1;
multipick_11 = -1;


picked_slot_right = -1;
multipick_zerobuffer = false;
multipick_item = -1;
changeitem = false;

mouse_slotx = 0;
mouse_sloty = 0;
mouse_slotx_second = 0;
mouse_slotx_fix = 0;
inslots = false;		//sprawdza czy myszka znajduje sie w eq

show_slots_mouse = false;

x_offset = 0;
y_offset = 0;

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

spr_invUI = spr_inventory_hud;
spr_invUI_back = spr_inventory_hud_back;
spr_inv_items = spr_inventory_items;
spr_inv_slot_nonexistent = spr_item_slot_nonexistent;
spr_inv_slot_none = spr_item_slot_none;
spr_inv_slot_selected = spr_item_slot_selected;

///////////////
//nowe ui
spr_eq_back = spr_eq_ui_back;
spr_eq_slotback = spr_eq_ui_slotback;
spr_eq_arrow = spr_eq_ui_slotback_arrow;

///////////////

cell_size = 24;

invUI_width = 12 * cell_size;
invUI_height = 4 * cell_size;

//xUI = (gui_width/2) - ((invUI_width/2)*scale);
//yUI = (gui_height/2) - ((invUI_height/2)*scale);

xUI = 96;
yUI = 60;

backslotUI_x = 92;
backslotUI_y = 56;

backUI_x = 85;
backUI_y = 48;

spr_inv_items_columns = sprite_get_width(spr_inv_items)/cell_size;
spr_inv_items_rows = sprite_get_height(spr_inv_items)/cell_size;

slots_x = xUI;
slots_y = yUI;

text_timer = 300;
text_alpha = 1;

//-------Ekwipunek
//0 = PRZEDMIOT
//1 = ILOSC
//2 = RODZAJ
//3 = MAKS. STACK
//4 = HP (JEDZENIE I PICIE)
//5 = ENERGIA (JEDZENIE I PICIE)
//6 = POZIOM PRZEDMIOTU (BRON I UBRANIA)
//7 = OBRAZENIA (BRON)
//8 = OBRONA (UBRANIA)
//9 = EFEKT 1 (JEDZENIE, PICIE, BRON, UBRANIA I AKCESORIA)
//10 = EFEKT 2 (JEDZENIE, PICIE, BRON, UBRANIA I AKCESORIA)
//11 = EFEKT 3 (JEDZENIE, PICIE, BRON, UBRANIA I AKCESORIA)

ds_inventory = ds_grid_create(11, inv_slots);

#region Przedmioty
enum item{
	none						= 0,
	apple						= 1,
	bucket						= 2,
	stone						= 3,
	sword						= 4,
	bull_energy_drink			= 5,
	mango_salsa					= 6,
	stick						= 7,
	log							= 8,
	pear						= 9,
	strawberry					= 10,
	lemon						= 11,
	orange						= 12,
	height						= 13
}
#endregion

enum itemtype{
	resource			= 0,
	food				= 1,
	drink				= 2,
	melee				= 3,
	tool				= 4,
	fruit				= 5,
	vegetable			= 6,
	dish				= 7
}

ds_item_info = ds_grid_create(3, item.height);

ds_item_all = ds_grid_create(11, item.height);

//Siatka wszystkich przedmiotow
var i = 0;
repeat(item.height){
	ds_item_all[# ITEM, i] = i;
	ds_item_all[# AMOUNT, i] = 0;
	i++;
}

alarm[0] = 1; //Nazwy i opisy przedmiotow

item_attrib_grid();