package com.wellheadstone.nemms.server.handler.tcp;

import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.ChannelInboundHandlerAdapter;
import io.netty.channel.socket.SocketChannel;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.wellheadstone.nemms.server.protocol.TcpUdpMessage;

public class TcpServerHandler extends ChannelInboundHandlerAdapter {
	private final static Logger logger = LoggerFactory.getLogger(TcpServerHandler.class);

	@Override
	public void channelActive(ChannelHandlerContext ctx) throws Exception {
		logger.info("设备 : " + ctx.channel().remoteAddress() + "连接通道已经激活");
		TcpSocketChannelMap.add("client1", (SocketChannel) ctx.channel());
		super.channelActive(ctx);
	}

	@Override
	public void channelRead(ChannelHandlerContext ctx, Object msg) throws Exception {
		//logger.info("接收到设备:[" + ctx.channel().remoteAddress() + "]的数据：" + message);
	}

	@Override
	public void channelReadComplete(ChannelHandlerContext ctx) throws Exception {
		ctx.flush();
	}

	@Override
	public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) throws Exception {
	}
}
