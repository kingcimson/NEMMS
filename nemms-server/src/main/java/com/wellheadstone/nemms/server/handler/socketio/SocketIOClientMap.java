package com.wellheadstone.nemms.server.handler.socketio;

import java.util.Map;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;

import com.corundumstudio.socketio.SocketIOClient;

public class SocketIOClientMap {
	private static Map<UUID, SocketIOClient> map = new ConcurrentHashMap<UUID, SocketIOClient>(2000);

	public static void add(UUID sessionId, SocketIOClient socketIOClient) {
		map.put(sessionId, socketIOClient);
	}

	public static SocketIOClient get(UUID clientId) {
		return map.get(clientId);
	}

	public static void remove(UUID sessionId) {
		map.remove(sessionId);
	}
}
