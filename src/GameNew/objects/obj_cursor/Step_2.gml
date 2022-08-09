x = mouse_x;
y = mouse_y;

_x = device_mouse_x_to_gui(0);
_y = device_mouse_y_to_gui(0);
//x = device_mouse_x_to_gui(0) * (camera_get_view_width(view_camera[0])/window_get_width()) * obj_display.window_size;
//y = device_mouse_y_to_gui(0) * (camera_get_view_height(view_camera[0])/window_get_height()) * obj_display.window_size;


/*
var _x = window_get_x(), _y = window_get_y();
var _w = window_get_x() + window_get_width(), _h = _y + room_height * window_get_height();

if display_mouse_get_x() < _x || display_mouse_get_x() > _w || display_mouse_get_y() < _y || display_mouse_get_y() > _h {
    mouseInWindow = false;
} else {
    mouseInWindow = true;
}

