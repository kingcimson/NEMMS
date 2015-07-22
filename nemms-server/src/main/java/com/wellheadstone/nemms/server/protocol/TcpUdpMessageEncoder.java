package com.wellheadstone.nemms.server.protocol;

import io.netty.buffer.ByteBuf;
import io.netty.channel.ChannelHandlerContext;
import io.netty.handler.codec.MessageToByteEncoder;

public class TcpUdpMessageEncoder extends MessageToByteEncoder<TcpUdpMessage> {
	@Override
	protected void encode(ChannelHandlerContext ctx, TcpUdpMessage msg, ByteBuf out) throws Exception {
		out.writeByte(msg.getStartFlag());
		out.writeByte(msg.getAp());
		out.writeByte(msg.getVp());
		out.writeInt(msg.getSiteId());
		out.writeByte(msg.getStartFlag());
		out.writeByte(msg.getStartFlag());
		out.writeByte(msg.getStartFlag());
		out.writeByte(msg.getStartFlag());
		out.writeByte(msg.getStartFlag());
		out.writeByte(msg.getStartFlag());
		out.writeByte(msg.getStartFlag());
		out.writeByte(msg.getStartFlag());
	}
}
