package com.wellheadstone.nemms.server.handler.socketio;

import io.netty.channel.Channel;

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
import com.wellheadstone.nemms.server.collection.SocketIOClientMap;
import com.wellheadstone.nemms.server.domain.po.DeviceParamPo;
import com.wellheadstone.nemms.server.domain.service.ServiceFacade;
import com.wellheadstone.nemms.server.message.CMCCFDSMessage;
import com.wellheadstone.nemms.server.message.SocketIOMessage;
import com.wellheadstone.nemms.server.util.Converter;
import com.wellheadstone.nemms.server.util.MessageUtils;
import com.wellheadstone.nemms.server.util.SocketIOClientUtils;

public class SettingsListener extends AbstractListener implements DataListener<SocketIOMessage> {
	private final static Logger logger = LoggerFactory.getLogger(SettingsListener.class);

	@Override
	public void onData(SocketIOClient client, SocketIOMessage data, AckRequest ackSender) throws Exception {
		CMCCFDSMessage message = MessageUtils.getSetupReqMessage(data);
		this.onData(client, data, message);
	}

	@Override
	protected void sendMessage(SocketIOClient client, Channel channel, SocketIOMessage data,
			CMCCFDSMessage message) throws InterruptedException {
		try {
			List<IdValuePair> paramList = JSON.parseArray(data.getParamUids(), IdValuePair.class);
			Map<String, DeviceParamPo> paramMap = ServiceFacade.getDeviceParamMap();
			List<Byte> list = new ArrayList<Byte>(data.getApMaxLen());

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
				if (list.size() + unit.length < data.getApMaxLen()) {
					Converter.copyArrayToList(unit, list);
					if (i < paramList.size() - 1) {
						continue;
					}
				}

				message.setPacketId(count++);
				message.setPDU(Converter.listToArray(list));
				data.setEof(i >= paramList.size() - 1);
				SocketIOClientMap.add(message, new SocketIOClientRequest(client, data.clone()));
				channel.writeAndFlush(message);
				if (!SocketIOClientMap.wait(message.getKey(), data.getTot1() * 1000)) {
					SocketIOClientUtils.sendEofEvent(client, data, ">>数据接收失败或响应超时<<");
					break;
				}
				SocketIOClientUtils.sendEvent(message, ">>设置参数操作全部完成<<");

				list.clear();
				Converter.copyArrayToList(unit, list);
			}
		} catch (Exception ex) {
			logger.error("set params send message error.", ex);
			SocketIOClientUtils.sendErrorEvent(client, data, "发送请求数据时发生程序异常");
		}
	}
}
