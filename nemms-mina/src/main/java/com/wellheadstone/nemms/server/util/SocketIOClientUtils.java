package com.wellheadstone.nemms.server.util;

import com.corundumstudio.socketio.SocketIOClient;
import com.wellheadstone.nemms.server.collection.SocketIOClientMap;
import com.wellheadstone.nemms.server.handler.socketio.SocketIOClientRequest;
import com.wellheadstone.nemms.server.message.CMCCFDSMessage;
import com.wellheadstone.nemms.server.message.SocketIOMessage;

public class SocketIOClientUtils {
	public static void sendEofEvent(SocketIOClient client, SocketIOMessage data, String res) {
		data.setEof(true);
		data.setResponseText(res);
		client.sendEvent(data.getEventName(), data);
	}

	public static void sendEvent(CMCCFDSMessage message, String resText) {
		SocketIOClientRequest request = SocketIOClientMap.get(message.getKey());
		request.getClient().sendEvent(request.getData().getEventName(), request.getData().clone());
		if (request.getData().isEof()) {
			request.getData().setRequestText("无");
			request.getData().setResponseText(resText);
			request.getClient().sendEvent(request.getData().getEventName(), request.getData());
		}
		SocketIOClientMap.remove(message.getKey());
	}
}
