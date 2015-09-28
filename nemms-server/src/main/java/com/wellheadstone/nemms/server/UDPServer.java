package com.wellheadstone.nemms.server;

import io.netty.bootstrap.Bootstrap;
import io.netty.channel.ChannelFuture;
import io.netty.channel.ChannelInitializer;
import io.netty.channel.ChannelOption;
import io.netty.channel.EventLoopGroup;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.DatagramChannel;
import io.netty.channel.socket.nio.NioDatagramChannel;
import io.netty.util.concurrent.Future;
import io.netty.util.concurrent.FutureListener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.wellheadstone.nemms.server.handler.udp.UDPServerHandler;
import com.wellheadstone.nemms.server.handler.udp.UdpMessageDecoder;
import com.wellheadstone.nemms.server.handler.udp.UdpMessageEncoder;
import com.wellheadstone.nemms.server.handler.udp.UdpSocketChannelMap;

public class UDPServer implements IServer {
	private final static Logger logger = LoggerFactory.getLogger(UDPServer.class);

	@Override
	public String getName() {
		return "UDPServer";
	}

	@Override
	public void start() {
		try {
			this.bind(Config.getServerIP(), Config.getUdpPort());
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
	}

	private void bind(String ip, int port) throws Exception {
		EventLoopGroup group = new NioEventLoopGroup();
		try {
			Bootstrap b = new Bootstrap();
			b.group(group)
					.channel(NioDatagramChannel.class)
					.option(ChannelOption.SO_BROADCAST, true)
					.handler(new ChildChannelHandler());

			ChannelFuture f = b.bind(ip, port).addListener(new FutureListener<Void>() {
				@Override
				public void operationComplete(Future<Void> future) throws Exception {
					if (future.isSuccess()) {
						logger.info("UDP server started at port: {}", port);
					} else {
						logger.info("UDP server start failed at port: {}", port);
					}
				}
			}).sync();
			UdpSocketChannelMap.add(ip, (DatagramChannel) f.channel());
			f.channel().closeFuture().sync();
		} finally {
			group.shutdownGracefully();
		}
	}

	private class ChildChannelHandler extends ChannelInitializer<DatagramChannel> {
		@Override
		protected void initChannel(DatagramChannel channel) throws Exception {
			channel.pipeline().addLast("decoder", new UdpMessageDecoder());
			channel.pipeline().addLast("encoder", new UdpMessageEncoder());
			channel.pipeline().addLast("handler", new UDPServerHandler());
		}
	}
}
