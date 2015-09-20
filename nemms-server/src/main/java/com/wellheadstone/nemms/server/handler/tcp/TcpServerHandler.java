package com.wellheadstone.nemms.server.handler.tcp;

import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.ChannelInboundHandlerAdapter;
import io.netty.channel.socket.SocketChannel;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.wellheadstone.nemms.server.domain.service.ServiceFacade;
import com.wellheadstone.nemms.server.message.TcpUdpMessage;
import com.wellheadstone.nemms.server.task.TaskFactory;
import com.wellheadstone.nemms.server.util.RemoteAdressFormatter;

public class TcpServerHandler extends ChannelInboundHandlerAdapter {
	private final static Logger logger = LoggerFactory.getLogger(TcpServerHandler.class);

	@Override
	public void channelActive(ChannelHandlerContext ctx) throws Exception {
		String clientIP = RemoteAdressFormatter.getIP(ctx.channel().remoteAddress());
		logger.info("device[" + clientIP + "] is actived");
		TcpSocketChannelMap.add(clientIP, (SocketChannel) ctx.channel());
		super.channelActive(ctx);
	}

	@Override
	public void channelInactive(ChannelHandlerContext ctx) throws Exception {
		String clientIP = RemoteAdressFormatter.getIP(ctx.channel().remoteAddress());
		logger.info("device[" + clientIP + "] is inactived");
		TcpSocketChannelMap.remove((SocketChannel) ctx.channel());
		ServiceFacade.removeDeviceConnByIP(clientIP);
	}

	@Override
	public void channelRead(ChannelHandlerContext ctx, Object msg) throws Exception {
		TaskFactory.creator(ctx, (TcpUdpMessage) msg).execute();
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
