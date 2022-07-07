function event_fire(_event){
	
	with(obj_eventmanager){
		if (ds_map_exists(eventMap, _event)){
			var listenerList = eventMap[? _event];
			
			var len = ds_list_size(listenerList);
			
			var listenerInfo, _listener, _script, _args;
			
			var i = 0;
			repeat(len){
				
				listenerInfo = listenerList[| i];
				
				_listener = listenerInfo[0];
				
				_script = listenerInfo[1];
				
				var lenArgs = array_length(listenerInfo) - 2;
				var unreg = false;
				
				if (lenArgs <= 0){
					if (instance_exists(_listener)){
						with (_listener) unreg = script_execute(_script);
					}else{
						unreg = true;	
					}
				}else{
					if (instance_exists(_listener)){
						_args = array_create(lenArgs, 0);
						array_copy(_args, 0, listenerInfo, 2, lenArgs);
						with (_listener) unreg = script_execute_ext(_script, _args);
					}else{
						unreg = true;	
					}
				}
				
				if (unreg){
					event_unregister(_event, _listener);
					
					i--;
				}
				i++;
			}
		}
	}
	
}