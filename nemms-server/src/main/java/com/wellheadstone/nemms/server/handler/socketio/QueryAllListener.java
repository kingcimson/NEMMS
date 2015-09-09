package com.wellheadstone.nemms.server.handler.socketio;

import io.netty.channel.socket.SocketChannel;

import java.util.ArrayList;
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
import com.wellheadstone.nemms.server.message.MessageUtils;
import com.wellheadstone.nemms.server.message.SocketIOMessage;
import com.wellheadstone.nemms.server.message.TcpUdpMessage;

public class QueryAllListener implements DataListener<SocketIOMessage> {
	private final static Logger logger = LoggerFactory.getLogger(QueryAllListener.class);

	@Override
	public void onData(SocketIOClient client, SocketIOMessage data, AckRequest ackSender) throws Exception {
		TcpUdpMessage message = MessageUtils.getQueryAllReqMessage(data);
		DeviceConnInfoPo connInfo = ServiceFacade.getConnInfoBy(data.getUid());
		if (connInfo == null) {
			data.setResponseText("未找到当前站点与设备的连接服务器ip与port.");
		} else {
			SocketChannel channel = (SocketChannel) TcpSocketChannelMap.get(connInfo.getClientIp());
			if (channel == null) {
				data.setRequestText("未找到当前站点或设备的连接通道.");
			} else {
				this.sendMessage(channel, data, message);
			}
		}
		client.sendEvent(EventName.QueryALL, data);
	}

	private void sendMessage(SocketChannel channel, SocketIOMessage data, TcpUdpMessage message) {
		try {
			String[] paramIdList = StringUtils.split(data.getParamUids(), ',');
			Map<String, DeviceParamPo> paramMap = ServiceFacade.getDeviceParamMap();
			ArrayList<Byte> list = new ArrayList<Byte>(235);
			short count = 0;
			for (int i = 0; i < paramIdList.length; i++) {
				String paramKey = MessageUtils.getDeviceParamKey(paramIdList[i], message.getMcp());
				DeviceParamPo po = paramMap.get(paramKey);
				if (po == null) {
					continue;
				}
				byte[] unit = MessageUtils.getUnitBytes(message.getMcp(), po);
				if (list.size() + unit.length < 235) {
					MessageUtils.setPdu(list, unit);
					if (i < paramIdList.length - 1) {
						continue;
					}
				}
				message.setPacketId(count++);
				message.setPDU(MessageUtils.getPdu(list));
				data.setRequestText(message.toString() + ";" + data.getRequestText());
				channel.writeAndFlush(message);
				Thread.sleep(2000);
				list.clear();
				MessageUtils.setPdu(list, unit);
			}
		} catch (Exception ex) {
			logger.error("QueryAllListener send message error.", ex);
		}
	}
}
