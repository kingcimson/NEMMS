package com.wellheadstone.nemms.server.handler.socketio;

import io.netty.channel.socket.SocketChannel;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.alibaba.fastjson.JSON;
import com.corundumstudio.socketio.AckRequest;
import com.corundumstudio.socketio.SocketIOClient;
import com.corundumstudio.socketio.listener.DataListener;
import com.wellheadstone.nemms.common.viewmodel.IdValuePair;
import com.wellheadstone.nemms.server.domain.po.DeviceConnInfoPo;
import com.wellheadstone.nemms.server.domain.po.DeviceParamPo;
import com.wellheadstone.nemms.server.domain.service.ServiceFacade;
import com.wellheadstone.nemms.server.handler.tcp.TcpSocketChannelMap;
import com.wellheadstone.nemms.server.message.MessageUtils;
import com.wellheadstone.nemms.server.message.SocketIOMessage;
import com.wellheadstone.nemms.server.message.TcpUdpMessage;

public class SettingsListener implements DataListener<SocketIOMessage> {
	private final static Logger logger = LoggerFactory.getLogger(SettingsListener.class);

	@Override
	public void onData(SocketIOClient client, SocketIOMessage data, AckRequest ackSender) throws Exception {
		TcpUdpMessage message = MessageUtils.getSetupReqMessage(data);
		data.setRequestText(message.toString());

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
		client.sendEvent(EventName.Settings, data);
	}

	private void sendMessage(SocketChannel channel, SocketIOMessage data, TcpUdpMessage message) {
		try {
			List<IdValuePair> paramList = JSON.parseArray(data.getParamUids(), IdValuePair.class);
			Map<String, DeviceParamPo> paramMap = ServiceFacade.getDeviceParamMap();
			ArrayList<Byte> list = new ArrayList<Byte>(235);
			for (int i = 0; i < paramList.size(); i++) {
				String paramId = paramList.get(i).getId();
				// String value = paramList.get(i).getValue().trim();
				String paramKey = MessageUtils.getDeviceParamKey(paramId, message.getMcp());
				DeviceParamPo po = paramMap.get(paramKey);
				if (po == null) {
					continue;
				}
				byte[] unit = MessageUtils.getUnitBytes(message.getMcp(), po);
				if (list.size() + unit.length < 235) {
					MessageUtils.setPdu(list, unit);
					if (i < paramList.size() - 1) {
						continue;
					}
				}
				message.setPDU(MessageUtils.getPdu(list));
				data.setRequestText(message.toString() + ";" + data.getRequestText());
				channel.writeAndFlush(message);
				list.clear();
				MessageUtils.setPdu(list, unit);
			}
		} catch (Exception ex) {
			logger.error("SetupListener send message error.", ex);
		}
	}
}
