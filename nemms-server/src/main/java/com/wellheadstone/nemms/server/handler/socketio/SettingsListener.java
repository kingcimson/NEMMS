package com.wellheadstone.nemms.server.handler.socketio;

import io.netty.channel.socket.SocketChannel;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
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
import com.wellheadstone.nemms.server.util.Converter;

public class SettingsListener implements DataListener<SocketIOMessage> {
	private final static Logger logger = LoggerFactory.getLogger(SettingsListener.class);

	@Override
	public void onData(SocketIOClient client, SocketIOMessage data, AckRequest ackSender) throws Exception {
		TcpUdpMessage message = MessageUtils.getSetupReqMessage(data);
		DeviceConnInfoPo connInfo = ServiceFacade.getConnInfoBy(data.getUid());
		if (connInfo == null) {
			data.setRequestText("未找到当前站点与设备的连接服务器ip与port.");
		} else {
			SocketChannel channel = (SocketChannel) TcpSocketChannelMap.get(connInfo.getDeviceIp());
			if (channel == null) {
				data.setRequestText("未找到当前站点或设备的连接通道.");
			} else {
				List<IdValuePair> paramList = JSON.parseArray(data.getParamUids(), IdValuePair.class);
				data.setRequestText(this.sendMessage(channel, paramList, message));
			}
		}
		client.sendEvent(EventName.Settings, data);
	}

	private String sendMessage(SocketChannel channel, List<IdValuePair> paramList, TcpUdpMessage message) {
		List<String> msgList = new ArrayList<String>(6);
		try {
			Map<String, DeviceParamPo> paramMap = ServiceFacade.getDeviceParamMap();
			List<Byte> list = new ArrayList<Byte>(235);
			short count = 0;
			for (int i = 0; i < paramList.size(); i++) {
				String paramId = paramList.get(i).getId();
				String value = paramList.get(i).getValue().trim();
				String paramKey = MessageUtils.getDeviceParamKey(paramId, message.getMcp());
				DeviceParamPo po = paramMap.get(paramKey);
				if (po == null) {
					continue;
				}
				byte[] unit = MessageUtils.getUnitBytes(message.getMcp(), po, value);
				if (unit == null) {
					continue;
				}
				if (list.size() + unit.length < 235) {
					Converter.copyArrayToList(unit, list);
					if (i < paramList.size() - 1) {
						continue;
					}
				}
				message.setPacketId(count++);
				message.setPDU(Converter.listToArray(list));
				msgList.add(message.toString());
				channel.writeAndFlush(message);

				list.clear();
				Converter.copyArrayToList(unit, list);
			}
		} catch (Exception ex) {
			logger.error("SetupListener send message error.", ex);
		}
		return StringUtils.join(msgList, ";");
	}
}
