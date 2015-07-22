package com.wellheadstone.nemms.server.handler.tcp;

import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.SimpleChannelInboundHandler;
import io.netty.channel.socket.SocketChannel;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class TcpServerHandler extends SimpleChannelInboundHandler<String> {
	private final static Logger logger = LoggerFactory.getLogger(TcpServerHandler.class);

	@Override
	public void channelActive(ChannelHandlerContext ctx) throws Exception {
		logger.info("设备 : " + ctx.channel().remoteAddress() + "连接通道已经激活");
		TcpSocketChannelMap.add("192.168.10.67", (SocketChannel) ctx.channel());
		super.channelActive(ctx);
	}

	@Override
	protected void channelRead0(ChannelHandlerContext ctx, String msg) throws Exception {
		logger.info("接收到设备: " + ctx.channel().remoteAddress() + "的数据：" + msg);
		ctx.writeAndFlush("Received your message !\n");
	}
}
