package com.wellheadstone.nemms.server;

import io.netty.bootstrap.Bootstrap;
import io.netty.buffer.ByteBuf;
import io.netty.buffer.Unpooled;
import io.netty.channel.ChannelFuture;
import io.netty.channel.ChannelInitializer;
import io.netty.channel.ChannelOption;
import io.netty.channel.EventLoopGroup;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.DatagramChannel;
import io.netty.channel.socket.nio.NioDatagramChannel;
import io.netty.handler.codec.DelimiterBasedFrameDecoder;
import io.netty.util.concurrent.Future;
import io.netty.util.concurrent.FutureListener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.wellheadstone.nemms.common.util.PropertiesUtils;
import com.wellheadstone.nemms.server.handler.udp.UDPServerHandler;
import com.wellheadstone.nemms.server.handler.udp.UdpMessageDecoder;
import com.wellheadstone.nemms.server.handler.udp.UdpMessageEncoder;

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
			f.channel().closeFuture().sync();
		} finally {
			group.shutdownGracefully();
		}
	}

	private class ChildChannelHandler extends ChannelInitializer<DatagramChannel> {
		@Override
		protected void initChannel(DatagramChannel channel) throws Exception {
			channel.pipeline().addLast("framer", new DelimiterBasedFrameDecoder(8192,
					new ByteBuf[] { Unpooled.wrappedBuffer(new byte[] { 0x7e }) }));
			channel.pipeline().addLast("decoder", new UdpMessageDecoder());
			channel.pipeline().addLast("encoder", new UdpMessageEncoder());
			channel.pipeline().addLast("handler", new UDPServerHandler());
		}
	}

	private String getIPAddress() {
		String ipAddr = "localhost";
		try {
			ipAddr = PropertiesUtils.getValue("nemms.server.ip").trim();
		} catch (Exception e) {
			logger.error("UDP Server IP Parse Error,Set the default IP:" + ipAddr, e);
		}
		return ipAddr;
	}

	private int getPort() {
		int port = 8001;
		try {
			port = Integer.parseInt(PropertiesUtils.getValue("nemms.server.udp.port").trim());
		} catch (Exception e) {
			logger.error("UDP Server Port Parse Error,Set the default port:" + port, e);
		}
		return port;
	}
}
