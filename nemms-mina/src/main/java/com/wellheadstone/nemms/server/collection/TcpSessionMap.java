package com.wellheadstone.nemms.server.collection;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.apache.mina.core.session.IoSession;

public class TcpSessionMap {
	private static Map<String, IoSession> map = new ConcurrentHashMap<String, IoSession>(200);

	public static void add(String clientId, IoSession session) {
		map.put(clientId, session);
	}

	public static IoSession get(String key) {
		return map.get(key);
	}

	public static void remove(String key) {
		map.remove(key);
	}
}
