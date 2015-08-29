package com.wellheadstone.nemms.server.handler.socketio;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import com.corundumstudio.socketio.SocketIOClient;

public class SocketIOClientMap {
	private static Map<String, SocketIOClient> map = new ConcurrentHashMap<String, SocketIOClient>(2000);

	public static void add(String clientIP, SocketIOClient socketIOClient) {
		map.put(clientIP, socketIOClient);
	}

	public static SocketIOClient get(String clientIP) {
		return map.get(clientIP);
	}

	public static void remove(String clientIP) {
		map.remove(clientIP);
	}
}
