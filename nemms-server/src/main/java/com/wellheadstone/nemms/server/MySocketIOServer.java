package com.wellheadstone.nemms.server;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.corundumstudio.socketio.AckRequest;
import com.corundumstudio.socketio.Configuration;
import com.corundumstudio.socketio.SocketIOClient;
import com.corundumstudio.socketio.SocketIOServer;
import com.corundumstudio.socketio.listener.DataListener;
import com.wellheadstone.nemms.common.util.PropertiesUtils;
import com.wellheadstone.nemms.server.message.Message;

public class MySocketIOServer implements IServer {
	private final static Logger logger = LoggerFactory.getLogger(MySocketIOServer.class);

	@Override
	public void start() {
		Configuration config = new Configuration();
		config.setHostname("192.168.10.128");
		config.setPort(this.getPort());

		final SocketIOServer server = new SocketIOServer(config);
		server.addEventListener("findAll", Message.class, new DataListener<Message>() {
			@Override
			public void onData(SocketIOClient client, Message data, AckRequest ackRequest) {
				data.setResponseText("findAll Response");
				server.getBroadcastOperations().sendEvent("findAll", data);
			}
		});

		server.addEventListener("getParams", Message.class, new DataListener<Message>() {
			@Override
			public void onData(SocketIOClient client, Message data, AckRequest ackRequest) {
				data.setResponseText("getParams Response");
				server.getBroadcastOperations().sendEvent("getParams", data);
			}
		});

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
			port = Integer.parseInt(PropertiesUtils.getValue("nemms.server.socketio.port"));
		} catch (Exception e) {
			logger.error("SocketIO Server Port Parse Error,Set the default port:" + port, e);
		}
		return port;
	}
}
