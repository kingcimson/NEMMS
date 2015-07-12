package com.wellheadstone.nemms.server.handler.socketio;

import com.corundumstudio.socketio.AckRequest;
import com.corundumstudio.socketio.SocketIOClient;
import com.corundumstudio.socketio.listener.DataListener;
import com.wellheadstone.nemms.server.protocol.socketio.SocketIOMessage;

public class DefaultListListener implements DataListener<SocketIOMessage> {
	@Override
	public void onData(SocketIOClient client, SocketIOMessage data,
			AckRequest ackSender) throws Exception {
		client.sendEvent("default", "没有找到对应的事件处理程序");
	}
}
