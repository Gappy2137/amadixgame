/*application_surface_draw_enable(false);
window_set_fullscreen(true);

global.monitor_width = display_get_width();
global.monitor_height = display_get_height();

global.screen_xoffset = (global.monitor_width-420)/2;
global.screen_yoffset = (global.monitor_height-270)/2;

if(global.monitor_width>=480*2 && global.monitor_height>=270*2)
then
{
surface_resize(application_surface,480*2,270*2)
global.screen_xoffset=(global.monitor_width-480*2)/2;
global.screen_yoffset=(global.monitor_height-270*2)/2;
}
*/

application_surface_enable(false);
var base_width = 420
var base_height = 270
var max_wa = floor(display_get_width());
var max_ha = floor(display_get_height());
var max_w = (display_get_width());
var max_h = (display_get_height());
var aspect = floor(display_get_width()) / (display_get_height());
view_h = min(base_height, max_h)
var view_wd = floor((view_h * aspect));
view_w = (view_wd);
    
window_scale = 1;

view_wview[0] = floor(view_w);
view_hview[0] = floor(view_h);
view_wport[0] = max_w;
view_hport[0] = max_h;


alarm[0] = 1;


instance_create_layer(0,0,"Important",obj_camera);

