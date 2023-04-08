
if (instance_exists(obj_camerafocus)){
	widthRel = obj_camerafocus.image_xscale*16;
	heightRel = obj_camerafocus.image_yscale*16;
	xRel = obj_camerafocus.x;
	yRel = obj_camerafocus.y;
}else{
	widthRel = room_width;
	heightRel = room_height;
	xRel = 0;
	yRel = 0;
}

camera_set_view_size(view_camera[0], view_width, view_height);

switch (mode) {
    case camera_mode.follow_player:
	
	if (global.inCutscene){
		following = obj_amadix_cutscene;
	}else{
		following = obj_amadix;	
	}
	        if (instance_exists(following)){
				
				if (!stop){
					if (!global.pause){
						bounded = true;
				
						var cam_x = clamp((following.x-(view_width/2)),xRel , xRel + widthRel-(view_width));
						var cam_y = clamp((following.y-(view_height/2) + _y),yRel, yRel + heightRel-(view_height));

						
						
				
						var cam_x_pos = camera_get_view_x(view_camera[0]);
						var cam_y_pos = camera_get_view_y(view_camera[0]);
				
						var cam_speed = 0.2;
						
						var xl = (round_to4(lerp(cam_x_pos,cam_x,cam_speed)));
						var yl = (round_to4(lerp(cam_y_pos,cam_y,cam_speed)));

						camera_set_view_pos(view_camera[0], xl, yl);	
						
						camX = cam_x;
						camY = cam_y;
					}
				}
			}
			
    break;


    case camera_mode.follow_player_precise:
	
	following = obj_amadix;
	        if (instance_exists(following)){
				
				bounded = true;
				
				var cam_x = clamp((following.x-(view_width/2)),xRel , xRel + widthRel-(view_width));
				var cam_y = clamp((following.y-(view_height/2) + _y),yRel, yRel + heightRel-(view_height));

				camera_set_view_pos(view_camera[0], (cam_x), (cam_y));
						
				camX = cam_x;
				camY = cam_y;	
			}
			
    break;
}

if (!bounded){
	camera_set_view_pos(view_camera[0], 0, 0);
}

