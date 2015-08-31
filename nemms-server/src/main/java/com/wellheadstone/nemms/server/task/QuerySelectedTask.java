package com.wellheadstone.nemms.server.task;

import io.netty.channel.ChannelHandlerContext;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.wellheadstone.nemms.server.domain.po.DeviceDataPo;
import com.wellheadstone.nemms.server.domain.po.DeviceParamPo;
import com.wellheadstone.nemms.server.domain.service.ServiceFacade;
import com.wellheadstone.nemms.server.message.MessageUtils;
import com.wellheadstone.nemms.server.message.TcpUdpMessage;
import com.wellheadstone.nemms.server.util.Converter;

public class QuerySelectedTask extends AbstractTask implements ITask {
	private final static Logger logger = LoggerFactory.getLogger(QuerySelectedTask.class);

	protected QuerySelectedTask(ChannelHandlerContext ctx, TcpUdpMessage msg) {
		super(ctx, msg);
	}

	@Override
	public int init() {
		return 0;
	}

	@Override
	public void execute() {
		try {
			String siteUid = Converter.getHexStringWith0X(Converter.getHexString(msg.getSiteId()));
			this.parseDataUnit(siteUid, msg.getMcp(), msg.getPDU());
			logger.info(">>>query params value finished<<<");
		} catch (Exception ex) {
			logger.error("QuerySelectedTask execute error.", ex);
		}
	}

	private void parseDataUnit(String siteUid, byte mcp, byte[] pdu) {
		if (pdu == null || pdu.length < 4) {
			return;
		}

		int byteCount = mcp == 1 ? 2 : 4;
		int size = pdu.length / byteCount;
		List<DeviceDataPo> entities = new ArrayList<DeviceDataPo>(size);
		Map<String, DeviceParamPo> paramMap = ServiceFacade.getParamList(mcp);
		for (int i = 0; i < pdu.length;) {
			int unitLength = pdu[i];
			int startIndex = i + 1;
			int endIndex = startIndex + byteCount;

			String paramUid = Converter.getReverseHexString(pdu, startIndex, endIndex);
			DeviceDataPo po = new DeviceDataPo();
			po.setSiteUid(siteUid);
			po.setParamUid(Converter.getHexStringWith0X(paramUid));
			po.setMcpId((int) mcp);
			po.setValue(MessageUtils.getParamValue(pdu, endIndex, i + unitLength, paramMap.get(po.getParamUid())));
			entities.add(po);

			i = i + unitLength;
		}
		ServiceFacade.updateParamListValue(entities);
	}
}
