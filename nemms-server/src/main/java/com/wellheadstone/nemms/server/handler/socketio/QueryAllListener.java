package com.wellheadstone.nemms.server.handler.socketio;

import io.netty.channel.Channel;

import java.net.InetSocketAddress;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.corundumstudio.socketio.AckRequest;
import com.corundumstudio.socketio.SocketIOClient;
import com.corundumstudio.socketio.listener.DataListener;
import com.wellheadstone.nemms.server.domain.po.DeviceConnInfoPo;
import com.wellheadstone.nemms.server.domain.po.DeviceParamPo;
import com.wellheadstone.nemms.server.domain.service.ServiceFacade;
import com.wellheadstone.nemms.server.handler.tcp.TcpSocketChannelMap;
import com.wellheadstone.nemms.server.handler.udp.UdpSocketChannelMap;
import com.wellheadstone.nemms.server.message.CMCCFDSMessage;
import com.wellheadstone.nemms.server.message.MessageUtils;
import com.wellheadstone.nemms.server.message.SocketIOMessage;
import com.wellheadstone.nemms.server.util.Converter;

public class QueryAllListener implements DataListener<SocketIOMessage> {
	private final static Logger logger = LoggerFactory.getLogger(QueryAllListener.class);

	@Override
	public void onData(SocketIOClient client, SocketIOMessage data, AckRequest ackSender) throws Exception {
		CMCCFDSMessage message = MessageUtils.getQueryAllReqMessage(data);
		DeviceConnInfoPo connInfo = ServiceFacade.getConnInfoBy(data.getUid());
		if (connInfo == null) {
			data.setRequestText("未找到当前站点与设备的连接服务器ip与port.");
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
		Channel channel = TcpSocketChannelMap.get(connInfo.getDeviceIp());
		if (channel == null) {
			data.setEof(true);
			data.setRequestText("未找到当前站点或设备的TCP连接通道.");
			client.sendEvent(EventName.QueryALL, data);
		} else {
			this.sendMessage(client, channel, data, message);
		}
	}

	private void sendUdpMessage(SocketIOClient client, SocketIOMessage data, CMCCFDSMessage message,
			DeviceConnInfoPo connInfo)
			throws InterruptedException {
		Channel channel = UdpSocketChannelMap.get(connInfo.getServerIp());
		if (channel == null) {
			data.setEof(true);
			data.setRequestText("未找到当前站点或设备的UDP连接通道.");
			client.sendEvent(EventName.QueryALL, data);
		} else {
			message.setRemoteAddress(new InetSocketAddress(connInfo.getDeviceIp(), connInfo.getDevicePort()));
			this.sendMessage(client, channel, data, message);
		}
	}

	private void sendMessage(SocketIOClient client, Channel channel, SocketIOMessage data, CMCCFDSMessage message) {
		try {
			Map<String, DeviceParamPo> paramMap = ServiceFacade.getDeviceParamMap();
			List<Byte> list = new ArrayList<Byte>(data.getApMaxLen());
			String[] paramIdList = StringUtils.split(data.getParamUids(), ',');

			short count = 0;
			for (int i = 0; i < paramIdList.length; i++) {
				String paramKey = MessageUtils.getDeviceParamKey(paramIdList[i], message.getMcp());
				DeviceParamPo po = paramMap.get(paramKey);
				if (po == null) {
					continue;
				}

				byte[] unit = MessageUtils.getUnitBytes(message.getMcp(), po);
				if (list.size() + unit.length < data.getApMaxLen()) {
					Converter.copyArrayToList(unit, list);
					if (i < paramIdList.length - 1) {
						continue;
					}
				}

				message.setPacketId(count++);
				message.setPDU(Converter.listToArray(list));
				data.setEof(i < paramIdList.length - 1);
				SocketIOClientMap.add(message, new SocketIOClientRequest(client, data, EventName.QueryALL));
				channel.writeAndFlush(message).sync();

				list.clear();
				Converter.copyArrayToList(unit, list);
			}
		} catch (Exception ex) {
			logger.error("query all params send message error.", ex);
		}
	}
}
