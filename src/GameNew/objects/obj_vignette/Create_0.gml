
edge = 1.3;
edge2 = edge + 0.05;
edgeTo = 1;
vSprite = spr_vignette_fx;

_fx_tint = fx_create("_filter_vignette");
fx_set_parameter(_fx_tint, "g_VignetteEdges", [edge, edge2]);
fx_set_parameter(_fx_tint, "g_VignetteSharpness", 1);
fx_set_parameter(_fx_tint, "g_VignetteTexture", vSprite);
layer_set_fx("FXLAYER_1", _fx_tint);
