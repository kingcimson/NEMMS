package com.wellheadstone.nemms.server.message;

import io.netty.buffer.ByteBuf;
import io.netty.channel.ChannelHandlerContext;
import io.netty.handler.codec.MessageToByteEncoder;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.wellheadstone.nemms.server.util.ByteObjConverter;
import com.wellheadstone.nemms.server.util.Converter;

public class TcpUdpMessageEncoder extends MessageToByteEncoder<TcpUdpMessage> {
	private final static Logger logger = LoggerFactory.getLogger(TcpUdpMessageEncoder.class);

	@Override
	protected void encode(ChannelHandlerContext ctx, TcpUdpMessage msg, ByteBuf out) throws Exception {
		byte[] bytes = ByteObjConverter.objectToBytes(msg);
		out.writeBytes(bytes);
		ctx.flush();

		logger.info(String.format("send to [%s][%s] bytes:%s",
				ctx.channel().remoteAddress(), bytes.length, Converter.bytesToHexString(bytes)));
	}
}
