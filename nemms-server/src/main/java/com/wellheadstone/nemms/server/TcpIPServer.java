package com.wellheadstone.nemms.server;

import io.netty.bootstrap.ServerBootstrap;
import io.netty.channel.ChannelFuture;
import io.netty.channel.ChannelInitializer;
import io.netty.channel.ChannelOption;
import io.netty.channel.EventLoopGroup;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.SocketChannel;
import io.netty.channel.socket.nio.NioServerSocketChannel;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.wellheadstone.nemms.common.util.PropertiesUtils;

public class TcpIPServer implements IServer {
	private final static Logger logger = LoggerFactory.getLogger(TcpIPServer.class);

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
		EventLoopGroup bossGroup = new NioEventLoopGroup();
		EventLoopGroup workerGroup = new NioEventLoopGroup();

		try {
			ServerBootstrap b = new ServerBootstrap();
			b.group(bossGroup, workerGroup)
					.channel(NioServerSocketChannel.class)
					.option(ChannelOption.SO_BACKLOG, 1024)
					.childHandler(new ChildChannelHandler());
			ChannelFuture f = b.bind(port).sync();
			f.channel().closeFuture().sync();
		} finally {
			bossGroup.shutdownGracefully();
			workerGroup.shutdownGracefully();
		}
	}

	private class ChildChannelHandler extends ChannelInitializer<SocketChannel> {
		@Override
		protected void initChannel(SocketChannel arg0) throws Exception {
			arg0.pipeline().addLast(new TcpIPServerHandler());
		}
	}

	private int getPort() {
		int port = 8000;
		try {
			port = Integer.parseInt(PropertiesUtils.getValue("nemms.server.tcp.port"));
		} catch (Exception e) {
			logger.warn("TCP Server Port Parse Error,Set the default port:" + port, e);
		}
		return port;
	}
}
