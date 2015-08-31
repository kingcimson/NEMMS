package com.wellheadstone.nemms.server;

import io.netty.bootstrap.ServerBootstrap;
import io.netty.buffer.ByteBuf;
import io.netty.buffer.Unpooled;
import io.netty.channel.Channel;
import io.netty.channel.ChannelFuture;
import io.netty.channel.ChannelInitializer;
import io.netty.channel.ChannelOption;
import io.netty.channel.EventLoopGroup;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.SocketChannel;
import io.netty.channel.socket.nio.NioServerSocketChannel;
import io.netty.handler.codec.DelimiterBasedFrameDecoder;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.wellheadstone.nemms.common.util.PropertiesUtils;
import com.wellheadstone.nemms.server.handler.tcp.TcpServerHandler;
import com.wellheadstone.nemms.server.message.TcpUdpMessageDecoder;
import com.wellheadstone.nemms.server.message.TcpUdpMessageEncoder;

public class TcpServer implements IServer {
	private final static Logger logger = LoggerFactory.getLogger(TcpServer.class);
	private Channel channel;

	@Override
	public void start() {
		int port = this.getPort();

		try {
			this.bind(this.getIPAddress(), port);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
	}

	public Channel getChannel() {
		return this.channel;
	}

	private void bind(String ip, int port) throws Exception {
		EventLoopGroup bossGroup = new NioEventLoopGroup();
		EventLoopGroup workerGroup = new NioEventLoopGroup();

		try {
			ServerBootstrap b = new ServerBootstrap();
			b.group(bossGroup, workerGroup).channel(NioServerSocketChannel.class)
					.option(ChannelOption.TCP_NODELAY, true).option(ChannelOption.SO_KEEPALIVE, true)
					.childHandler(new ChildChannelHandler());
			ChannelFuture f = b.bind(ip, port).sync();
			this.channel = f.channel();
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
			channel.pipeline().addLast("decoder", new TcpUdpMessageDecoder());
			channel.pipeline().addLast("encoder", new TcpUdpMessageEncoder());
			channel.pipeline().addLast("handler", new TcpServerHandler());
		}
	}

	private String getIPAddress() {
		String ipAddr = "localhost";
		try {
			ipAddr = PropertiesUtils.getValue("nemms.server.ip").trim();
		} catch (Exception e) {
			logger.error("TCP Server IP Parse Error,Set the default IP:" + ipAddr, e);
		}
		return ipAddr;
	}

	private int getPort() {
		int port = 8000;
		try {
			port = Integer.parseInt(PropertiesUtils.getValue("nemms.server.tcp.port").trim());
		} catch (Exception e) {
			logger.error("TCP Server Port Parse Error,Set the default port:" + port, e);
		}
		return port;
	}
}
