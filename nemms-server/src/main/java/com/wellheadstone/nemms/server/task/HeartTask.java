package com.wellheadstone.nemms.server.task;

import io.netty.channel.ChannelHandlerContext;

import com.wellheadstone.nemms.server.domain.po.DeviceConnInfoPo;
import com.wellheadstone.nemms.server.domain.service.ServiceFacade;
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
		this.addNewConn(ctx, msg);
		ctx.channel().writeAndFlush(MessageUtils.getHeartReqMessage(msg));
	}
	
	private void addNewConn(ChannelHandlerContext ctx,TcpUdpMessage msg){
		String siteUid = Converter.getHexString(msg.getSiteId());
		String devId = Converter.getHexString(msg.getDeviceId());
		if (devId.equals("00")) {
			DeviceConnInfoPo po = new DeviceConnInfoPo();
			po.setClientIp(RemoteAdressFormatter.getIP(ctx.channel().remoteAddress()));
			po.setSiteUid("0x" + siteUid);
			po.setServerIp(RemoteAdressFormatter.getIP(ctx.channel().localAddress()));
			po.setServerPort(RemoteAdressFormatter.getPort(ctx.channel().localAddress()));
			ServiceFacade.addNewDeviceConn(po);
		}
	}

}
