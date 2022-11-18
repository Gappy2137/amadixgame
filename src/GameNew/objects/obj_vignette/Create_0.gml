
edge = 1.3;

_fx_tint = fx_create("_filter_vignette");
fx_set_parameter(_fx_tint, "g_VignetteEdges", [edge, 1.35]);
fx_set_parameter(_fx_tint, "g_VignetteSharpness", 1);
fx_set_parameter(_fx_tint, "g_VignetteTexture", spr_vignette_fx);
layer_set_fx("FXLAYER_1", _fx_tint);
