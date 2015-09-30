package com.wellheadstone.nemms.server.handler.udp;

import io.netty.buffer.ByteBuf;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.socket.DatagramPacket;
import io.netty.handler.codec.MessageToMessageEncoder;

import java.net.InetSocketAddress;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.wellheadstone.nemms.server.message.CMCCFDSMessage;
import com.wellheadstone.nemms.server.util.CodecUtils;
import com.wellheadstone.nemms.server.util.Converter;

public class UdpMessageEncoder extends MessageToMessageEncoder<CMCCFDSMessage> {
	private final static Logger logger = LoggerFactory.getLogger(UdpMessageEncoder.class);

	@Override
	protected void encode(ChannelHandlerContext ctx, CMCCFDSMessage msg, List<Object> out) throws Exception {
		byte[] bytes = CodecUtils.messageToBytes(msg);
		ByteBuf byteBuf = ctx.alloc().buffer().writeBytes(bytes);
		InetSocketAddress recipient = (InetSocketAddress) msg.getRemoteAddress();
		out.add(new DatagramPacket(byteBuf, recipient));

		logger.info("send to udp device [{}][{}] bytes:{}",
				msg.getRemoteAddress(), bytes.length, Converter.bytesToHexString(bytes));
	}
}
