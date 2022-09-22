if (!active){exit;}

var _guiW = window_get_width();
var _guiH = window_get_height();
var _surfW = surface_get_width(application_surface);
var _surfH = surface_get_height(application_surface);

var _texture = surface_get_texture(application_surface);
var _texelW = texture_get_texel_width(_texture);
var _texelH = texture_get_texel_height(_texture);

shader_set(shader_upscale);
gpu_set_tex_filter(true);
shader_set_uniform_f(shader_get_uniform(shader_upscale, "u_vTexelSize"), _texelW, _texelH);
shader_set_uniform_f(shader_get_uniform(shader_upscale, "u_vScale"), _guiW/_surfW, _guiH/_surfH);
draw_surface_stretched(application_surface, 0, 0, _guiW, _guiH);
shader_reset();
gpu_set_tex_filter(false);