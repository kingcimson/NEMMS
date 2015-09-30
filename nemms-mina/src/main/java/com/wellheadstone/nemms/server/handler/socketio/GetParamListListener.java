package com.wellheadstone.nemms.server.handler.socketio;

import org.apache.mina.core.session.IoSession;

import com.corundumstudio.socketio.AckRequest;
import com.corundumstudio.socketio.SocketIOClient;
import com.corundumstudio.socketio.listener.DataListener;
import com.wellheadstone.nemms.server.collection.SocketIOClientMap;
import com.wellheadstone.nemms.server.domain.service.ServiceFacade;
import com.wellheadstone.nemms.server.message.CMCCFDSMessage;
import com.wellheadstone.nemms.server.message.SocketIOMessage;
import com.wellheadstone.nemms.server.util.MessageUtils;

public class GetParamListListener extends AbstractListener implements DataListener<SocketIOMessage> {
	@Override
	public void onData(SocketIOClient client, SocketIOMessage data, AckRequest ackSender) throws Exception {
		CMCCFDSMessage message = MessageUtils.getParamListReqMessage(data);
		this.onData(client, data, message);
	}

	@Override
	protected void sendMessage(SocketIOClient client,
			IoSession session, SocketIOMessage data, CMCCFDSMessage message) throws InterruptedException {
		SocketIOClientMap.add(message, new SocketIOClientRequest(client, data));
		ServiceFacade.removeDeviceDataBy(data.getUid());
		session.write(message);
	}
}
