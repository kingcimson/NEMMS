package com.wellheadstone.nemms.server.protocol;

import io.netty.buffer.ByteBuf;
import io.netty.channel.ChannelHandlerContext;
import io.netty.handler.codec.ByteToMessageDecoder;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.wellheadstone.nemms.server.utils.ByteBufToBytes;
import com.wellheadstone.nemms.server.utils.ByteObjConverter;
import com.wellheadstone.nemms.server.utils.Converter;

public class TcpUdpMessageDecoder extends ByteToMessageDecoder {
	private final static Logger logger = LoggerFactory.getLogger(TcpUdpMessageDecoder.class);

	@Override
	protected void decode(ChannelHandlerContext ctx, ByteBuf in, List<Object> out) throws Exception {
		byte[] bytes = ByteBufToBytes.read(in);
		Object obj = ByteObjConverter.bytesToObject(bytes);
		out.add(obj);
		logger.info("接收[" + ctx.channel().remoteAddress() + "]的数据：" + Converter.bytesToHexString(bytes));
	}

}
