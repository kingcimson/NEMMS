package com.wellheadstone.nemms.server.task;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.apache.mina.core.session.IoSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.corundumstudio.socketio.SocketIOClient;
import com.wellheadstone.nemms.server.domain.po.DeviceDataPo;
import com.wellheadstone.nemms.server.domain.service.ServiceFacade;
import com.wellheadstone.nemms.server.handler.socketio.EventName;
import com.wellheadstone.nemms.server.message.CMCCFDSMessage;
import com.wellheadstone.nemms.server.message.MessageUtils;
import com.wellheadstone.nemms.server.message.SocketIOMessage;
import com.wellheadstone.nemms.server.util.Converter;
import com.wellheadstone.nemms.server.util.IoSessionUtils;

public class GetParamListProcessor {
	private final static Logger logger = LoggerFactory.getLogger(GetParamListProcessor.class);

	public static void execute(IoSession session, SocketIOClient client, SocketIOMessage data, CMCCFDSMessage reqMsg) {
		try {
			CMCCFDSMessage resMsg = IoSessionUtils.writeAndRead(session, data, reqMsg);
			client.sendEvent(EventName.GetParamList, data);
			if (reqMsg != null) {
				String siteUid = Converter.getHexStringWith0X(Converter.getHexString(resMsg.getSiteId()));
				parseDataUnit(siteUid, resMsg.getMcp(), resMsg.getPDU());
				while (queryNext(resMsg.getMcp(), resMsg.getPDU())) {
					resMsg.setPDU(getNewPDU(resMsg.getMcp(), resMsg.getPDU()));
					session.write(MessageUtils.getParamListReqMessage(resMsg));
				}
			}
		} catch (Exception ex) {
			logger.error("get param list execute error.", ex);
		}
	}

	private static void parseDataUnit(String siteUid, byte mcp, byte[] pdu) {
		if (pdu == null || pdu.length < 4) {
			return;
		}

		int byteCount = mcp == 1 ? 2 : 4;
		int startIndex = mcp == 1 ? 5 : 7;
		int size = pdu.length / byteCount;
		List<DeviceDataPo> entities = new ArrayList<DeviceDataPo>(size);
		for (int i = startIndex; i < pdu.length; i = i + byteCount) {
			String paramUid = Converter.getReverseHexString(pdu, i, i + byteCount);
			DeviceDataPo po = new DeviceDataPo();
			po.setSiteUid(siteUid);
			po.setParamUid(Converter.getHexStringWith0X(paramUid));
			po.setMcpId((int) mcp);
			entities.add(po);
		}
		if (entities.size() > 0) {
			ServiceFacade.addParamList(entities);
		}
	}

	private static boolean queryNext(byte mcp, byte[] pdu) {
		if (pdu == null) {
			return false;
		}
		// mcp:a 参数标识为2字节
		if (mcp == 1 && pdu.length >= 4) {
			return (pdu[3] > pdu[4]);
		}
		// mcp:c 参数标识为4字节
		if (mcp == 3 && pdu.length >= 7) {
			return (pdu[5] > pdu[6]);
		}
		return false;
	}

	private static byte[] getNewPDU(byte mcp, byte[] srcPdu) {
		// mcp:a 参数标识为2字节
		if (mcp == 1) {
			srcPdu[0] = 0x05;
			srcPdu[4] += 1;
			return Arrays.copyOfRange(srcPdu, 0, 5);
		}
		// mcp:c 参数标识为4字节
		if (mcp == 3) {
			srcPdu[0] = 0x07;
			srcPdu[6] += 1;
			return Arrays.copyOfRange(srcPdu, 0, 7);
		}
		return new byte[] { 0x00 };
	}
}
