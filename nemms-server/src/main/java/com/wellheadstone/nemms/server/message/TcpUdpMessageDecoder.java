package com.wellheadstone.nemms.server.message;

import io.netty.buffer.ByteBuf;
import io.netty.channel.ChannelHandlerContext;
import io.netty.handler.codec.ByteToMessageDecoder;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

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

		String info = String.format("receive from[%s][%s]bytes:%s",
				ctx.channel().remoteAddress(), bytes.length, Converter.bytesToHexString(escapeBytes));
		logger.info(info);

		TaskFactory.creator(ctx, msg).execute();
	}
}
