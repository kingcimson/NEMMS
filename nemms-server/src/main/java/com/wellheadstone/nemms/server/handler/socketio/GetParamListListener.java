package com.wellheadstone.nemms.server.handler.socketio;

import io.netty.channel.Channel;
import io.netty.channel.socket.SocketChannel;

import java.net.InetSocketAddress;

import com.corundumstudio.socketio.AckRequest;
import com.corundumstudio.socketio.SocketIOClient;
import com.corundumstudio.socketio.listener.DataListener;
import com.wellheadstone.nemms.server.domain.po.DeviceConnInfoPo;
import com.wellheadstone.nemms.server.domain.service.ServiceFacade;
import com.wellheadstone.nemms.server.handler.tcp.TcpSocketChannelMap;
import com.wellheadstone.nemms.server.handler.udp.UdpSocketChannelMap;
import com.wellheadstone.nemms.server.message.CMCCFDSMessage;
import com.wellheadstone.nemms.server.message.MessageUtils;
import com.wellheadstone.nemms.server.message.SocketIOMessage;

public class GetParamListListener implements DataListener<SocketIOMessage> {
	@Override
	public void onData(SocketIOClient client, SocketIOMessage data, AckRequest ackSender) throws Exception {
		CMCCFDSMessage message = MessageUtils.getParamListReqMessage(data);
		DeviceConnInfoPo connInfo = ServiceFacade.getConnInfoBy(data.getUid());
		if (connInfo == null) {
			data.setRequestText("未找到当前站点与设备的连接服务器ip与port.");
		} else {
			if (data.getProtocol().equals("1")) {
				this.sendTcpMessage(data, message, connInfo);
			} else if (data.getProtocol().equals("2")) {
				this.sendUdpMessage(data, message, connInfo);
			}
		}
		client.sendEvent(EventName.GetParamList, data);
	}

	private void sendTcpMessage(SocketIOMessage data, CMCCFDSMessage message, DeviceConnInfoPo connInfo)
			throws InterruptedException {
		SocketChannel channel = (SocketChannel) TcpSocketChannelMap.get(connInfo.getDeviceIp());
		if (channel == null) {
			data.setRequestText("未找到当前站点或设备的TCP连接通道.");
		} else {
			data.setRequestText(message.toString());
			ServiceFacade.removeDeviceDataBy(data.getUid());
			channel.writeAndFlush(message).sync();
		}
	}

	private void sendUdpMessage(SocketIOMessage data, CMCCFDSMessage message, DeviceConnInfoPo connInfo)
			throws InterruptedException {
		Channel channel = UdpSocketChannelMap.get(connInfo.getServerIp());
		if (channel == null) {
			data.setRequestText("未找到当前站点或设备的UDP连接通道.");
		} else {
			data.setRequestText(message.toString());
			ServiceFacade.removeDeviceDataBy(data.getUid());
			message.setRemoteAddress(new InetSocketAddress(connInfo.getDeviceIp(), connInfo.getDevicePort()));
			channel.writeAndFlush(message).sync();
		}
	}
}
