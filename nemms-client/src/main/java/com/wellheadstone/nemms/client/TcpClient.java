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

import com.wellheadstone.nemms.client.handler.tcp.TcpClientHandler;
import com.wellheadstone.nemms.common.util.PropertiesUtils;

public class TcpClient {
	private final static Logger logger = LoggerFactory.getLogger(TcpClient.class);

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
							// 客户端的逻辑
							pipeline.addLast("handler", new TcpClientHandler());
						}
					});

			Channel ch = b.connect(getIPAddress(), getPort()).sync().channel();
			ch.writeAndFlush("client send data: " + "\r\n");
			/*
			 * int i = 0;
			 * for (;;) {
			 * 
			 * 向服务端发送在控制台输入的文本 并用"\r\n"结尾
			 * 之所以用\r\n结尾 是因为我们在handler中添加了 DelimiterBasedFrameDecoder 帧解码。
			 * 这个解码器是一个根据\n符号位分隔符的解码器。所以每条消息的最后必须加上\n否则无法识别和解码
			 * 
			 * ch.writeAndFlush("client send data: " + i + "\r\n");
			 * TimeUnit.SECONDS.sleep(3);
			 * }
			 */
		} finally {
			group.shutdownGracefully();
		}
	}

	private static String getIPAddress() {
		String ipAddr = "localhost";
		try {
			ipAddr = PropertiesUtils.getValue("nemms.server.ip");
		} catch (Exception e) {
			logger.error("SocketIO Server IP Parse Error,Set the default IP:" + ipAddr, e);
		}
		return ipAddr;
	}

	private static int getPort() {
		int port = 8000;
		try {
			port = Integer.parseInt(PropertiesUtils.getValue("nemms.server.tcp.port"));
		} catch (Exception e) {
			logger.warn("TCP Server Port Parse Error,Set the default port:" + port, e);
		}
		return port;
	}
}
