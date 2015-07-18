package com.wellheadstone.nemms.server;

import io.netty.bootstrap.Bootstrap;
import io.netty.channel.ChannelOption;
import io.netty.channel.EventLoopGroup;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.nio.NioDatagramChannel;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.wellheadstone.nemms.common.util.PropertiesUtils;
import com.wellheadstone.nemms.server.handler.udp.UDPServerHandler;

public class UDPServer implements IServer {
	private final static Logger logger = LoggerFactory.getLogger(UDPServer.class);

	@Override
	public void start() {
		int port = this.getPort();

		try {
			this.bind(this.getIPAddress(), port);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
	}

	private void bind(String ip, int port) throws Exception {
		EventLoopGroup group = new NioEventLoopGroup();
		try {
			Bootstrap b = new Bootstrap();
			b.group(group).channel(NioDatagramChannel.class)
					.option(ChannelOption.SO_BROADCAST, true)
					.handler(new UDPServerHandler());
			b.bind(ip, port).sync().channel().closeFuture().await();
		} finally {
			group.shutdownGracefully();
		}
	}

	private String getIPAddress() {
		String ipAddr = "localhost";
		try {
			ipAddr = PropertiesUtils.getValue("nemms.server.ip");
		} catch (Exception e) {
			logger.error("UDP Server IP Parse Error,Set the default IP:" + ipAddr, e);
		}
		return ipAddr;
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
