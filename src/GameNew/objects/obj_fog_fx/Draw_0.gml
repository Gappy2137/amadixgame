shader_set(shader_fog);
shader_set_uniform_f(shader_get_uniform(shader_fog, "time"), i);

shader_set_uniform_f(shader_get_uniform(shader_fog, "red"), rValue);
shader_set_uniform_f(shader_get_uniform(shader_fog, "green"), gValue);
shader_set_uniform_f(shader_get_uniform(shader_fog, "blue"), bValue);
shader_set_uniform_f(shader_get_uniform(shader_fog, "alpha"), alpha);


draw_sprite_tiled(spr_fog_fx, 0, 0, 0);

shader_reset();