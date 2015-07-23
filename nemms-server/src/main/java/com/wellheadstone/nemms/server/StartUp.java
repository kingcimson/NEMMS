package com.wellheadstone.nemms.server;

import io.netty.channel.Channel;

import java.util.concurrent.TimeUnit;

import org.apache.log4j.PropertyConfigurator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import com.wellheadstone.nemms.common.util.PropertiesUtils;
import com.wellheadstone.nemms.data.util.SpringContextUtils;
import com.wellheadstone.nemms.server.handler.tcp.TcpSocketChannelMap;
import com.wellheadstone.nemms.server.protocol.TcpUdpMessage;

public class StartUp {
	protected final static Logger logger = LoggerFactory.getLogger(StartUp.class);

	public static void main(String[] args) {
		try {
			initializeConfiguration();
			startServers();
		} catch (Exception e) {
			logger.debug(e.toString());
		}
	}

	private static void initializeConfiguration() {
		PropertyConfigurator.configure("target/conf/log4j.properties");

		SpringContextUtils springContextUtil = new SpringContextUtils();
		ApplicationContext appContext = new FileSystemXmlApplicationContext("target/conf/spring.xml");
		springContextUtil.setApplicationContext(appContext);

		PropertiesUtils.configure("target/conf/resource.properties");
	}

	private static void startServers() {
		new Thread(new Runnable() {
			@Override
			public void run() {
				logger.info("Starting MySocketIOServer");
				new MySocketIOServer().start();
			}
		}, "MySocketIOServer").start();

		new Thread(new Runnable() {
			@Override
			public void run() {
				logger.info("Starting TcpIPServer");
				new TcpServer().start();
			}
		}, "TcpIPServer").start();

		new Thread(new Runnable() {
			@Override
			public void run() {
				logger.info("Starting UDPServer");
				new UDPServer().start();
			}
		}, "UDPServer").start();

		new Thread(new Runnable() {
			@Override
			public void run() {
				logger.info("Starting Tcp test");
				TcpUdpMessage message = new TcpUdpMessage();
				message.setStartFlag((byte) 0x7e);
				message.setAp((byte) 0x03);
				message.setVp((byte) 0x01);
				message.setSiteId(0x02020005);
				message.setDeviceId((byte) 0x00);
				message.setVpLayerFlag((byte) 0x80);
				message.setMcp((byte) 0x01);
				message.setCmdId((byte) 0x02);
				message.setRespFlag((byte) 0xff);
				message.setBody(new byte[] { 0x01,0x01,0x00,0x09,0x05 });
				message.setEndFlag((byte) 0x7e);
				message.setPacketId((short)0x00);

				while (true) {
					Channel ch = TcpSocketChannelMap.get("192.168.10.67");
					if (ch != null){
						ch.writeAndFlush(message);
					}
					try {
						TimeUnit.SECONDS.sleep(150);
					} catch (InterruptedException e) {
						e.printStackTrace();
					}
				}

			}
		}, "TcpIPServer Test").start();

	}
}
