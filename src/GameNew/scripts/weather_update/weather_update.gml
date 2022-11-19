function weather_update(){
	if (global.weather == weather.rain){
	
		if (!instance_exists(obj_rain_emitter)){
		
			var _RAIN = instance_create_layer(0, 0, MAINSCR, obj_rain_emitter);
		
			with (_RAIN){
			
				intensity = 12;

				rainSprite = spr_rain_particle;
				rainDropSprite = spr_raindrop;
				sizeMin = 0.5;
				sizeMax = 1;
				scaleMin = 1;
				scaleMax = 2;
				speedMin = 5;
				speedMax = 8;
			
			}
		
		}else{
			with (obj_rain_emitter){
			
				intensity = 12;

				rainSprite = spr_rain_particle;
				rainDropSprite = spr_raindrop;
				sizeMin = 0.5;
				sizeMax = 1;
				scaleMin = 1;
				scaleMax = 2;
				speedMin = 5;
				speedMax = 8;
			
			}
		}

		if (!instance_exists(obj_vignette)){
			var _VIG = instance_create_layer(0, 0, MAINSCR, obj_vignette);	
			with (_VIG){
			
				edge = 1.3;
				edge2 = edge + 0.05;
				edgeTo = 1;
				vSprite = spr_vignette_fx;
			
			}
		}else{
			with (obj_vignette){
			
				edge = 1.3;
				edge2 = edge + 0.05;
				edgeTo = 1;
				vSprite = spr_vignette_fx;
			
			}
		}


		if (!instance_exists(obj_fog_fx)){
			var _FOG = instance_create_layer(0, 0, MAINSCR, obj_fog_fx);	
			with (_FOG){
			
				cap = 8;
				i = -cap;
				val = 0.005;

				rValue = 0.408;
				gValue = 0.427;
				bValue = 0.659;
				alpha =	 1.0;
			
			}
		}else{
			with (obj_fog_fx){
			
				cap = 8;
				i = -cap;
				val = 0.005;

				rValue = 0.408;
				gValue = 0.427;
				bValue = 0.659;
				alpha =	 1.0;
			
			}
		}
	}
}