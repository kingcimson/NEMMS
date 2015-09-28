package com.wellheadstone.nemms.server;

import io.netty.channel.ChannelFuture;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.corundumstudio.socketio.Configuration;
import com.corundumstudio.socketio.SocketIOServer;
import com.wellheadstone.nemms.server.handler.socketio.EventName;
import com.wellheadstone.nemms.server.handler.socketio.ListenerFactory;
import com.wellheadstone.nemms.server.message.SocketIOMessage;

public class MySocketIOServer implements IServer {
	private final static Logger logger = LoggerFactory.getLogger(MySocketIOServer.class);

	@Override
	public String getName() {
		return "MySocketIOServer";
	}

	@Override
	public void start() {
		Configuration config = new Configuration();
		config.setHostname(Config.getServerIP());
		config.setPort(Config.getSocketIOPort());

		final SocketIOServer server = new SocketIOServer(config);
		server.addEventListener(EventName.GetParamList, SocketIOMessage.class,
				ListenerFactory.create(EventName.GetParamList));
		server.addEventListener(EventName.QueryALL, SocketIOMessage.class,
				ListenerFactory.create(EventName.QueryALL));
		server.addEventListener(EventName.QuerySelected, SocketIOMessage.class,
				ListenerFactory.create(EventName.QuerySelected));
		server.addEventListener(EventName.Settings, SocketIOMessage.class,
				ListenerFactory.create(EventName.Settings));

		try {
			ChannelFuture future = (ChannelFuture) server.startAsync().sync();
			future.channel().closeFuture().sync();
		} catch (InterruptedException e) {
			logger.error(e.getMessage(), e);
		} finally {
			server.stop();
		}
	}

}
