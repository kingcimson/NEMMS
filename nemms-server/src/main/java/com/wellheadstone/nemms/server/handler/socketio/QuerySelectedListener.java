package com.wellheadstone.nemms.server.handler.socketio;

import io.netty.channel.socket.SocketChannel;

import com.corundumstudio.socketio.AckRequest;
import com.corundumstudio.socketio.SocketIOClient;
import com.corundumstudio.socketio.listener.DataListener;
import com.wellheadstone.nemms.server.domain.po.DeviceConnInfoPo;
import com.wellheadstone.nemms.server.domain.service.ServiceFacade;
import com.wellheadstone.nemms.server.handler.tcp.TcpSocketChannelMap;
import com.wellheadstone.nemms.server.protocol.SocketIOMessage;
import com.wellheadstone.nemms.server.protocol.TcpUdpMessage;
import com.wellheadstone.nemms.server.utils.RemoteAdressFormatter;

public class QuerySelectedListener implements DataListener<SocketIOMessage> {

	@Override
	public void onData(SocketIOClient client, SocketIOMessage data, AckRequest ackSender) throws Exception {
		String clientIP = RemoteAdressFormatter.getIP(client.getRemoteAddress());
		SocketIOClientMap.add(clientIP, client);

		TcpUdpMessage message = this.getRequestMessage(data);
		data.setRequestText(message.toString());

		DeviceConnInfoPo connInfo = ServiceFacade.getConnInfoBy(data.getUid());
		if (connInfo == null) {
			data.setResponseText("未找到当前站点与设备的连接服务器ip与port.");
		}
		else {
			SocketChannel channel = (SocketChannel) TcpSocketChannelMap.get(connInfo.getClientIp());
			if (channel == null) {
				data.setRequestText("未找到当前站点或设备的连接通道.");
			}
			else {
				channel.writeAndFlush(message);
			}
		}

		data.setEventName(EventName.QuerySelected);
		client.sendEvent(data.getEventName(), data);
	}

	private TcpUdpMessage getRequestMessage(SocketIOMessage data) {
		TcpUdpMessage message = new TcpUdpMessage();
		message.setStartFlag((byte) 0x7e);
		message.setAp((byte) 0x03);
		message.setVp((byte) 0x01);
		message.setSiteId(0x00000000);
		message.setDeviceId((byte) 0x00);
		message.setVpLayerFlag((byte) 0x80);
		message.setMcp((byte) 0x01);
		message.setCmdId((byte) 0x02);
		message.setRespFlag((byte) 0xff);
		message.setPDU(new byte[] { 0x01, 0x01, 0x00, 0x09, 0x05 });
		message.setEndFlag((byte) 0x7e);
		message.setPacketId((short) 0x00);
		return message;
	}
}
