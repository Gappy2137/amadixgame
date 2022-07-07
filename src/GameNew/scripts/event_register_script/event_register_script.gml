function event_register_script(_event, _id, _script, _args){

	with(obj_eventmanager){
		if (!ds_map_exists(eventMap, _event)){
			var listenerList = ds_list_create();
			
			ds_map_add_list(eventMap, _event, listenerList);
		}else{
			var listenerList = eventMap[? _event];	
		}
		
		var listenerInfo;
		
		listenerInfo[0] = _id;
		
		var len = argument_count - 2;
		var i = 0;
		repeat(len){
			
			listenerInfo[i + 1] = _args[i + 2];
			
			i++;
		}
		
		ds_list_add(listenerList, listenerInfo);
	}

}