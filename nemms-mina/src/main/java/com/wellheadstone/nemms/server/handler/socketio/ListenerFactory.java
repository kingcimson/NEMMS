package com.wellheadstone.nemms.server.handler.socketio;

import com.corundumstudio.socketio.listener.DataListener;
import com.wellheadstone.nemms.server.message.SocketIOMessage;

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
		if (EventName.Settings.equals(eventName)) {
			return new SettingsListener();
		}
		return new DefaultListListener();
	}
}
