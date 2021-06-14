

hp_x = 440;
hp_y = 60;

stamina_x = 440;
stamina_y = 100;

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

hud_slot_width = sprite_get_width(spr_hud_slot) * 6;
hud_slot_height = sprite_get_height(spr_hud_slot);

lasthud = hud.inv;

hud_slot_x = (gui_width/2) - ((hud_slot_width/2));
hud_slot_y = 4;

slots_x = hud_slot_x;
slots_y = hud_slot_y;
mouse_slotx = 0;
mouse_sloty = 0;

hpCoreColor = make_color_rgb(176, 35, 24);
staminaCoreColor = make_color_rgb(249, 243, 89);

effect_x = 16;
effect_y = 16;

maxeffects = 16;
effect_grid = ds_grid_create(4, maxeffects);

backpack_frame = 0;
backpack_frames = 8;

crafting_frame = 0;
crafting_frames = 11;

enum hud{
	none = 0,
	slots = 1,
	inv = 2,
	crafting = 3,
	player = 4,
	map = 5,
	journal = 6,
	options = 7,
}

show_hud = hud.slots;
hud_inner = false;

selected_hud_slot = 0;

instance_create_layer(x, y, "Instances", obj_crafting);

t = 0;