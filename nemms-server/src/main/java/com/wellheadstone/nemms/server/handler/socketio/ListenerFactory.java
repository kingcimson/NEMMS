package com.wellheadstone.nemms.server.handler.socketio;

import com.corundumstudio.socketio.listener.DataListener;
import com.wellheadstone.nemms.server.protocol.SocketIOMessage;

public class ListenerFactory {
	public static DataListener<SocketIOMessage> create(String eventName){
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
