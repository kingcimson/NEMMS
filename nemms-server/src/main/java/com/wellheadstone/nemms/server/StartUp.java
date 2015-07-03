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
	protected final static SpringContextUtils springContextUtil = new SpringContextUtils();

	public static void main(String[] args) {
		int port = 9000;

		if (args.length > 0) {
			try {
				port = Integer.parseInt(args[0]);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
		}

		try {
			init();
			// new WebSocketServer().run(port);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private static void init() {
		PropertyConfigurator.configure("target/conf/log4j.properties");

		ApplicationContext appContext = new FileSystemXmlApplicationContext("target/conf/app-config.xml");
		springContextUtil.setApplicationContext(appContext);

		PropertiesUtils.configure("target/conf/resource.properties");
		System.out.println(PropertiesUtils.getValue("nemms.server.websocket.port"));
	}
}
