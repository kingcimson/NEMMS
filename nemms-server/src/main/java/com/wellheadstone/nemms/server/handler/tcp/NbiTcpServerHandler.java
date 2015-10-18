package com.wellheadstone.nemms.server.handler.tcp;

import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.ChannelInboundHandlerAdapter;
import io.netty.channel.socket.SocketChannel;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.wellheadstone.nemms.server.collection.TcpChannelMap;
import com.wellheadstone.nemms.server.util.SocketAddressUtils;

public class NbiTcpServerHandler extends ChannelInboundHandlerAdapter {
	private final static Logger logger = LoggerFactory.getLogger(NbiTcpServerHandler.class);

	@Override
	public void channelActive(ChannelHandlerContext ctx) throws Exception {
		String ip = SocketAddressUtils.getIP(ctx.channel().remoteAddress());
		Integer port = SocketAddressUtils.getPort(ctx.channel().remoteAddress());
		logger.info("nbi device [{}:{}] is actived", ip, port);
		TcpChannelMap.add("nbi", (SocketChannel) ctx.channel());
		super.channelActive(ctx);
	}

	@Override
	public void channelInactive(ChannelHandlerContext ctx) throws Exception {
		String ip = SocketAddressUtils.getIP(ctx.channel().remoteAddress());
		Integer port = SocketAddressUtils.getPort(ctx.channel().remoteAddress());
		logger.info("nbi device [{}:{}] is inactived", ip, port);
		TcpChannelMap.remove("nbi");
	}

	@Override
	public void channelRead(ChannelHandlerContext ctx, Object msg) throws Exception {
		logger.info("receive from nbi device [{}] data:{}", ctx.channel().remoteAddress(), msg);
	}

	@Override
	public void channelReadComplete(ChannelHandlerContext ctx) throws Exception {
		ctx.flush();
	}

	@Override
	public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) throws Exception {
		logger.error("nbi exception {}:{}", ctx.channel().remoteAddress(), cause);
	}
}
