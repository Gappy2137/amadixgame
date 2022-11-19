var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);

var view_width = camera_get_view_width(view_camera[0]);
var view_height = camera_get_view_height(view_camera[0]);

var _windDir = global.windDir;
var _windStr = clamp(global.windStr, 0, 50);

var wiggle = irandom_range(-4, 4);

var _final_dir = round(( (-_windDir) * (_windStr / 1.25) ) + wiggle);

part_type_direction(part_rain, 270 + _final_dir, 270 + _final_dir, 0, 0);

part_type_orientation(part_rain, _final_dir, _final_dir, 0, 0, 0);

part_emitter_region(rain, emitter_rain, cam_x - 16, cam_x + view_width + 16, cam_y - 16, cam_y + view_height + 16, ps_shape_rectangle, ps_distr_linear);

part_emitter_region(rainDrop, emitter_rainDrop, cam_x - 4, cam_x + view_width + 4, cam_y - 4, cam_y + view_height + 4, ps_shape_rectangle, ps_distr_linear);