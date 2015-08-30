package com.wellheadstone.nemms.server.task;

import io.netty.channel.Channel;
import io.netty.channel.ChannelHandlerContext;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import com.wellheadstone.nemms.common.viewmodel.IdValuePair;
import com.wellheadstone.nemms.server.domain.po.DeviceConnInfoPo;
import com.wellheadstone.nemms.server.domain.po.DeviceDataPo;
import com.wellheadstone.nemms.server.domain.po.DeviceReportPo;
import com.wellheadstone.nemms.server.domain.po.DeviceSitePo;
import com.wellheadstone.nemms.server.domain.service.ServiceFacade;
import com.wellheadstone.nemms.server.handler.tcp.TcpSocketChannelMap;
import com.wellheadstone.nemms.server.message.MessageUtils;
import com.wellheadstone.nemms.server.message.TcpUdpMessage;
import com.wellheadstone.nemms.server.util.Converter;
import com.wellheadstone.nemms.server.util.RemoteAdressFormatter;

public class HeartTask extends AbstractTask implements ITask {

	protected HeartTask(ChannelHandlerContext ctx, TcpUdpMessage msg) {
		super(ctx, msg);
	}

	@Override
	public int init() {
		return 0;
	}

	@Override
	public void execute() {
		String siteUid = Converter.getHexStringWith0X(Converter.getHexString(msg.getSiteId()));
		byte reportType = this.getReportType(msg.getPDU());
		if (reportType == 6 || reportType == 7) {
			this.addNewConn(ctx, msg, siteUid);
		}
		this.report(msg.getMcp(), msg.getPDU(), reportType, siteUid);
		ctx.channel().writeAndFlush(MessageUtils.getHeartReqMessage(msg));
	}

	private void addNewConn(ChannelHandlerContext ctx, TcpUdpMessage msg, String siteUid) {
		String devId = Converter.getHexString(msg.getDeviceId());
		if (devId.equals("00")) {
			DeviceConnInfoPo po = new DeviceConnInfoPo();
			po.setClientIp(RemoteAdressFormatter.getIP(ctx.channel().remoteAddress()));
			po.setSiteUid(siteUid);
			po.setServerIp(RemoteAdressFormatter.getIP(ctx.channel().localAddress()));
			po.setServerPort(RemoteAdressFormatter.getPort(ctx.channel().localAddress()));
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

	/**
	 * 站点告警上报
	 *
	 * @param pdu
	 * @param reportType
	 * @param siteUid
	 */
	private void report(byte mcpId, byte[] pdu, byte reportType, String siteUid) {
		Channel ch = TcpSocketChannelMap.get("nbi");
		if (ch != null) {
			List<IdValuePair> list = this.getReportDataList(pdu);
			for (IdValuePair item : list) {
				ch.writeAndFlush(this.getReportMessage(siteUid, item));

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
	}

	private List<IdValuePair> getReportDataList(byte[] pdu) {
		List<IdValuePair> list = new ArrayList<IdValuePair>(5);
		if (pdu == null || pdu.length < 4) {
			return null;
		}

		for (int i = pdu[0]; i < pdu.length;) {
			byte byteCountOfUnit = pdu[i];
			String id = Converter.getReverseHexString(pdu, i + 1, i + pdu[i] - 1);
			String value = String.valueOf(pdu[i + pdu[i] - 1]);
			list.add(new IdValuePair(id, value));
			i = i + byteCountOfUnit;
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
