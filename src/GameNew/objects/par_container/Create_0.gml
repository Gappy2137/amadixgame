event_inherited();

show_container = false;

containerSlotWidth = 3;
containerSlotHeight = 3;

containerSlots = containerSlotWidth * containerSlotHeight;

selected_slot = -1;
inhand = -1;
multipick = 0;
lvl = 0;
cap = -1;

selected_slot_eq = -1;

x_rel = 0;
y_rel = 0;

mousex = 0;
mousey = 0;
mouse_slotx = 0;
mouse_sloty = 0;
mouse_slotx_second = 0;
mouse_slotx_fix = 0;

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

cell_size = 24;

invUI_width = containerSlotWidth * cell_size;
invUI_height = containerSlotHeight * cell_size;

xUI = (GAMEWIDTH/2) - (containerSlotWidth * cell_size/2);
yUI = 72 - (containerSlotHeight * cell_size/2);

xUI_eq = 96;
yUI_eq = 156;

scaleDesiredX = 1;
scaleDesiredY = 1;

spr_inv_items = spr_inventory_items;
spr_inv_slot_selected = spr_hud_container_slot;
spr_inv_slot_none = spr_hud_container_slot_none;
spr_inv_items_columns = sprite_get_width(spr_inv_items)/cell_size;
spr_inv_items_rows = sprite_get_height(spr_inv_items)/cell_size;

slots_x = xUI;
slots_y = yUI;

slots_x_eq = xUI_eq;
slots_y_eq = yUI_eq;

ds_container = ds_grid_create(13, containerSlots);

canUseContainter = false;

anim_frame = 0;
anim_frame_num = 0;
anim_speed = 0;

opened = false;