package com.wellheadstone.nemms.server.task;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.mina.core.session.IoSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.corundumstudio.socketio.SocketIOClient;
import com.wellheadstone.nemms.server.domain.po.DeviceParamPo;
import com.wellheadstone.nemms.server.domain.service.ServiceFacade;
import com.wellheadstone.nemms.server.handler.socketio.EventName;
import com.wellheadstone.nemms.server.message.CMCCFDSMessage;
import com.wellheadstone.nemms.server.message.MessageUtils;
import com.wellheadstone.nemms.server.message.SocketIOMessage;
import com.wellheadstone.nemms.server.util.Converter;
import com.wellheadstone.nemms.server.util.IoSessionUtils;

public class QuerySelectedProcessor {
	private final static Logger logger = LoggerFactory.getLogger(QuerySelectedProcessor.class);

	public static void execute(IoSession session, SocketIOClient client, String eventName, SocketIOMessage data,
			CMCCFDSMessage message) {
		try {
			Map<String, DeviceParamPo> paramMap = ServiceFacade.getDeviceParamMap();
			List<Byte> list = new ArrayList<Byte>(235);
			String[] paramIdList = StringUtils.split(data.getParamUids(), ',');

			short count = 0;
			for (int i = 0; i < paramIdList.length; i++) {
				String paramKey = MessageUtils.getDeviceParamKey(paramIdList[i], message.getMcp());
				DeviceParamPo po = paramMap.get(paramKey);
				if (po == null) {
					continue;
				}

				byte[] unit = MessageUtils.getUnitBytes(message.getMcp(), po);
				if (list.size() + unit.length < 235) {
					Converter.copyArrayToList(unit, list);
					if (i < paramIdList.length - 1) {
						continue;
					}
				}

				message.setPacketId(count++);
				message.setPDU(Converter.listToArray(list));
				CMCCFDSMessage resMsg = IoSessionUtils.writeAndRead(session, data, message);
				QuerySelectedProcessor.execute(session, data, resMsg);
				data.setRespFlag(Converter.byteToShort(resMsg.getRespFlag()));
				client.sendEvent(eventName, data);

				list.clear();
				Converter.copyArrayToList(unit, list);
			}
		} catch (Exception ex) {
			logger.error("query params execute error.", ex);
		}
		data.setEof(true);
		data.setRequestText("");
		data.setResponseText(">>查询全部完成<<");
		client.sendEvent(EventName.QuerySelected, data);
	}

	public static void execute(IoSession session, SocketIOMessage data, CMCCFDSMessage resMsg) {
		String siteUid = Converter.getHexStringWith0X(Converter.getHexString(resMsg.getSiteId()));
		MessageUtils.parseDataUnit(siteUid, resMsg.getMcp(), resMsg.getPDU());
	}
}
