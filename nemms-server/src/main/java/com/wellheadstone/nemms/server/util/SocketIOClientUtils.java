package com.wellheadstone.nemms.server.util;

import com.corundumstudio.socketio.SocketIOClient;
import com.wellheadstone.nemms.server.message.SocketIOMessage;

public class SocketIOClientUtils {
	public static void sendEofEvent(SocketIOClient client, SocketIOMessage data, String res) {
		data.setEof(true);
		data.setResponseText(res);
		client.sendEvent(data.getEventName(), data);
	}
}
