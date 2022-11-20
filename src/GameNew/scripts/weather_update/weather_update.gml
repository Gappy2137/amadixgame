function weather_update(){
	switch(global.weather){
		//-------------------------------------------------------------------------------------------
		case weather.sun:
		
		break;
		//-------------------------------------------------------------------------------------------
		//-------------------------------------------------------------------------------------------
		case weather.few_clouds:
		
		break;
		//-------------------------------------------------------------------------------------------
		//-------------------------------------------------------------------------------------------
		case weather.cloudy:
		
		break;
		//-------------------------------------------------------------------------------------------
		//-------------------------------------------------------------------------------------------
		case weather.drizzle:
				if (!instance_exists(obj_rain_emitter)){
		
					var _RAIN = instance_create_layer(0, 0, MAINSCR, obj_rain_emitter);
		
					with (_RAIN){
			
						intensity = 1;
						changeTrigger = true;
						newIntensity = 3;

						rainSprite = spr_rain_particle;
						rainDropSprite = spr_none;
						sizeMin = 0.2;
						sizeMax = 0.5;
						scaleMin = 0.2;
						scaleMax = 0.8;
						speedMin = 4;
						speedMax = 6;
			
					}
		
				}else{
					with (obj_rain_emitter){
			
						changeTrigger = true;
						newIntensity = 3;

						rainSprite = spr_rain_particle;
						rainDropSprite = spr_none;
						sizeMin = 0.2;
						sizeMax = 0.5;
						scaleMin = 0.2;
						scaleMax = 0.8;
						speedMin = 4;
						speedMax = 6;
			
					}
				}

				if (!instance_exists(obj_vignette)){
					var _VIG = instance_create_layer(0, 0, MAINSCR, obj_vignette);	
					with (_VIG){
			
						edge = 1.6;
						edge2 = edge + 0.05;
						edgeTo = 1;
						vSprite = spr_fog_fx;
			
					}
				}else{
					with (obj_vignette){
			
						edge = 1.6;
						edge2 = edge + 0.05;
						edgeTo = 1;
						vSprite = spr_fog_fx;
			
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
						alpha =	 0.3;
				
						fogSpr = spr_fog_fx;
						fogSub = 0;
			
					}
				}else{
					with (obj_fog_fx){
			
						cap = 8;
						i = -cap;
						val = 0.005;

						rValue = 0.408;
						gValue = 0.427;
						bValue = 0.659;
						alpha =	 0.3;
				
						fogSpr = spr_fog_fx;
						fogSub = 0;
			
					}
				}
		break;
		//-------------------------------------------------------------------------------------------
		//-------------------------------------------------------------------------------------------
		case weather.rain:
				if (!instance_exists(obj_rain_emitter)){
		
					var _RAIN = instance_create_layer(0, 0, MAINSCR, obj_rain_emitter);
		
					with (_RAIN){
			
						intensity = 1;
						changeTrigger = true;
						newIntensity = 12;

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
			
						changeTrigger = true;
						newIntensity = 12;

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
			
						edge = 1.6;
						edge2 = edge + 0.05;
						edgeTo = 1;
						vSprite = spr_fog_fx;
			
					}
				}else{
					with (obj_vignette){
			
						edge = 1.6;
						edge2 = edge + 0.05;
						edgeTo = 1;
						vSprite = spr_fog_fx;
			
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
				
						fogSpr = spr_fog_fx;
						fogSub = 0;
			
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
				
						fogSpr = spr_fog_fx;
						fogSub = 0;
			
					}
				}
		break;
		//-------------------------------------------------------------------------------------------
	}
	
	// Clear fx
	
	if (global.weather != weather.drizzle)
	&& (global.weather != weather.rain)
	&& (global.weather != weather.heavy_rain)
	&& (global.weather != weather.storm)
	&& (global.weather != weather.storm_incoming)
	&& (global.weather != weather.heavy_storm){
		
		if (instance_exists(obj_rain_emitter)){
			
			with (obj_rain_emitter){
			
				changeTrigger = true;
				newIntensity = 0;

			}
			
		}
		
		if (instance_exists(obj_vignette)){
			
			with (obj_vignette){
				
				fadeOut = true;
				
			}
			
		}
		
		if (instance_exists(obj_fog_fx)){
			
			with (obj_fog_fx){
				
				fade = true;
				
			}
			
		}
		
	}
}