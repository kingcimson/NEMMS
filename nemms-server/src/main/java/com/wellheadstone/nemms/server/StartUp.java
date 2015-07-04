package com.wellheadstone.nemms.server;

import org.apache.log4j.PropertyConfigurator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import com.wellheadstone.nemms.common.util.PropertiesUtils;
import com.wellheadstone.nemms.data.util.SpringContextUtils;

public class StartUp {
	protected final static Logger logger = LoggerFactory.getLogger(StartUp.class);

	public static void main(String[] args) {
		try {
			initializeConfiguration();
			new WebSocketServer().start();
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
}
