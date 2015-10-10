package com.wellheadstone.nemms.server.handler.socketio;

import java.net.InetSocketAddress;

import org.apache.mina.core.session.IoSession;

import com.corundumstudio.socketio.SocketIOClient;
import com.wellheadstone.nemms.server.collection.TcpSessionMap;
import com.wellheadstone.nemms.server.collection.UdpSessionMap;
import com.wellheadstone.nemms.server.domain.po.DeviceConnInfoPo;
import com.wellheadstone.nemms.server.domain.service.ServiceFacade;
import com.wellheadstone.nemms.server.message.CMCCFDSMessage;
import com.wellheadstone.nemms.server.message.SocketIOMessage;
import com.wellheadstone.nemms.server.util.SocketIOClientUtils;

public abstract class AbstractListener {
	protected AbstractListener() {
	}

	protected void onData(SocketIOClient client, SocketIOMessage data, CMCCFDSMessage message)
			throws Exception {
		DeviceConnInfoPo connInfo = ServiceFacade.getConnInfoBy(data.getUid());
		if (connInfo == null) {
			SocketIOClientUtils.sendEofEvent(client, data, "未找到当前站点与设备的连接服务器ip与port.");
		} else {
			if (data.getProtocol().equals("1")) {
				this.sendTcpMessage(client, data, message, connInfo);
			} else if (data.getProtocol().equals("2")) {
				this.sendUdpMessage(client, data, message, connInfo);
			}
		}
	}

	protected void sendTcpMessage(SocketIOClient client,
			SocketIOMessage data, CMCCFDSMessage message, DeviceConnInfoPo connInfo) throws Exception {
		IoSession session = TcpSessionMap.get(connInfo.getDeviceIp());
		if (session == null) {
			SocketIOClientUtils.sendEofEvent(client, data, "未找到当前站点或设备的TCP连接通道.");
		} else {
			this.sendMessage(client, session, data, message);
		}
	}

	protected void sendUdpMessage(SocketIOClient client,
			SocketIOMessage data, CMCCFDSMessage message, DeviceConnInfoPo connInfo) throws Exception {
		IoSession session = UdpSessionMap.get(connInfo.getDeviceIp());
		if (session == null) {
			SocketIOClientUtils.sendEofEvent(client, data, "未找到当前站点或设备的UDP连接通道.");
		} else {
			message.setRemoteAddress(new InetSocketAddress(connInfo.getDeviceIp(), connInfo.getDevicePort()));
			this.sendMessage(client, session, data, message);
		}
	}

	protected abstract void sendMessage(SocketIOClient client,
			IoSession session, SocketIOMessage data, CMCCFDSMessage message) throws Exception;
}
