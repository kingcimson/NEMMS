package com.wellheadstone.nemms.server.handler.udp;

import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.ChannelInboundHandlerAdapter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.wellheadstone.nemms.server.util.RemoteAdressFormatter;

public class UDPServerHandler extends ChannelInboundHandlerAdapter {
	private final static Logger logger = LoggerFactory.getLogger(UDPServerHandler.class);

	@Override
	public void channelActive(ChannelHandlerContext ctx) throws Exception {
		String clientIP = RemoteAdressFormatter.getIP(ctx.channel().remoteAddress());
		logger.info("device[" + clientIP + "] is actived");
	}

	@Override
	public void channelInactive(ChannelHandlerContext ctx) throws Exception {
		String clientIP = RemoteAdressFormatter.getIP(ctx.channel().remoteAddress());
		logger.info("device[" + clientIP + "] is inactived");
	}

	@Override
	public void channelRead(ChannelHandlerContext ctx, Object msg) throws Exception {
		ctx.fireChannelRead(msg);
	}

	@Override
	public void channelReadComplete(ChannelHandlerContext ctx) throws Exception {
		ctx.flush();
	}

	@Override
	public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) throws Exception {
	}
}
