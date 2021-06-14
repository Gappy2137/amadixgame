event_inherited();

cell_size = 24;

item_sprite = spr_inventory_items;
spr_width = sprite_get_width(item_sprite);
spr_height = sprite_get_height(item_sprite);

item_num = -1;
item_num_amount = -1;
item_num_type = -1;
item_num_maxstack = -1;
item_num_hp = -1;
item_num_stamina = -1;
x_frame = 0;
y_frame = 0;

x_offset = cell_size/2;
y_offset = cell_size*(2/3);

yorigin = 34;

dropMove = true;
var itemdir = irandom_range(0, 359);
var len = 32;
goal_x = x + lengthdir_x(len, itemdir);
goal_y = y + lengthdir_y(len, itemdir);

shadowEnable = true;
shadowOriginX = 0;
shadowOriginY = 36;
shadowAlpha = 0.4;
shadowStyle = spr_shadow_big;
customSpr = true;
customSprWidth = 24;

bounce = 0;
z = 0;
height = 0;
acceleration = 0;
spd = 0;
frict = 0;
grounded = false;
timesinceground = 50;

bounceCount = 2;
bounceSpeed = 0.05;
bounceHeight = 7;

invisframe = false;
invistime = 10;