function layer_blend_normal(){
	if event_type == ev_draw{
	   if event_number == 0{
	        gpu_set_blendmode(bm_normal);
	   }
	}
}