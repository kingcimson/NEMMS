package com.wellheadstone.nemms.client;

import io.netty.bootstrap.Bootstrap;
import io.netty.channel.Channel;
import io.netty.channel.ChannelInitializer;
import io.netty.channel.ChannelPipeline;
import io.netty.channel.EventLoopGroup;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.SocketChannel;
import io.netty.channel.socket.nio.NioSocketChannel;
import io.netty.handler.codec.DelimiterBasedFrameDecoder;
import io.netty.handler.codec.Delimiters;
import io.netty.handler.codec.string.StringDecoder;
import io.netty.handler.codec.string.StringEncoder;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.wellheadstone.nemms.client.handler.tcp.NbiTcpClientHandler;
import com.wellheadstone.nemms.common.util.PropertiesUtils;

public class NbiTcpClient {
	private final static Logger logger = LoggerFactory.getLogger(NbiTcpClient.class);

	public static void run() throws InterruptedException, IOException {
		EventLoopGroup group = new NioEventLoopGroup();
		try {
			Bootstrap b = new Bootstrap();
			b.group(group)
					.channel(NioSocketChannel.class)
					.handler(new ChannelInitializer<SocketChannel>() {
						@Override
						protected void initChannel(SocketChannel channel) throws Exception {
							ChannelPipeline pipeline = channel.pipeline();
							pipeline.addLast("framer", new DelimiterBasedFrameDecoder(8192, Delimiters.lineDelimiter()));
							pipeline.addLast("decoder", new StringDecoder());
							pipeline.addLast("encoder", new StringEncoder());
							pipeline.addLast("handler", new NbiTcpClientHandler());
						}
					});

			Channel ch = b.connect(getIPAddress(), getPort()).sync().channel();
			ch.closeFuture().sync();
		} finally {
			group.shutdownGracefully();
		}
	}

	private static String getIPAddress() {
		String ipAddr = "localhost";
		try {
			ipAddr = PropertiesUtils.getValue("nemms.server.ip");
		} catch (Exception e) {
			logger.error("Nbi SocketIO Server IP Parse Error,Set the default IP:" + ipAddr, e);
		}
		return ipAddr;
	}

	private static int getPort() {
		int port = 8001;
		try {
			port = Integer.parseInt(PropertiesUtils.getValue("nemms.server.nbi.port"));
		} catch (Exception e) {
			logger.error("Nbi TCP Server Port Parse Error,Set the default port:" + port, e);
		}
		return port;
	}
}
