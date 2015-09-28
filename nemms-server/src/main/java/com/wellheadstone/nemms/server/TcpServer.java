package com.wellheadstone.nemms.server;

import io.netty.bootstrap.ServerBootstrap;
import io.netty.buffer.ByteBuf;
import io.netty.buffer.Unpooled;
import io.netty.channel.ChannelFuture;
import io.netty.channel.ChannelInitializer;
import io.netty.channel.ChannelOption;
import io.netty.channel.EventLoopGroup;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.SocketChannel;
import io.netty.channel.socket.nio.NioServerSocketChannel;
import io.netty.handler.codec.DelimiterBasedFrameDecoder;
import io.netty.util.concurrent.Future;
import io.netty.util.concurrent.FutureListener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.wellheadstone.nemms.server.handler.tcp.TcpMessageDecoder;
import com.wellheadstone.nemms.server.handler.tcp.TcpMessageEncoder;
import com.wellheadstone.nemms.server.handler.tcp.TcpServerHandler;

public class TcpServer implements IServer {
	private final static Logger logger = LoggerFactory.getLogger(TcpServer.class);

	@Override
	public String getName() {
		return "TcpServer";
	}

	@Override
	public void start() {
		try {
			this.bind(Config.getServerIP(), Config.getTcpPort());
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
	}

	private void bind(String ip, int port) throws Exception {
		EventLoopGroup bossGroup = new NioEventLoopGroup();
		EventLoopGroup workerGroup = new NioEventLoopGroup();

		try {
			ServerBootstrap b = new ServerBootstrap();
			b.group(bossGroup, workerGroup)
					.channel(NioServerSocketChannel.class)
					.option(ChannelOption.TCP_NODELAY, true)
					.option(ChannelOption.SO_KEEPALIVE, true)
					.childHandler(new ChildChannelHandler());
			ChannelFuture f = b.bind(ip, port).addListener(new FutureListener<Void>() {
				@Override
				public void operationComplete(Future<Void> future) throws Exception {
					if (future.isSuccess()) {
						logger.info("TCP server started at port: {}", port);
					} else {
						logger.info("TCP server start failed at port: {}", port);
					}
				}
			}).sync();
			f.channel().closeFuture().sync();
		} finally {
			bossGroup.shutdownGracefully();
			workerGroup.shutdownGracefully();
		}
	}

	private class ChildChannelHandler extends ChannelInitializer<SocketChannel> {
		@Override
		protected void initChannel(SocketChannel channel) throws Exception {
			channel.pipeline().addLast("framer", new DelimiterBasedFrameDecoder(8192,
					new ByteBuf[] { Unpooled.wrappedBuffer(new byte[] { 0x7e }) }));
			channel.pipeline().addLast("decoder", new TcpMessageDecoder());
			channel.pipeline().addLast("encoder", new TcpMessageEncoder());
			channel.pipeline().addLast("handler", new TcpServerHandler());
		}
	}
}
