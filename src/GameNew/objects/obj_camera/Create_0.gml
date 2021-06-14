
view_width = obj_display.ideal_width;
view_height = obj_display.ideal_height;

following = obj_amadix;

bounded = true;

enum camera_mode{
	follow_player,
	follow_player_precise,
}

mode = camera_mode.follow_player;

camera = camera_create_view(0, 0, view_width, view_height, 0, obj_amadix, -1, -1, 32, 32);

camera_apply(camera);