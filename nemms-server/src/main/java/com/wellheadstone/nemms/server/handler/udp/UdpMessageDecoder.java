package com.wellheadstone.nemms.server.handler.udp;

import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.socket.DatagramPacket;
import io.netty.handler.codec.MessageToMessageDecoder;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.wellheadstone.nemms.server.message.CMCCFDSMessage;
import com.wellheadstone.nemms.server.util.ByteBufToBytes;
import com.wellheadstone.nemms.server.util.ByteObjConverter;
import com.wellheadstone.nemms.server.util.Converter;

public class UdpMessageDecoder extends MessageToMessageDecoder<DatagramPacket> {
	private final static Logger logger = LoggerFactory.getLogger(UdpMessageDecoder.class);

	@Override
	protected void decode(ChannelHandlerContext ctx, DatagramPacket packet, List<Object> out) throws Exception {
		byte[] bytes = ByteBufToBytes.read(packet.content());
		byte[] escapeBytes = ByteObjConverter.escapeDecodeBytes(bytes);
		CMCCFDSMessage msg = ByteObjConverter.bytesToObject(escapeBytes);

		if (msg == null) {
			logger.info(String.format("receive from [%s] incorrect packet!", ctx.channel().remoteAddress()));
		} else {
			logger.info(String.format("receive from [%s][%s] bytes:%s",
					ctx.channel().remoteAddress(), escapeBytes.length, Converter.bytesToHexString(escapeBytes)));
			out.add(msg);
		}
	}
}
