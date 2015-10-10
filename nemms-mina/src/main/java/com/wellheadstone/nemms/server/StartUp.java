package com.wellheadstone.nemms.server;

import java.util.List;

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
	private final static String configPath = "";

	public static void main(String[] args) {
		try {
			initConfig();
			initData();
			startServers();
		} catch (Exception e) {
			logger.debug(e.toString());
		}
	}

	private static void initConfig() {
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
		logger.info("server started at ip: {}", Config.getServerIP());
		List<IServer> servers = new MinaServerGroup().getServers();
		for (IServer server : servers) {
			new Thread(new Runnable() {
				@Override
				public void run() {
					server.start();
				}
			}, server.getName()).start();
		}
	}
}
