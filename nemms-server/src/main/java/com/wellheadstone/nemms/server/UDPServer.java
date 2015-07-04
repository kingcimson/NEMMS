package com.wellheadstone.nemms.server;

import io.netty.bootstrap.Bootstrap;
import io.netty.channel.ChannelOption;
import io.netty.channel.EventLoopGroup;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.nio.NioDatagramChannel;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class UDPServer implements IServer {
	private final static Logger logger = LoggerFactory.getLogger(UDPServer.class);

	@Override
	public void start() {
		int port = this.getPort();

		try {
			this.bind(port);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
	}

	private void bind(int port) throws Exception {
		EventLoopGroup group = new NioEventLoopGroup();
		try {
			Bootstrap b = new Bootstrap();
			b.group(group).channel(NioDatagramChannel.class)
					.option(ChannelOption.SO_BROADCAST, true)
					.handler(new UDPServerHandler());
			b.bind(port).sync().channel().closeFuture().await();
		} finally {
			group.shutdownGracefully();
		}
	}

	private int getPort() {
		int port = 8200;
		try {
			// port =
			// Integer.parseInt(PropertiesUtils.getValue("nemms.server.udp.port"));
		} catch (Exception e) {
			logger.warn("UDP Server Port Parse Error,Set the default port:" + port, e);
		}
		return port;
	}
}
