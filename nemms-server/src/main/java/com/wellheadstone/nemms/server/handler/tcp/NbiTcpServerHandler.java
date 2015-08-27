package com.wellheadstone.nemms.server.handler.tcp;

import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.ChannelInboundHandlerAdapter;
import io.netty.channel.socket.SocketChannel;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.wellheadstone.nemms.server.utils.RemoteAdressFormatter;

public class NbiTcpServerHandler extends ChannelInboundHandlerAdapter {
	private final static Logger logger = LoggerFactory.getLogger(NbiTcpServerHandler.class);

	@Override
	public void channelActive(ChannelHandlerContext ctx) throws Exception {
		String clientIP = RemoteAdressFormatter.getIP(ctx.channel().remoteAddress());
		logger.info("NBI [" + clientIP + "] is actived");
		TcpSocketChannelMap.add("nbi", (SocketChannel) ctx.channel());
		super.channelActive(ctx);
	}

	@Override
	public void channelInactive(ChannelHandlerContext ctx) throws Exception {
		String clientIP = RemoteAdressFormatter.getIP(ctx.channel().remoteAddress());
		logger.info("NBI [" + clientIP + "] is inactived");
		TcpSocketChannelMap.remove((SocketChannel) ctx.channel());
	}

	@Override
	public void channelRead(ChannelHandlerContext ctx, Object msg) throws Exception {
		String clientIP = RemoteAdressFormatter.getIP(ctx.channel().remoteAddress());
		logger.info("NBI [" + clientIP + "] data:" + msg);
	}

	@Override
	public void channelReadComplete(ChannelHandlerContext ctx) throws Exception {
		ctx.flush();
	}

	@Override
	public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) throws Exception {
	}
}
