package com.wellheadstone.nemms.server.handler.udp;

import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.socket.DatagramPacket;
import io.netty.handler.codec.MessageToMessageDecoder;

import java.util.Arrays;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.wellheadstone.nemms.server.message.CMCCFDSMessage;
import com.wellheadstone.nemms.server.util.ByteBufUtils;
import com.wellheadstone.nemms.server.util.CodecUtils;
import com.wellheadstone.nemms.server.util.Converter;

public class UdpMessageDecoder extends MessageToMessageDecoder<DatagramPacket> {
	private final static Logger logger = LoggerFactory.getLogger(UdpMessageDecoder.class);

	@Override
	protected void decode(ChannelHandlerContext ctx, DatagramPacket packet, List<Object> out) throws Exception {
		byte[] bytes = ByteBufUtils.toBytes(packet.content());
		byte[] escapeBytes = CodecUtils.escapeDecodeBytes(Arrays.copyOfRange(bytes, 1, bytes.length - 1));
		CMCCFDSMessage msg = CodecUtils.bytesToMessage(escapeBytes);

		if (msg == null) {
			logger.info("receive from udp device [{}] incorrect packet!", packet.sender());
		} else {
			logger.info("receive from udp device [{}][{}] bytes:{}", packet.sender(),
					escapeBytes.length, Converter.bytesToHexString(escapeBytes));
			msg.setRemoteAddress(packet.sender());
			out.add(msg);
		}
	}
}
