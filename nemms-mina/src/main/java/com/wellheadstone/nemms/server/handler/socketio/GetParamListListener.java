package com.wellheadstone.nemms.server.handler.socketio;

import java.net.InetSocketAddress;

import org.apache.mina.core.session.IoSession;

import com.corundumstudio.socketio.AckRequest;
import com.corundumstudio.socketio.SocketIOClient;
import com.corundumstudio.socketio.listener.DataListener;
import com.wellheadstone.nemms.server.domain.po.DeviceConnInfoPo;
import com.wellheadstone.nemms.server.domain.service.ServiceFacade;
import com.wellheadstone.nemms.server.handler.tcp.TcpSessionMap;
import com.wellheadstone.nemms.server.handler.udp.UdpSessionMap;
import com.wellheadstone.nemms.server.message.CMCCFDSMessage;
import com.wellheadstone.nemms.server.message.MessageUtils;
import com.wellheadstone.nemms.server.message.SocketIOMessage;
import com.wellheadstone.nemms.server.task.GetParamListProcessor;

public class GetParamListListener implements DataListener<SocketIOMessage> {
	@Override
	public void onData(SocketIOClient client, SocketIOMessage data, AckRequest ackSender) throws Exception {
		CMCCFDSMessage message = MessageUtils.getParamListReqMessage(data);
		DeviceConnInfoPo connInfo = ServiceFacade.getConnInfoBy(data.getUid());
		if (connInfo == null) {
			data.setResponseText("未找到当前站点与设备的连接服务器ip与port.");
		} else {
			if (data.getProtocol().equals("1")) {
				this.sendTcpMessage(client, data, message, connInfo);
			} else if (data.getProtocol().equals("2")) {
				this.sendUdpMessage(client, data, message, connInfo);
			}
		}
	}

	private void sendTcpMessage(SocketIOClient client, SocketIOMessage data, CMCCFDSMessage message,
			DeviceConnInfoPo connInfo)
			throws InterruptedException {
		IoSession session = TcpSessionMap.get(connInfo.getDeviceIp());
		if (session == null) {
			data.setEof(true);
			data.setResponseText("未找到当前站点或设备的TCP连接通道.");
			client.sendEvent(EventName.GetParamList, data);
		} else {
			ServiceFacade.removeDeviceDataBy(data.getUid());
			GetParamListProcessor.execute(session, client, data, message);
		}
	}

	private void sendUdpMessage(SocketIOClient client, SocketIOMessage data, CMCCFDSMessage message,
			DeviceConnInfoPo connInfo)
			throws InterruptedException {
		IoSession session = UdpSessionMap.get(connInfo.getDeviceIp());
		if (session == null) {
			data.setEof(true);
			data.setResponseText("未找到当前站点或设备的UDP连接通道.");
			client.sendEvent(EventName.GetParamList, data);
		} else {
			ServiceFacade.removeDeviceDataBy(data.getUid());
			message.setRemoteAddress(new InetSocketAddress(connInfo.getDeviceIp(), connInfo.getDevicePort()));
			GetParamListProcessor.execute(session, client, data, message);
		}
	}
}
