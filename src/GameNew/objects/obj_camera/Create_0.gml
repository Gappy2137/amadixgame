
view_width = GAMEWIDTH;
view_height = GAMEHEIGHT;

following = obj_amadix;

bounded = true;

stop = false;

_y = 16;

enum camera_mode{
	follow_player,
	follow_player_precise,
}

mode = camera_mode.follow_player_precise;

camera = camera_create_view(0, 0, view_width, view_height, 0, obj_amadix, -1, -1, 32, 32);

camera_apply(camera);

camX = 0;
camY = 0;

alarm[0] = 5;