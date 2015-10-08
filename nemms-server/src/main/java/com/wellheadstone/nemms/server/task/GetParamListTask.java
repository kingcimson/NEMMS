package com.wellheadstone.nemms.server.task;

import io.netty.channel.ChannelHandlerContext;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.wellheadstone.nemms.server.collection.SocketIOClientMap;
import com.wellheadstone.nemms.server.domain.po.DeviceDataPo;
import com.wellheadstone.nemms.server.domain.service.ServiceFacade;
import com.wellheadstone.nemms.server.handler.socketio.SocketIOClientRequest;
import com.wellheadstone.nemms.server.message.CMCCFDSMessage;
import com.wellheadstone.nemms.server.util.Converter;
import com.wellheadstone.nemms.server.util.MessageUtils;

public class GetParamListTask extends AbstractTask implements ITask {
	private final static Logger logger = LoggerFactory.getLogger(GetParamListTask.class);

	protected GetParamListTask(ChannelHandlerContext ctx, CMCCFDSMessage msg) {
		super(ctx, msg);
	}

	@Override
	public int init() {
		return 0;
	}

	@Override
	public void execute() {
		try {
			String siteUid = MessageUtils.getSiteUid(msg);
			this.parseDataUnit(siteUid, msg.getMcp(), msg.getPDU());
			SocketIOClientRequest request = SocketIOClientMap.get(msg.getKey());
			if (request == null) {
				logger.error("not found socketio client request object");
				return;
			}

			request.getData().setResponseText(msg.toString());
			request.getData().setRespFlag(Converter.byteToShort(msg.getRespFlag()));
			request.getClient().sendEvent(request.getData().getEventName(), request.getData().clone());

			if (this.queryNext(msg.getMcp(), msg.getPDU())) {
				msg.setPDU(this.getNewPDU(msg.getMcp(), msg.getPDU()));
				msg = MessageUtils.getParamListReqMessage(msg);
				request.getData().setRequestText(msg.toString());
				ctx.channel().writeAndFlush(msg);
				return;
			}

			request.getData().setEof(true);
			request.getData().setRequestText("无");
			request.getData().setResponseText(">>获取参数列表全部完成<<");
			request.getClient().sendEvent(request.getData().getEventName(), request.getData().clone());
			SocketIOClientMap.remove(msg.getKey());
		} catch (Exception ex) {
			logger.error("get param list query execute error.", ex);
		}
	}

	private void parseDataUnit(String siteUid, byte mcp, byte[] pdu) {
		if (pdu == null || pdu.length < 4) {
			return;
		}

		int byteCount = mcp == 1 ? 2 : 4;
		int startIndex = mcp == 1 ? 5 : 7;
		int size = pdu.length / byteCount;
		List<DeviceDataPo> entities = new ArrayList<DeviceDataPo>(size);
		for (int i = startIndex; i < pdu.length; i = i + byteCount) {
			String hexUid = Converter.getReverseHexString(pdu, i, i + byteCount);
			DeviceDataPo po = new DeviceDataPo();
			po.setSiteUid(siteUid);
			po.setParamUid(MessageUtils.getParamUid(hexUid));
			po.setMcpId((int) mcp);
			entities.add(po);
		}
		if (entities.size() > 0) {
			ServiceFacade.addParamList(entities);
		}
	}

	private boolean queryNext(byte mcp, byte[] pdu) {
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

	private byte[] getNewPDU(byte mcp, byte[] srcPdu) {
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
