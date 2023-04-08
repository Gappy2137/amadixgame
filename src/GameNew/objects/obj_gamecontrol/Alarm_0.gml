alarm[0] = 5;

if (global.pause){exit;}
if (global.savingRoom){exit;}

instance_deactivate_all(true);
instance_activate_object(obj_amadix);
instance_activate_object(par_alwaysactive);
instance_activate_object(par_collectible);


instance_activate_region(
camera_get_view_x(view_camera[0]) - INSTANCE_LOAD_DISTANCE,
camera_get_view_y(view_camera[0]) - INSTANCE_LOAD_DISTANCE/4,
camera_get_view_width(view_camera[0]) + INSTANCE_LOAD_DISTANCE,
camera_get_view_height(view_camera[0]) + INSTANCE_LOAD_DISTANCE,
true
);


