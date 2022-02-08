event_inherited();

item_sprite = spr_inventory_items;

spr_width = sprite_get_width(item_sprite);

item_id = -1;

cell_size = 24;

x_offset = cell_size/2;

y_offset = cell_size*(2/3);

rot = 0;

x_frame = 0;

y_frame = 0;

scale = 1;

if (instance_exists(obj_amadix)){
	yorigin = obj_amadix.yorigin;
}

testdp = instance_create_layer(x, y, "Instances", obj_testr);