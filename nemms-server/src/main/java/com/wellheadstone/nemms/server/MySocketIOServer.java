package com.wellheadstone.nemms.server;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.corundumstudio.socketio.Configuration;
import com.corundumstudio.socketio.SocketIOServer;
import com.wellheadstone.nemms.common.util.PropertiesUtils;
import com.wellheadstone.nemms.server.handler.socketio.EventName;
import com.wellheadstone.nemms.server.handler.socketio.ListenerFactory;
import com.wellheadstone.nemms.server.protocol.socketio.SocketIOMessage;

public class MySocketIOServer implements IServer {
	private final static Logger logger = LoggerFactory.getLogger(MySocketIOServer.class);

	@Override
	public void start() {
		Configuration config = new Configuration();
		config.setHostname(this.getIPAddress());
		config.setPort(this.getPort());

		final SocketIOServer server = new SocketIOServer(config);
		server.addEventListener(EventName.GetParamList, SocketIOMessage.class, ListenerFactory.create(EventName.GetParamList));
		server.addEventListener(EventName.QueryALL, SocketIOMessage.class, ListenerFactory.create(EventName.QueryALL));
		server.addEventListener(EventName.QuerySelected, SocketIOMessage.class, ListenerFactory.create(EventName.QuerySelected));
		server.start();

		try {
			Thread.sleep(Integer.MAX_VALUE);
		} catch (InterruptedException e) {
			logger.error(e.getMessage(), e);
		}

		server.stop();
	}

	private String getIPAddress() {
		String ipAddr = "localhost";
		try {
			ipAddr = PropertiesUtils.getValue("nemms.server.ip");
		} catch (Exception e) {
			logger.error("SocketIO Server IP Parse Error,Set the default IP:" + ipAddr, e);
		}
		return ipAddr;
	}

	private int getPort() {
		int port = 9100;
		try {
			port = Integer.parseInt(PropertiesUtils.getValue("nemms.server.socketio.port"));
		} catch (Exception e) {
			logger.error("SocketIO Server Port Parse Error,Set the default port:" + port, e);
		}
		return port;
	}
}
