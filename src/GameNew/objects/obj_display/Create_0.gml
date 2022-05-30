ideal_width = 480;
ideal_height = 270;
display_width = display_get_width();
display_height = display_get_height();
window_size = 1;
max_window_size = 4;
global.gameWidth = 480;
global.gameHeight = 270;
global.zoom = 3;

zoomtrigger = false;

aspect_ratio = display_width/display_height;


//ideal_width = round(ideal_height*aspect_ratio);
//ideal_height = round(ideal_width / aspect_ratio);

/*
//Perfect Pixel Scaling
if(display_width mod ideal_width != 0)
{
  var d = round(display_width/ideal_width);
  ideal_width=display_width/d;
}
if(display_height mod ideal_height != 0)
{
  var d = round(display_height/ideal_height);
  ideal_height=display_height/d;
}

//Check for odd numbers
if(ideal_width & 1)
  ideal_width++;
if(ideal_height & 1)
  ideal_height++;  
  */
for(var i=1; i<=room_last; i++)
{
  if(room_exists(i))
  {
    room_set_view(i,0,true,0,0,ideal_width,ideal_height,0,0,ideal_width,ideal_height,0,0,0,0,-1);
    room_set_view_enabled(i,true);
  }
}

view_set_wport(0, ideal_width);
view_set_hport(0, ideal_height);

window_set_size(ideal_width, ideal_height);
display_set_gui_size(ideal_width, ideal_height);
surface_resize(application_surface, ideal_width * window_size, ideal_height * window_size);
instance_create_layer(0,0,"Important",obj_camera); 
window_set_fullscreen(false);
window_center();
alarm[2] = 1;
room_goto(rm_devroom_3);