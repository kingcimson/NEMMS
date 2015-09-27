package com.wellheadstone.nemms.server.handler.udp;

import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.ChannelInboundHandlerAdapter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.wellheadstone.nemms.server.message.CMCCFDSMessage;
import com.wellheadstone.nemms.server.task.TaskFactory;
import com.wellheadstone.nemms.server.util.SocketAddressUtils;

public class UDPServerHandler extends ChannelInboundHandlerAdapter {
	private final static Logger logger = LoggerFactory.getLogger(UDPServerHandler.class);

	@Override
	public void channelActive(ChannelHandlerContext ctx) throws Exception {
		String ip = SocketAddressUtils.getIP(ctx.channel().remoteAddress());
		Integer port = SocketAddressUtils.getPort(ctx.channel().remoteAddress());
		logger.info("udp device [{}:{}] is actived", ip, port);
	}

	@Override
	public void channelInactive(ChannelHandlerContext ctx) throws Exception {
		String ip = SocketAddressUtils.getIP(ctx.channel().remoteAddress());
		Integer port = SocketAddressUtils.getPort(ctx.channel().remoteAddress());
		logger.info("udp device [{}:{}] is inactived", ip, port);
	}

	@Override
	public void channelRead(ChannelHandlerContext ctx, Object msg) throws Exception {
		TaskFactory.creator(ctx, (CMCCFDSMessage) msg).execute();
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
