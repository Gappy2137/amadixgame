

fx_set_parameter(_fx_tint, "g_VignetteEdges", [edge, edge2]);

if (!ready){exit;}


if (change){
	fadeOut = true;
}

if (fadeIn){
	if (!inrange(edge, edgeTo - 0.1, edgeTo + 0.1, true)){
		edge = lerp(edge, edgeTo, 0.05);
	}else{
		fadeIn = false;	
	}
}

if (fadeOut){
	if inrange(edge, edgeVal - 0.1, edgeVal + 0.1, true){
		if (!change){
			vSprite = spr_none;
			alarm[0] = 1;
			fadeOut = false;
		}else{
			vSprite = vNewSprite;
			alarm[0] = 1;
			change = false;
			fadeIn = true;
			fadeOut = false;
		}
	}else{
		edge = lerp(edge, edgeVal, 0.05);
	}	
}