package com.wellheadstone.nemms.server;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.corundumstudio.socketio.Configuration;
import com.corundumstudio.socketio.SocketIOServer;
import com.wellheadstone.nemms.common.util.PropertiesUtils;
import com.wellheadstone.nemms.server.socketio.EventName;
import com.wellheadstone.nemms.server.socketio.EventRequest;
import com.wellheadstone.nemms.server.socketio.ListenerFactory;

public class MySocketIOServer implements IServer {
	private final static Logger logger = LoggerFactory
			.getLogger(MySocketIOServer.class);

	@Override
	public void start() {
		Configuration config = new Configuration();
		config.setHostname("localhost");
		config.setPort(this.getPort());

		final SocketIOServer server = new SocketIOServer(config);
		server.addEventListener(EventName.GetParamList, EventRequest.class,
				ListenerFactory.create(EventName.GetParamList));
		server.addEventListener(EventName.QueryALL, EventRequest.class,
				ListenerFactory.create(EventName.QueryALL));
		server.addEventListener(EventName.QuerySelected, EventRequest.class,
				ListenerFactory.create(EventName.QuerySelected));

		server.start();

		try {
			Thread.sleep(Integer.MAX_VALUE);
		} catch (InterruptedException e) {
			logger.error(e.getMessage(), e);
		}

		server.stop();
	}

	private int getPort() {
		int port = 9100;
		try {
			port = Integer.parseInt(PropertiesUtils
					.getValue("nemms.server.socketio.port"));
		} catch (Exception e) {
			logger.error(
					"SocketIO Server Port Parse Error,Set the default port:"
							+ port, e);
		}
		return port;
	}
}
