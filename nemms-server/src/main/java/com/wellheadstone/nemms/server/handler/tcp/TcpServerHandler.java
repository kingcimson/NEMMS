package com.wellheadstone.nemms.server.handler.tcp;

import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.SimpleChannelInboundHandler;
import io.netty.channel.socket.SocketChannel;

import java.net.InetAddress;

public class TcpServerHandler extends SimpleChannelInboundHandler<String> {
	@Override
	public void channelActive(ChannelHandlerContext ctx) throws Exception {
		System.out.println("RamoteAddress : " + ctx.channel().remoteAddress() + " active !");
		ctx.writeAndFlush("Welcome to " + InetAddress.getLocalHost().getHostName() + " service!\n");
		super.channelActive(ctx);
	}

	@Override
	protected void channelRead0(ChannelHandlerContext ctx, String msg) throws Exception {
		TcpSocketChannelMap.add(ctx.channel().remoteAddress().toString(), (SocketChannel) ctx.channel());
		// 收到消息直接打印输出
		System.out.println(ctx.channel().remoteAddress() + " Say : " + msg);
		// 返回客户端消息 - 我已经接收到了你的消息
		ctx.writeAndFlush("Received your message !\n");
	}
}
