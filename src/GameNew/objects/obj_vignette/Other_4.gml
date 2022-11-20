ready = false;
edge = edgeTo;
_fx_tint = fx_create("_filter_vignette");
fx_set_parameter(_fx_tint, "g_VignetteEdges", [edgeTo, edge2]);
fx_set_parameter(_fx_tint, "g_VignetteSharpness", 1);
fx_set_parameter(_fx_tint, "g_VignetteTexture", vSprite);
layer_set_fx("FXLAYER_1", _fx_tint);