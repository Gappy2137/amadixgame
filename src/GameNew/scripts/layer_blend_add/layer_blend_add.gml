function layer_blend_add(){
	if event_type == ev_draw{
	   if event_number == 0{
	        gpu_set_blendmode(bm_add);
	   }
	}
}