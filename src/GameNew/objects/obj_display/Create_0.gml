

ideal_width = 480;
ideal_height = 270;
display_width = display_get_width();
display_height = display_get_height();

window_size = 1;
max_window_size = 4;

zoomtrigger = false;

aspect_ratio = display_width/display_height;

fullscreen = false;

windowWidth = window_get_width();
windowHeight = window_get_height();



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
for(var i=1; i<=real(room_last); i++)
{
  if(room_exists(i))
  {
    room_set_view(i,0,true,0,0,GAMEWIDTH,GAMEHEIGHT,0,0,GAMEWIDTH,GAMEHEIGHT,0,0,0,0,-1);
    room_set_view_enabled(i,true);
  }
}

view_set_wport(0, GAMEWIDTH);
view_set_hport(0, GAMEHEIGHT);

window_set_size(GAMEWIDTH, GAMEHEIGHT);

display_set_gui_size(GAMEWIDTH, GAMEHEIGHT);

surface_resize(application_surface, GAMEWIDTH * window_size, GAMEHEIGHT * window_size);

instance_create_layer(0,0,"Important",obj_camera); 

window_set_fullscreen(false);

window_center();

//alarm[2] = 1;

room_goto(rm_devroom_3);