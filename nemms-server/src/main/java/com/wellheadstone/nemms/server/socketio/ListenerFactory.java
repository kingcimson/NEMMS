package com.wellheadstone.nemms.server.socketio;

import com.corundumstudio.socketio.listener.DataListener;

public class ListenerFactory {
	public static DataListener<EventRequest> create(String eventName){
		if(EventName.QueryALL.equals(eventName)){
			return new QueryAllParamListener();
		}
		if(EventName.GetParamList.equals(eventName)){
			return new GetParamListListener();
		}
		if(EventName.QuerySelected.equals(eventName)){
			return new QuerySelectedParamsListener();
		}
		
		return new DefaultListListener();
	}
}
