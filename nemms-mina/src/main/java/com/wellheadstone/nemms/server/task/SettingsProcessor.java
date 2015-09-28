package com.wellheadstone.nemms.server.task;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.mina.core.session.IoSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.alibaba.fastjson.JSON;
import com.corundumstudio.socketio.SocketIOClient;
import com.wellheadstone.nemms.common.viewmodel.IdValuePair;
import com.wellheadstone.nemms.server.domain.po.DeviceParamPo;
import com.wellheadstone.nemms.server.domain.service.ServiceFacade;
import com.wellheadstone.nemms.server.handler.socketio.EventName;
import com.wellheadstone.nemms.server.message.CMCCFDSMessage;
import com.wellheadstone.nemms.server.message.MessageUtils;
import com.wellheadstone.nemms.server.message.SocketIOMessage;
import com.wellheadstone.nemms.server.util.Converter;
import com.wellheadstone.nemms.server.util.IoSessionUtils;

public class SettingsProcessor {
	private final static Logger logger = LoggerFactory.getLogger(SettingsProcessor.class);

	public static void execute(IoSession session, SocketIOClient client, SocketIOMessage data, CMCCFDSMessage message) {
		try {
			List<IdValuePair> paramList = JSON.parseArray(data.getParamUids(), IdValuePair.class);
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
				CMCCFDSMessage resMsg = IoSessionUtils.writeAndRead(session, data, message);
				QuerySelectedProcessor.execute(session, data, resMsg);
				client.sendEvent(EventName.Settings, data);

				list.clear();
				Converter.copyArrayToList(unit, list);
			}
		} catch (Exception ex) {
			logger.error("set params execute error.", ex);
		}
		data.setEof(true);
		data.setRequestText("");
		data.setResponseText(">>设置参数完成<<");
	}

	public static void execute(IoSession session, SocketIOMessage data, CMCCFDSMessage resMsg) {
		String siteUid = Converter.getHexStringWith0X(Converter.getHexString(resMsg.getSiteId()));
		MessageUtils.parseDataUnit(siteUid, resMsg.getMcp(), resMsg.getPDU());
	}
}
