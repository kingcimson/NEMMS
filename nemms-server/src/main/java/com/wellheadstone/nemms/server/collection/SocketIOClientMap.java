package com.wellheadstone.nemms.server.collection;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import com.wellheadstone.nemms.server.handler.socketio.SocketIOClientRequest;
import com.wellheadstone.nemms.server.message.CMCCFDSMessage;

public class SocketIOClientMap {
	private static Map<String, SocketIOClientRequest> map = new ConcurrentHashMap<String, SocketIOClientRequest>(200);

	public static synchronized void add(CMCCFDSMessage message, SocketIOClientRequest clientRequest) {
		if (map.containsKey(message.getKey())) {
			short packetId = map.get(message.getKey()).getPacketId();
			message.setPacketId(++packetId);
		}
		clientRequest.setPacketId(message.getPacketId());
		clientRequest.getData().setRequestText(message.toString());
		map.put(message.getKey(), clientRequest);
	}

	public static SocketIOClientRequest get(String key) {
		return map.get(key);
	}

	public static void remove(String key) {
		map.remove(key);
	}

	public static boolean wait(String key, long timeount) {
		SocketIOClientRequest request = map.get(key);
		if (request == null) {
			return false;
		}

		long beginTime = System.currentTimeMillis();
		long elapseTime = 0;

		do {
			long nowTime = System.currentTimeMillis();
			elapseTime = nowTime - beginTime;
		} while (elapseTime < timeount && !request.isFinished());

		return request.isFinished();
	}
}
