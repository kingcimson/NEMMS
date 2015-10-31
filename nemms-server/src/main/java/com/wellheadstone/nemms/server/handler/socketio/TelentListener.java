package com.wellheadstone.nemms.server.handler.socketio;

import com.corundumstudio.socketio.AckRequest;
import com.corundumstudio.socketio.SocketIOClient;
import com.corundumstudio.socketio.listener.DataListener;
import com.wellheadstone.nemms.server.message.SocketIOTelnetMessage;

public class TelentListener implements DataListener<SocketIOTelnetMessage> {
	@Override
	public void onData(SocketIOClient client, SocketIOTelnetMessage data, AckRequest ackSender) throws Exception {
		client.sendEvent("telnet", "");
	}
}
