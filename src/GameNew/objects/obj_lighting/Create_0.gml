surf_normal = -1;
surf_lighting = -1;

texture	= 0;
normal	= 0;

mix = 0;

u_normalmap		= shader_get_sampler_index(shader_light,"normalmap");
u_lightpos		= shader_get_uniform(shader_light,"lightpos");
u_resolution	= shader_get_uniform(shader_light,"resolution");