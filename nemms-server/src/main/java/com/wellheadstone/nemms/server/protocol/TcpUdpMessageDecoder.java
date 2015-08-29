package com.wellheadstone.nemms.server.protocol;

import io.netty.buffer.ByteBuf;
import io.netty.channel.ChannelHandlerContext;
import io.netty.handler.codec.ByteToMessageDecoder;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.wellheadstone.nemms.server.domain.po.DeviceConnInfoPo;
import com.wellheadstone.nemms.server.domain.service.ServiceFacade;
import com.wellheadstone.nemms.server.utils.ByteBufToBytes;
import com.wellheadstone.nemms.server.utils.ByteObjConverter;
import com.wellheadstone.nemms.server.utils.Converter;
import com.wellheadstone.nemms.server.utils.RemoteAdressFormatter;

public class TcpUdpMessageDecoder extends ByteToMessageDecoder {
	private final static Logger logger = LoggerFactory.getLogger(TcpUdpMessageDecoder.class);

	@Override
	protected void decode(ChannelHandlerContext ctx, ByteBuf in, List<Object> out) throws Exception {
		byte[] bytes = ByteBufToBytes.read(in);
		String siteUid = Converter.getHexString(bytes, 3, 7);
		String devId = Converter.getHexString(bytes, 7, 8);
		Object obj = ByteObjConverter.bytesToObject(bytes);
		out.add(obj);

		if (devId.equals("00")) {
			DeviceConnInfoPo po = new DeviceConnInfoPo();
			po.setClientIp(RemoteAdressFormatter.getIP(ctx.channel().remoteAddress()));
			po.setSiteUid("0x" + siteUid);
			po.setServerIp(RemoteAdressFormatter.getIP(ctx.channel().localAddress()));
			po.setServerPort(RemoteAdressFormatter.getPort(ctx.channel().localAddress()));
			ServiceFacade.addNewDeviceConn(po);
		}

		String info = String.format("receive from[%s][%s]bytes:%s",
				ctx.channel().remoteAddress(), bytes.length, Converter.bytesToHexString(bytes));
		logger.info(info);
	}

	private void reportProcess(ChannelHandlerContext ctx, Object msg) {
	}
}
