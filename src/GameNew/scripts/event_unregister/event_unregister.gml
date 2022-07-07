function event_unregister(_event, _id){
	with (obj_eventmanager){
		if (ds_map_exists(eventMap, _event)){
			var listenerList = eventMap[? _event];
			
			var len = ds_list_size(listenerList);
			
			var i = 0;
			repeat(len){
				
				var listenerInfo = listenerList[| i];
				
				if (listenerInfo[0] == _id){
					if (len == 1){
						ds_list_destroy(listenerList);
						ds_map_delete(eventMap, _event);
					}else{
						ds_list_delete(listenerList, i)	
					}
					break;
				}
				
				i++;
			}
		}
	}
}