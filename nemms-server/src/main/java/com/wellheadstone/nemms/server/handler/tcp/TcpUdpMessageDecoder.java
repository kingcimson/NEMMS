package com.wellheadstone.nemms.server.handler.tcp;

import io.netty.buffer.ByteBuf;
import io.netty.channel.ChannelHandlerContext;
import io.netty.handler.codec.ByteToMessageDecoder;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.wellheadstone.nemms.server.message.TcpUdpMessage;
import com.wellheadstone.nemms.server.task.TaskFactory;
import com.wellheadstone.nemms.server.util.ByteBufToBytes;
import com.wellheadstone.nemms.server.util.ByteObjConverter;
import com.wellheadstone.nemms.server.util.Converter;

public class TcpUdpMessageDecoder extends ByteToMessageDecoder {
	private final static Logger logger = LoggerFactory.getLogger(TcpUdpMessageDecoder.class);

	@Override
	protected void decode(ChannelHandlerContext ctx, ByteBuf in, List<Object> out) throws Exception {
		byte[] bytes = ByteBufToBytes.read(in);
		byte[] escapeBytes = ByteObjConverter.escapeDecodeBytes(bytes);
		TcpUdpMessage msg = ByteObjConverter.bytesToObject(escapeBytes);

		if (msg == null) {
			logger.info(String.format("receive from [%s] incorrect packet!", ctx.channel().remoteAddress()));
		} else {
			logger.info(String.format("receive from [%s][%s] bytes:%s",
					ctx.channel().remoteAddress(), escapeBytes.length, Converter.bytesToHexString(escapeBytes)));
			TaskFactory.creator(ctx, msg).execute();
		}
	}
}
