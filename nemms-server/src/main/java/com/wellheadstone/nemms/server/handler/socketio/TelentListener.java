package com.wellheadstone.nemms.server.handler.socketio;

import com.corundumstudio.socketio.AckRequest;
import com.corundumstudio.socketio.SocketIOClient;
import com.corundumstudio.socketio.listener.DataListener;
import com.wellheadstone.nemms.server.message.SocketIOTelnetMessage;

public class TelentListener implements DataListener<SocketIOTelnetMessage> {
	@Override
	public void onData(SocketIOClient client, SocketIOTelnetMessage data,
			AckRequest ackSender) throws Exception {
		client.sendEvent("default", "没有找到对应的事件处理程序");
	}
}
