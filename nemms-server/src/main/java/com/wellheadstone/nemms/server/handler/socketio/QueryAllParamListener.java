package com.wellheadstone.nemms.server.handler.socketio;

import com.corundumstudio.socketio.AckRequest;
import com.corundumstudio.socketio.SocketIOClient;
import com.corundumstudio.socketio.listener.DataListener;
import com.wellheadstone.nemms.server.protocol.socketio.SocketIOMessage;

public class QueryAllParamListener implements DataListener<SocketIOMessage> {

	@Override
	public void onData(SocketIOClient client, SocketIOMessage data,
			AckRequest ackSender) throws Exception {
		SocketIOMessage response = new SocketIOMessage();
		client.sendEvent(EventName.QueryALL, response);
	}

}
