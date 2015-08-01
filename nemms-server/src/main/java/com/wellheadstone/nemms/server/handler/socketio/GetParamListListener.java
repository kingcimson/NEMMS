package com.wellheadstone.nemms.server.handler.socketio;

import io.netty.channel.socket.SocketChannel;

import java.util.List;

import com.corundumstudio.socketio.AckRequest;
import com.corundumstudio.socketio.SocketIOClient;
import com.corundumstudio.socketio.listener.DataListener;
import com.wellheadstone.nemms.data.util.SpringContextUtils;
import com.wellheadstone.nemms.server.domain.po.DeviceParamPo;
import com.wellheadstone.nemms.server.domain.po.SitePo;
import com.wellheadstone.nemms.server.domain.service.DeviceParamService;
import com.wellheadstone.nemms.server.domain.service.SiteService;
import com.wellheadstone.nemms.server.handler.tcp.TcpSocketChannelMap;
import com.wellheadstone.nemms.server.protocol.SocketIOMessage;
import com.wellheadstone.nemms.server.protocol.TcpUdpMessage;

public class GetParamListListener implements DataListener<SocketIOMessage> {

	@Override
	public void onData(SocketIOClient client, SocketIOMessage data, AckRequest ackSender) throws Exception {
		SocketIOClientMap.add(client.getSessionId(), client);
		SocketChannel channel = (SocketChannel) TcpSocketChannelMap.get("client1");
		if (channel != null) {
			TcpUdpMessage message = new TcpUdpMessage();
			message.setStartFlag((byte) 0x7e);
			message.setAp((byte) 0x03);
			message.setVp((byte) 0x01);
			message.setSiteId(0x02020005);
			message.setDeviceId((byte) 0x00);
			message.setVpLayerFlag((byte) 0x80);
			message.setMcp((byte) 0x01);
			message.setCmdId((byte) 0x02);
			message.setRespFlag((byte) 0xff);
			message.setPDU(new byte[] { 0x01, 0x01, 0x00, 0x09, 0x05 });
			message.setEndFlag((byte) 0x7e);
			message.setPacketId((short) 0x00);
			channel.writeAndFlush(message);
		}
	}

	private List<DeviceParamPo> getAllParams() {
		DeviceParamService deviceParamService = SpringContextUtils.getBean(DeviceParamService.class);
		return deviceParamService.getAll();
	}

	private SitePo getSite(int siteId) {
		SiteService siteService = SpringContextUtils.getBean(SiteService.class);
		return siteService.getById(siteId);
	}

	private void send(SitePo site) {
		if (site.getProtocol() == "1") {
		}
	}
}
