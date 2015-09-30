package com.wellheadstone.nemms.server.handler.tcp;

import io.netty.buffer.ByteBuf;
import io.netty.channel.ChannelHandlerContext;
import io.netty.handler.codec.MessageToByteEncoder;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.wellheadstone.nemms.server.message.CMCCFDSMessage;
import com.wellheadstone.nemms.server.util.CodecUtils;
import com.wellheadstone.nemms.server.util.Converter;

public class TcpMessageEncoder extends MessageToByteEncoder<CMCCFDSMessage> {
	private final static Logger logger = LoggerFactory.getLogger(TcpMessageEncoder.class);

	@Override
	protected void encode(ChannelHandlerContext ctx, CMCCFDSMessage msg, ByteBuf out) throws Exception {
		byte[] bytes = CodecUtils.messageToBytes(msg);
		out.writeBytes(bytes);
		ctx.flush();

		logger.info("send to tcp device [{}][{}] bytes:{}",
				ctx.channel().remoteAddress(), bytes.length, Converter.bytesToHexString(bytes));
	}
}
