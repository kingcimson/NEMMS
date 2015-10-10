package com.wellheadstone.nemms.server.task;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.apache.mina.core.session.IoSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.wellheadstone.nemms.common.viewmodel.IdValuePair;
import com.wellheadstone.nemms.server.collection.TcpSessionMap;
import com.wellheadstone.nemms.server.domain.po.DeviceConnInfoPo;
import com.wellheadstone.nemms.server.domain.po.DeviceDataPo;
import com.wellheadstone.nemms.server.domain.po.DeviceReportPo;
import com.wellheadstone.nemms.server.domain.po.DeviceSitePo;
import com.wellheadstone.nemms.server.domain.service.ServiceFacade;
import com.wellheadstone.nemms.server.message.CMCCFDSMessage;
import com.wellheadstone.nemms.server.util.Converter;
import com.wellheadstone.nemms.server.util.MessageUtils;
import com.wellheadstone.nemms.server.util.SocketAddressUtils;

public class HeartTask extends AbstractTask implements ITask {
	private final static Logger logger = LoggerFactory.getLogger(HeartTask.class);

	protected HeartTask(IoSession session, CMCCFDSMessage msg) {
		super(session, msg);
	}

	@Override
	public int init() {
		return 0;
	}

	@Override
	public void execute() {
		try {
			String siteUid = MessageUtils.getSiteUid(msg);
			byte reportType = this.getReportType(msg.getPDU());
			if (reportType == 6 || reportType == 7) {
				this.addNewConn(session, msg, siteUid);
			} else {
				// 如果不是心跳或登录包则上报给北向接口
				this.report(msg.getMcp(), msg.getPDU(), reportType, siteUid);
			}
			session.write(MessageUtils.getHeartResMessage(msg));
		} catch (Exception ex) {
			logger.error("heart task execute error.", ex);
		}
	}

	private void addNewConn(IoSession session, CMCCFDSMessage msg, String siteUid) {
		String devId = Converter.getHexString(msg.getDeviceId());
		if (devId.equals("00")) {
			DeviceConnInfoPo po = new DeviceConnInfoPo();
			po.setSiteUid(siteUid);
			po.setDeviceIp(SocketAddressUtils.getIP(session.getRemoteAddress()));
			po.setDevicePort(SocketAddressUtils.getPort(session.getRemoteAddress()));
			po.setServerIp(SocketAddressUtils.getIP(session.getLocalAddress()));
			po.setServerPort(SocketAddressUtils.getPort(session.getLocalAddress()));
			ServiceFacade.addNewDeviceConn(po);
		}
	}

	private byte getReportType(byte[] pdu) {
		if (pdu == null || pdu.length < 4) {
			return 0;
		}
		if (pdu[0] == 4) {
			return pdu[3];
		}
		if (pdu[0] == 6) {
			return pdu[5];
		}
		return 0;
	}

	private void report(byte mcpId, byte[] pdu, byte reportType, String siteUid) {
		IoSession session = TcpSessionMap.get("nbi");
		List<IdValuePair> list = this.getReportDataList(pdu);
		for (IdValuePair item : list) {
			if (session != null) {
				session.write(this.getReportMessage(siteUid, item));
			}
			DeviceReportPo po = new DeviceReportPo();
			po.setSiteUid(siteUid);
			po.setType((int) reportType);
			po.setContent(String.format("%s:%s", item.getId(), item.getValue()));
			ServiceFacade.addAlarmReport(po);

			DeviceDataPo dataPo = new DeviceDataPo();
			dataPo.setSiteUid(siteUid);
			dataPo.setParamUid(item.getId());
			dataPo.setMcpId((int) mcpId);
			dataPo.setValue(item.getValue());
			ServiceFacade.updateAlarmReport(dataPo);
		}

	}

	private List<IdValuePair> getReportDataList(byte[] pdu) {
		if (pdu == null || pdu.length < 4) {
			return new ArrayList<IdValuePair>(5);
		}

		List<IdValuePair> list = new ArrayList<IdValuePair>(5);
		for (int i = pdu[0]; i < pdu.length;) {
			String id = Converter.getReverseHexString(pdu, i + 1, i + pdu[i] - 1);
			id = MessageUtils.getParamUid(id);
			String value = String.valueOf(pdu[i + pdu[i] - 1]);
			list.add(new IdValuePair(id, value));
			i = i + pdu[i];
		}

		return list;
	}

	private String getReportMessage(String siteUid, IdValuePair item) {
		DeviceSitePo po = ServiceFacade.getDeviceSiteBy(siteUid);
		String str = String.format("name=%s,device_type=%s,"
				+ "location=%s,manufactor=%s,"
				+ "site_uid=%s,param_uid=%s,mcp_id=%s,value=%s,update_time=%s\r\n",
				po.getName(), po.getDeviceType(), po.getLocation(), po.getManufactor(),
				po.getUid(), item.getId(), po.getMcpProtocol(), item.getValue(),
				Calendar.getInstance().getTime());
		return str;
	}
}
