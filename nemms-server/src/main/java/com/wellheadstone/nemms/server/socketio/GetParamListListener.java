package com.wellheadstone.nemms.server.socketio;

import com.corundumstudio.socketio.AckRequest;
import com.corundumstudio.socketio.SocketIOClient;
import com.corundumstudio.socketio.listener.DataListener;

public class GetParamListListener implements DataListener<EventRequest> {

	@Override
	public void onData(SocketIOClient client, EventRequest data,
			AckRequest ackSender) throws Exception {
		// TODO Auto-generated method stub

	}

}
