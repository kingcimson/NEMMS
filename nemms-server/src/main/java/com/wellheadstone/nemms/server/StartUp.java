package com.wellheadstone.nemms.server;

import org.apache.log4j.PropertyConfigurator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import com.wellheadstone.nemms.common.util.PropertiesUtils;
import com.wellheadstone.nemms.data.util.SpringContextUtils;
import com.wellheadstone.nemms.server.domain.service.ServiceFacade;

public class StartUp {
	protected final static Logger logger = LoggerFactory.getLogger(StartUp.class);
	private final static String configPath = "target/";

	public static void main(String[] args) {
		try {
			initializeConfiguration();
			initData();
			startServers();
		} catch (Exception e) {
			logger.debug(e.toString());
		}
	}

	private static void initializeConfiguration() {
		PropertyConfigurator.configure(configPath + "conf/log4j.properties");

		SpringContextUtils springContextUtil = new SpringContextUtils();
		ApplicationContext appContext = new FileSystemXmlApplicationContext(configPath + "conf/spring.xml");
		springContextUtil.setApplicationContext(appContext);

		PropertiesUtils.configure(configPath + "conf/resource.properties");
	}

	private static void initData() {
		ServiceFacade.loadData();
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
				logger.info("Starting NbiServer");
				new NbiTcpServer().start();
			}
		}, "NbiServer").start();
	}
}
