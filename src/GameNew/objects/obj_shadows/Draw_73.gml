


/*
if(!surface_exists(shadowSurface)){
	shadowSurface = surface_create(GAMEWIDTH, GAMEHEIGHT);
}


var viewX = camera_get_view_x(view_camera[0]);
var viewY = camera_get_view_y(view_camera[0]);

//var viewX = 0;
//var viewY = 0;

surface_set_target(shadowSurface);

draw_clear_alpha(c_black, 0);

var skew = skewX;
var h = shadowHeight;

gpu_set_fog(true, c_black, 0, 1);

parent = par_objectdepth;

with(parent){
	if (shadowEnable){
		
		
		if (sprite_index != -1){
		
		
		if (!customSpr){
			draw_sprite_pos(shadowStyle, image_index, 
				(x)-(sprite_width/2)-viewX-skew+shadowOriginX,
				(y)-viewY-h+shadowOriginY+4, 
				(x)+(sprite_width/2)-viewX-skew+shadowOriginX,
				(y)-viewY-h+shadowOriginY+4, 
				(x)+(sprite_width/2)-viewX+shadowOriginX,
				(y)-viewY+shadowOriginY+4, 
				(x)-(sprite_width/2)-viewX+shadowOriginX,
				(y)-viewY+shadowOriginY+4, 
				shadowAlpha);
		}else{
			draw_sprite_pos(shadowStyle, image_index, 
				(x)-(customSprWidth/2)-viewX-skew+shadowOriginX,
				(y)-viewY-h+shadowOriginY+4, 
				(x)+(customSprWidth/2)-viewX-skew+shadowOriginX,
				(y)-viewY-h+shadowOriginY+4, 
				(x)+(customSprWidth/2)-viewX+shadowOriginX,
				(y)-viewY+shadowOriginY+4, 
				(x)-(customSprWidth/2)-viewX+shadowOriginX,
				(y)-viewY+shadowOriginY+4, 
				shadowAlpha);
		}
		
		
		}
	}
}

gpu_set_fog(false, c_white, 0, 0);

surface_reset_target();

//surface_resize(shadowSurface, GAMEWIDTH * obj_display.window_size, GAMEHEIGHT * obj_display.window_size);

draw_surface_ext(shadowSurface, viewX, viewY, 1, 1, 0, c_white, 1);