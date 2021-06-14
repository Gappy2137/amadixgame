/// @description 
draw_set_color(c_white);
draw_set_alpha(1);
draw_sprite_tiled(texture,-1,0,0);

if (!surface_exists(surf_normal))
{
	surf_normal = surface_create(surface_get_width(application_surface),surface_get_height(application_surface));
	surface_set_target(surf_normal);
	draw_clear(make_color_rgb(127,127,255));
	draw_sprite_tiled(normal,-1,0,0);
	surface_reset_target();
}
if (!surface_exists(surf_lighting))
{
	surf_lighting = surface_create(surface_get_width(application_surface),surface_get_height(application_surface));
}
surface_set_target(surf_lighting);
draw_clear(c_dkgray); //Ambient color
surface_reset_target();

//Update lights' surfaces
gpu_set_blendmode(bm_add);
with(par_light)
{
	if (surface_exists(surf_light))
	{
		if (surface_get_width(surf_light) != sprite_width || surface_get_height(surf_light) != sprite_height)
		{
			surface_free(surf_light);
		}
	}
	if (!surface_exists(surf_light))
	{
		surf_light = surface_create(sprite_width,sprite_height);
		surface_set_target(surf_light);
		draw_clear(c_black); //Ambient color
		gpu_set_colorwriteenable(true,true,true,false);
		draw_sprite_ext(sprite_index,image_index,sprite_width/2,sprite_height/2,
						image_xscale,image_yscale,image_angle,image_blend,image_alpha);
		
		gpu_set_colorwriteenable(true,true,true,true);
		surface_reset_target();
	}
	
	
	shader_set(shader_light);
	
	
	with(other)
	{
		texture_set_stage(u_normalmap,surface_get_texture(surf_normal));
		shader_set_uniform_f(u_resolution,surface_get_width(surf_lighting),surface_get_height(surf_lighting));
	}
	
	
	shader_set_uniform_f(other.u_lightpos,x/surface_get_width(other.surf_lighting),y/surface_get_height(other.surf_lighting),z);
	surface_set_target(other.surf_lighting);
	draw_surface(surf_light,x-sprite_width/2,y-sprite_height/2);
	surface_reset_target();
	shader_reset();
}

gpu_set_blendmode_ext(bm_dest_color,bm_zero);
draw_surface(surf_lighting,0,0);
gpu_set_blendmode(bm_normal);