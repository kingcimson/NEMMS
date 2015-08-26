package com.wellheadstone.nemms.server.handler.socketio;

import com.corundumstudio.socketio.listener.DataListener;
import com.wellheadstone.nemms.server.protocol.SocketIOMessage;

public class ListenerFactory {
	public static DataListener<SocketIOMessage> create(String eventName) {
		if (EventName.GetParamList.equals(eventName)) {
			return new GetParamListListener();
		}
		if (EventName.QueryALL.equals(eventName)) {
			return new QueryAllListener();
		}
		if (EventName.QuerySelected.equals(eventName)) {
			return new QuerySelectedListener();
		}
		if (EventName.Setup.equals(eventName)) {
			return new SetupListener();
		}
		return new DefaultListListener();
	}
}
