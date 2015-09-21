package com.wellheadstone.nemms.client;

import io.netty.bootstrap.Bootstrap;
import io.netty.buffer.ByteBuf;
import io.netty.buffer.Unpooled;
import io.netty.channel.Channel;
import io.netty.channel.ChannelInitializer;
import io.netty.channel.ChannelOption;
import io.netty.channel.EventLoopGroup;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.DatagramChannel;
import io.netty.channel.socket.nio.NioDatagramChannel;
import io.netty.handler.codec.DelimiterBasedFrameDecoder;

import java.io.IOException;
import java.util.concurrent.TimeUnit;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.wellheadstone.nemms.common.util.PropertiesUtils;
import com.wellheadstone.nemms.server.handler.udp.UDPServerHandler;
import com.wellheadstone.nemms.server.handler.udp.UdpMessageDecoder;
import com.wellheadstone.nemms.server.handler.udp.UdpMessageEncoder;
import com.wellheadstone.nemms.server.message.CMCCFDSMessage;

public class UdpClient {
	private final static Logger logger = LoggerFactory.getLogger(TcpClient.class);

	public static void run() throws InterruptedException, IOException {
		EventLoopGroup group = new NioEventLoopGroup();
		try {
			Bootstrap b = new Bootstrap();
			b.group(group)
					.channel(NioDatagramChannel.class)
					.option(ChannelOption.SO_BROADCAST, true)
					.handler(new ChannelInitializer<DatagramChannel>() {
						@Override
						protected void initChannel(DatagramChannel channel) throws Exception {
							channel.pipeline().addLast("framer", new DelimiterBasedFrameDecoder(8192,
									new ByteBuf[] { Unpooled.wrappedBuffer(new byte[] { 0x7e }) }));
							channel.pipeline().addLast("decoder", new UdpMessageDecoder());
							channel.pipeline().addLast("encoder", new UdpMessageEncoder());
							channel.pipeline().addLast("handler", new UDPServerHandler());
						}
					});
			Channel ch = b.connect(getIPAddress(), getPort()).sync().channel();
			for (;;) {
				sendData(ch);
				TimeUnit.SECONDS.sleep(10);
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
			logger.error("udp Server IP Parse Error,Set the default IP:" + ipAddr, e);
		}
		return ipAddr;
	}

	private static int getPort() {
		int port = 8001;
		try {
			port = Integer.parseInt(PropertiesUtils.getValue("nemms.server.udp.port"));
		} catch (Exception e) {
			logger.warn("udp Server Port Parse Error,Set the default port:" + port, e);
		}
		return port;
	}
}
