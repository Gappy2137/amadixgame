

grid_pos = 1;
grid_offset = 48;

main_x = 240;
main_y = 192 - 16;

accel = 0.3;
deccel = 0.17;
grav_accel = 0.16;
jumpval = 80;

moving = false;
jumping = false;
falling = false;
canmove = true;
canjump = true;
grounded = true;

ispressingkeys = false;

hor_keyPress = 0;

z = 0;

_spr = spr_player_main;
_frame = 0;
frame_jump_flag = false;

shadowSize = 1;
shadowAlpha = 0.5;

depth = -1;