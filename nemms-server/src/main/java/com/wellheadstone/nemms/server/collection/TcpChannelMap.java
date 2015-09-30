package com.wellheadstone.nemms.server.collection;

import io.netty.channel.Channel;
import io.netty.channel.socket.SocketChannel;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public class TcpChannelMap {
	private static Map<String, SocketChannel> map = new ConcurrentHashMap<String, SocketChannel>(200);

	public static void add(String key, SocketChannel socketChannel) {
		map.put(key, socketChannel);
	}

	public static Channel get(String key) {
		return map.get(key);
	}

	public static void remove(String key) {
		map.remove(key);
	}
}
