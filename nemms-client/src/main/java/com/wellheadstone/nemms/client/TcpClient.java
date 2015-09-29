package com.wellheadstone.nemms.client;

import io.netty.bootstrap.Bootstrap;
import io.netty.channel.Channel;
import io.netty.channel.ChannelInitializer;
import io.netty.channel.ChannelOption;
import io.netty.channel.ChannelPipeline;
import io.netty.channel.EventLoopGroup;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.SocketChannel;
import io.netty.channel.socket.nio.NioSocketChannel;

import java.io.IOException;
import java.util.concurrent.TimeUnit;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.wellheadstone.nemms.client.handler.TcpClientHandler;
import com.wellheadstone.nemms.common.util.PropertiesUtils;
import com.wellheadstone.nemms.server.handler.tcp.TcpMessageEncoder;
import com.wellheadstone.nemms.server.message.CMCCFDSMessage;

public class TcpClient {
	private final static Logger logger = LoggerFactory.getLogger(TcpClient.class);

	public static void run() throws InterruptedException, IOException {
		EventLoopGroup group = new NioEventLoopGroup();
		try {
			Bootstrap b = new Bootstrap();
			b.group(group)
					.channel(NioSocketChannel.class)
					.option(ChannelOption.SO_KEEPALIVE, true)
					.handler(new ChannelInitializer<SocketChannel>() {
						@Override
						protected void initChannel(SocketChannel channel) throws Exception {
							ChannelPipeline pipeline = channel.pipeline();
							pipeline.addLast("encoder", new TcpMessageEncoder());
							pipeline.addLast("handler", new TcpClientHandler());
						}
					});

			Channel ch = b.connect(getIPAddress(), getPort()).sync().channel();
			for (;;) {
				sendData(ch);
				TimeUnit.SECONDS.sleep(2);
			}

		} finally {
			group.shutdownGracefully();
		}
	}

	private static void sendData(Channel ch) {
		CMCCFDSMessage message = new CMCCFDSMessage();
		message.setStartFlag((byte) 0x7e);
		message.setAp((byte) 0x03);
		message.setVp((byte) 0x01);
		message.setSiteId(0x02020005);
		message.setDeviceId((byte) 0x00);
		message.setPacketId((short) 0x00);
		message.setVpLayerFlag((byte) 0x80);
		message.setMcp((byte) 0x01);
		message.setCmdId((byte) 0x02);
		message.setRespFlag((byte) 0xff);
		message.setPDU(new byte[] { 0x01, 0x01, 0x00, 0x09, 0x05 });
		message.setEndFlag((byte) 0x7e);
		ch.writeAndFlush(message);
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
