package com.wellheadstone.nemms.server.handler.socketio;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.mina.core.session.IoSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.corundumstudio.socketio.AckRequest;
import com.corundumstudio.socketio.SocketIOClient;
import com.corundumstudio.socketio.listener.DataListener;
import com.wellheadstone.nemms.server.collection.SocketIOClientMap;
import com.wellheadstone.nemms.server.domain.po.DeviceParamPo;
import com.wellheadstone.nemms.server.domain.service.ServiceFacade;
import com.wellheadstone.nemms.server.message.CMCCFDSMessage;
import com.wellheadstone.nemms.server.message.SocketIOMessage;
import com.wellheadstone.nemms.server.util.Converter;
import com.wellheadstone.nemms.server.util.MessageUtils;
import com.wellheadstone.nemms.server.util.SocketIOClientUtils;

public class QueryAllListener extends AbstractListener implements DataListener<SocketIOMessage> {
	private final static Logger logger = LoggerFactory.getLogger(QueryAllListener.class);

	@Override
	public void onData(SocketIOClient client, SocketIOMessage data, AckRequest ackSender) throws Exception {
		CMCCFDSMessage message = MessageUtils.getQueryAllReqMessage(data);
		this.onData(client, data, message);
	}

	@Override
	protected void sendMessage(SocketIOClient client,
			IoSession session, SocketIOMessage data, CMCCFDSMessage message) throws InterruptedException {
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
				data.setEof(i >= paramIdList.length - 1);
				SocketIOClientMap.add(message, new SocketIOClientRequest(client, data.clone()));
				session.write(message);
				if (!SocketIOClientMap.wait(message.getKey(), data.getTot1() * 1000)) {
					SocketIOClientUtils.sendEofEvent(client, data, ">>数据接收失败或响应超时<<");
					break;
				}

				list.clear();
				Converter.copyArrayToList(unit, list);
			}
		} catch (Exception ex) {
			logger.error("query all params send message error.", ex);
		}
	}
}
