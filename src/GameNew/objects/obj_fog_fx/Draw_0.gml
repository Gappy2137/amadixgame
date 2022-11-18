shader_set(shader_fog);
shader_set_uniform_f(shader_get_uniform(shader_fog, "time"), i);

shader_set_uniform_f(shader_get_uniform(shader_fog, "red"), 0.408);
shader_set_uniform_f(shader_get_uniform(shader_fog, "green"), 0.427);
shader_set_uniform_f(shader_get_uniform(shader_fog, "blue"), 0.659);
shader_set_uniform_f(shader_get_uniform(shader_fog, "alpha"), 1.0);


draw_sprite_tiled(spr_fog_fx, 1, 0, 0);

shader_reset();