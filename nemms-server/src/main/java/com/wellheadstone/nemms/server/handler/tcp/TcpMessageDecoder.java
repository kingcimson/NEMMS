package com.wellheadstone.nemms.server.handler.tcp;

import io.netty.buffer.ByteBuf;
import io.netty.channel.ChannelHandlerContext;
import io.netty.handler.codec.ByteToMessageDecoder;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.wellheadstone.nemms.server.message.CMCCFDSMessage;
import com.wellheadstone.nemms.server.util.ByteBufUtils;
import com.wellheadstone.nemms.server.util.CodecUtils;
import com.wellheadstone.nemms.server.util.Converter;

public class TcpMessageDecoder extends ByteToMessageDecoder {
	private final static Logger logger = LoggerFactory.getLogger(TcpMessageDecoder.class);

	@Override
	protected void decode(ChannelHandlerContext ctx, ByteBuf in, List<Object> out) throws Exception {
		byte[] bytes = ByteBufUtils.toBytes(in);
		byte[] escapeBytes = CodecUtils.escapeDecodeBytes(bytes);
		CMCCFDSMessage msg = CodecUtils.bytesToMessage(escapeBytes);

		if (msg == null) {
			logger.info("receive from tcp device [{}] incorrect packet!", ctx.channel().remoteAddress());
		} else {
			logger.info("receive from tcp device [{}][{}] bytes:{}", ctx.channel().remoteAddress(),
					escapeBytes.length, Converter.bytesToHexString(escapeBytes));
			msg.setRemoteAddress(ctx.channel().remoteAddress());
			out.add(msg);
		}
	}
}
